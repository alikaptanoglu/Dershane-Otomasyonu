
CREATE PROCEDURE SP_Veli_Ogrenci_ekle
    @veli_ad nvarchar(30),-- Veli bilgileri
	@veli_soyad nvarchar(30),
	@veli_tel char(10) ,
	@veli_tc char(11) ,


	@ogr_tc char(11), -- Ogrenci
	@ogr_ad nvarchar(30),
	@ogr_soyad nvarchar(30),
	

	@ogr_seviye nvarchar(2),
	@ogr_harf nvarchar(1),

	@ogr_tel char(10),-- Ogrenci_Detay
	@ogr_adres nvarchar(60),
	@ogr_okul nvarchar(50),
	@ogr_kayit_tar date,
	@ogr_dogum_tar date,
	@ogr_ucret int
	
AS

set @veli_ad = upper(SUBSTRING(@veli_ad,1,1))+LOWER(SUBSTRING(@veli_ad,2,len(@veli_ad)-1))
set @veli_soyad = upper(SUBSTRING(@veli_soyad,1,1))+LOWER(SUBSTRING(@veli_soyad,2,len(@veli_soyad)-1))
set @ogr_ad = upper(SUBSTRING(@ogr_ad,1,1))+LOWER(SUBSTRING(@ogr_ad,2,len(@ogr_ad)-1))
set @ogr_soyad = upper(SUBSTRING(@ogr_soyad,1,1))+LOWER(SUBSTRING(@ogr_soyad,2,len(@ogr_soyad)-1))


	-- Veli daha �nce eklenmi�mi kontrol etmemiz gerekir.
	DECLARE @Veli_id INT
	

	SELECT @Veli_id = veli_id FROM veli WHERE (veli_tel=@veli_tel and veli_tc=@veli_tc) -- Veli id'sini elimize ald�k.

	IF(@Veli_id IS NULL) -- Veli id' si null ise veli daha once eklenememi�tir. eklememiz gerekir.
		BEGIN -- veli yoksa veli eklenir , 
			-- ama, ya ayn� tc veya ayn� telefon daha �nce kullan�lm��sa ? , bunu a�a��da kontrol ederiz ::: YEN� - > Emreninki Fix
			Declare @varmi1 int,@varmi2 int 
			Select @varmi1=veli_id from veli where (veli_tel=@veli_tel)
			Select @varmi2=veli_id from veli where (veli_tc=@veli_tc)
			if(@varmi1 is not null or @varmi2 is not null)
			BEGIN
				Select 'Belirtilen Tc veya Telefon Ba�ka bir velide kullan�lm�� Ayn�s� Girilemez.'
				Return -1
			END
			-- Veli eklenir.
			INSERT INTO veli(veli_ad,veli_soyad,veli_tel,veli_tc)
			VALUES (@veli_ad,@veli_soyad,@veli_tel,@veli_tc)
			SELECT @Veli_id = SCOPE_IDENTITY() -- Biraz �nce ol�turdu�umuz velinin id'sini elimize almam�za yard�mc� olur.
		END
	ELSE -- E�er @veli_id NULL de�ilse daha �nce bu veli var demektir. bizde o�rencimizi bu veliye ekleyece�iz.
		BEGIN
			-- �nce var olan velinin id'sini elimze alal�m.
			Select @veli_id = veli_id from veli where(veli_tel=@veli_tel) -- Var olan velinin id'sini elimze ald�k.
		END


	--  Ogrenci Ekleme : �lk �nce ��rencinin eklendi�i sube varm� kontrol edelim.

		-- Sube Kontrolu:
		DECLARE 
			@sube_id INT
			SELECT @sube_id = sube_id FROM sube WHERE (sube_seviye =  @ogr_seviye AND  sube_harf = @ogr_harf)
			IF(@sube_id IS NULL)
				BEGIN
					--Sube bulunamad�, de�i�kenlere NULL ver.
					SELECT @ogr_seviye=NULL
					SELECT @ogr_harf=NULL
				END
			
			-- Sube Bulunursa ��renciyi ekleyebilirim.Bulunmazsa Default De�er OLARAK NULL ile eklenir:  sonradan seviyesi harfi girilebilir.
			
					DECLARE @ogr_id INT
					SELECT @ogr_id = ogr_id FROM ogrenci WHERE (ogr_tc = @ogr_tc) -- ��rencinin id'sini elimze ald�k.
					IF(@ogr_id IS NOT NULL)
						BEGIN
							SELECT '��renci Zaten Kay�tl�'
							RETURN -1
					END
					ELSE
						BEGIN
						
						 --- ��renci eklenir.
							INSERT INTO ogrenci (ogr_tc,ogr_ad,ogr_soyad,veli_id,sube_id) VALUES (@ogr_tc,@ogr_ad,@ogr_soyad,@veli_id,@sube_id)
							SELECT @ogr_id = SCOPE_IDENTITY()-- bi �nceki sat�rda olu�an verinin identity tip s�tunu de�erini al�r.
						--- ��renci detay eklenir.
							INSERT INTO ogrenci_detay (ogr_id,ogr_tel,ogr_adres,ogr_okul,ogr_kayit_tar,ogr_dogum_tar,ogr_ucret)
							VALUES(@ogr_id,@ogr_tel,@ogr_adres,@ogr_okul,@ogr_kayit_tar,@ogr_dogum_tar,@ogr_ucret)


						END
				

