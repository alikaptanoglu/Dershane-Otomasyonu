
CREATE TRIGGER TG_Ogr_detay_sililince ON ogrenci_detay AFTER DELETE 
AS
	DECLARE @ogr_id INT
	SELECT @ogr_id = deleted.ogr_id FROM deleted

	-- Ogrenci varmý yokmu kontrol edelim. yoksa bunu bildirilim. varsa bu ogrencnin diðer bilgilerini tetikliyelim.
	IF (@ogr_id IS NULL)
	BEGIN
		SELECT 'Öðrenci Bulunamadý.'
	END
	ELSE
	BEGIN	
		DECLARE @ogr_tel NVARCHAR(10),
		@ogr_adres NVARCHAR(50),
		@ogr_okul NVARCHAR(30),
		@ogr_kayit_tar DATE,
		@ogr_dogum_tar DATE,
		@ogr_ucret INT

		SELECT @ogr_tel = deleted.ogr_tel,
		@ogr_adres = deleted.ogr_adres,
		@ogr_okul = deleted.ogr_okul,
		@ogr_kayit_tar = deleted.ogr_kayit_tar,
		@ogr_dogum_tar = deleted.ogr_dogum_tar,
		@ogr_ucret = deleted.ogr_ucret
		FROM deleted

		INSERT INTO silinen_ogrenci_detay(ogr_id,ogr_tel,ogr_adres,ogr_okul,ogr_kayit_tar,ogr_dogum_tar,ogr_ucret)
		VALUES(@ogr_id,@ogr_tel,@ogr_adres,@ogr_okul,@ogr_kayit_tar,@ogr_dogum_tar,@ogr_ucret)
	END
	