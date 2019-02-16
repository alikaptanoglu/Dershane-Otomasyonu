
	---------------------------------------------------------- DENEME PROCEDURE ----------------------------------------------

	CREATE PROC SP_Deneme_Ekle 

	@deneme_seviye nvarchar(2),	
	@deneme_tarih date
AS
	
	--Seviye(hi� �ube) var m�
	Declare @ogrsayisi int
	Select @ogrsayisi=count(ogr_id) from ogrenci where (sube_id in (select sube_id from sube where (sube_seviye=@deneme_seviye)))
	if(@ogrsayisi=0)
	BEGIN
		Select 'Belirtilen seviyede ��renci bulunamamakta.'
		Return -1
	END

	---- daha �nce b�yle bir s�nav yap�ld� m� sor
	Declare @deneme_id int
	Select @deneme_id=deneme_id from deneme where(deneme_seviye=@deneme_seviye and deneme_tarih=@deneme_tarih)
	IF(@deneme_id is not null)
	BEGIN
		Select 'B�yle bir s�nav zaten eklendi...'
		RETURN -1
	END
	
	

	----t�m ogrenci verisini �ekip s�nav id ile birle�tirip s�nav eklendi�i anda t�m ogrencilerin record'lar� puan tablosuna eklenebilirdi ama bilgim yetmedi 
	----oyuzden sadece deneme s�nav�n� a�t���m�zla kalacaz a�a��daki gibi. bu durumunda s�nav� ekledikten sonra her ��renci i�in puan �n� tektek girecez

	INSERT INTO deneme(deneme_seviye,deneme_tarih) values(@deneme_seviye,@deneme_tarih) -- Denemeyi ekledik.
	
	SELECT @deneme_id = SCOPE_IDENTITY() -- eklenen denemenin ID 'si al�nd� -> ��renci_deneme ' eklemeleri i�in.
	
	
	
	
	---- ��RENC�_DENEMELER 'i ekleniyor...
	

		declare @ogr_id int
 
			declare cursor1 cursor for SELECT ogr_id from ogrenci where (sube_id in (select sube_id from sube where (sube_seviye=@deneme_seviye)))

				OPEN cursor1

					FETCH NEXT FROM cursor1 INTO @ogr_id

						WHILE @@FETCH_STATUS = 0
							BEGIN
			 
							    -- PUANLAMA ��LEMLER� �NCES� ��LEMLER...
								
									---- Zaten ��rencinin puan� eklenmi� mi?
										Declare @ogrenci_deneme_id int
										Select @ogrenci_deneme_id=ogrenci_deneme_id from ogrenci_deneme where(deneme_id=@deneme_id and ogr_id=@ogr_id)
										IF(@ogrenci_deneme_id is not null)
											BEGIN
												Select 'Bu ��rencinin bu s�nav da zaten puan kayd� var...'
												CONTINUE; -- S�radaki ��renciye ge�ilir.
											END
										ELSE
											BEGIN
												---- ��renci puan�n� ekle
												-- ��renci netleri rastgele olu�turulup belli bir katsay�yla �arp�l�p hesaplanacakt�r.
												-- Burada her deneme i�in net giri�i �n y�zden uzun zaman alaca��ndan b�yle bir yola gidildi.
												--mat : 40 - 5 puan ---- 200
												--T�rk�e 40 - 4.5  ---- 180
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

												SET @Lower = 0     -- En d���k random net
												SET @Upper = 40    -- En y�ksek random Net

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