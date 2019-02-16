
	---------------------------------------------------------- DENEME PROCEDURE ----------------------------------------------

	CREATE PROC SP_Deneme_Ekle 

	@deneme_seviye nvarchar(2),	
	@deneme_tarih date
AS
	
	--Seviye(hiç þube) var mý
	Declare @ogrsayisi int
	Select @ogrsayisi=count(ogr_id) from ogrenci where (sube_id in (select sube_id from sube where (sube_seviye=@deneme_seviye)))
	if(@ogrsayisi=0)
	BEGIN
		Select 'Belirtilen seviyede öðrenci bulunamamakta.'
		Return -1
	END

	---- daha önce böyle bir sýnav yapýldý mý sor
	Declare @deneme_id int
	Select @deneme_id=deneme_id from deneme where(deneme_seviye=@deneme_seviye and deneme_tarih=@deneme_tarih)
	IF(@deneme_id is not null)
	BEGIN
		Select 'Böyle bir sýnav zaten eklendi...'
		RETURN -1
	END
	
	

	----tüm ogrenci verisini çekip sýnav id ile birleþtirip sýnav eklendiði anda tüm ogrencilerin record'larý puan tablosuna eklenebilirdi ama bilgim yetmedi 
	----oyuzden sadece deneme sýnavýný açtýðýmýzla kalacaz aþaðýdaki gibi. bu durumunda sýnavý ekledikten sonra her öðrenci için puan ýný tektek girecez

	INSERT INTO deneme(deneme_seviye,deneme_tarih) values(@deneme_seviye,@deneme_tarih) -- Denemeyi ekledik.
	
	SELECT @deneme_id = SCOPE_IDENTITY() -- eklenen denemenin ID 'si alýndý -> öðrenci_deneme ' eklemeleri için.
	
	
	
	
	---- ÖÐRENCÝ_DENEMELER 'i ekleniyor...
	

		declare @ogr_id int
 
			declare cursor1 cursor for SELECT ogr_id from ogrenci where (sube_id in (select sube_id from sube where (sube_seviye=@deneme_seviye)))

				OPEN cursor1

					FETCH NEXT FROM cursor1 INTO @ogr_id

						WHILE @@FETCH_STATUS = 0
							BEGIN
			 
							    -- PUANLAMA ÝÞLEMLERÝ ÖNCESÝ ÝÞLEMLER...
								
									---- Zaten öðrencinin puaný eklenmiþ mi?
										Declare @ogrenci_deneme_id int
										Select @ogrenci_deneme_id=ogrenci_deneme_id from ogrenci_deneme where(deneme_id=@deneme_id and ogr_id=@ogr_id)
										IF(@ogrenci_deneme_id is not null)
											BEGIN
												Select 'Bu öðrencinin bu sýnav da zaten puan kaydý var...'
												CONTINUE; -- Sýradaki öðrenciye geçilir.
											END
										ELSE
											BEGIN
												---- öðrenci puanýný ekle
												-- Öðrenci netleri rastgele oluþturulup belli bir katsayýyla çarpýlýp hesaplanacaktýr.
												-- Burada her deneme için net giriþi Ön yüzden uzun zaman alacaðýndan böyle bir yola gidildi.
												--mat : 40 - 5 puan ---- 200
												--Türkçe 40 - 4.5  ---- 180
												--Sosyal 40 - 1.50 ---- 60
												--Fen 40 - 1.5 ---- 60
												DECLARE 
												@ygs_puan_1 FLOAT,
												@ygs_puan_2 FLOAT,
												@ygs_puan_3 FLOAT,
												@ygs_puan_4 FLOAT,
												@ygs_puan_5 FLOAT,
												@ygs_puan_6 FLOAT

												DECLARE @Upper INT;
												DECLARE @Lower INT;

												DECLARE @turkce_net FLOAT,
														@sosyal_net FLOAT,
														@matematik_net FLOAT,
														@fen_net FLOAT

												SET @Lower = 0     -- En düþük random net
												SET @Upper = 40    -- En yüksek random Net

												SELECT @turkce_net =  (SELECT @Lower + CONVERT(FLOAT, (@Upper-@Lower)*RAND()))
												SELECT @sosyal_net =(SELECT @Lower + CONVERT(FLOAT, (@Upper-@Lower)*RAND()))
												SELECT @matematik_net = (SELECT @Lower + CONVERT(FLOAT, (@Upper-@Lower)*RAND()))
												SELECT @fen_net = (SELECT @Lower + CONVERT(FLOAT, (@Upper-@Lower)*RAND()))

							--					SELECT @turkce_net,@sosyal_net,@matematik_net,@fen_net

												SELECT @ygs_puan_1 = 140 + @matematik_net*4 + @turkce_net*1.5 + @sosyal_net*1.5 + @fen_net*2
												SELECT @ygs_puan_2 = 140 + @matematik_net*4 + @turkce_net*1.5 + @sosyal_net*1 + @fen_net*2.5
												SELECT @ygs_puan_3 = 140 + @matematik_net*4 + @turkce_net*2.5 + @sosyal_net*1.5 + @fen_net*1
												SELECT @ygs_puan_4 = 140 + @matematik_net*3.5 + @turkce_net*3 + @sosyal_net*1.5 + @fen_net*1
												SELECT @ygs_puan_5 = 140 + @matematik_net*2 + @turkce_net*4 + @sosyal_net*2 + @fen_net*1
												SELECT @ygs_puan_6 = 140 + @matematik_net*1 + @turkce_net*4 + @sosyal_net*3 + @fen_net*1

							--					SELECT @ygs_puan_1 AS YGS1 ,@ygs_puan_2 AS YGS2 ,@ygs_puan_3 AS YGS3,@ygs_puan_4 AS YGS4,@ygs_puan_5 AS YGS5,@ygs_puan_6 AS YGS6

												-- puanlar eklenir.
								
												INSERT INTO ogrenci_deneme (deneme_id,ogr_id,turkce_net,sosyal_net,matematik_net,fen_net,puan_ygs_1,puan_ygs_2,puan_ygs_3,puan_ygs_4,puan_ygs_5,puan_ygs_6)
												values(@deneme_id,@ogr_id,round(@turkce_net,4),round(@sosyal_net,4),round(@matematik_net,4),round(@fen_net,4),round(@ygs_puan_1,4),round(@ygs_puan_2,4),round(@ygs_puan_3,4),round(@ygs_puan_4,4),round(@ygs_puan_5,4),round(@ygs_puan_6,4)) 
																
											END
										
							
								FETCH NEXT FROM cursor1 INTO @ogr_id
							END
				CLOSE cursor1

			DEALLOCATE cursor1
			
GO