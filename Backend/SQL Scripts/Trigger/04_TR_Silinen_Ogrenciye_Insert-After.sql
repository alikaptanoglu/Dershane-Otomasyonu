--- Silinen_ogrenci tablosuna insert iþlemi gerçekleþtiðinde veliyi kontrollu bir þekildi silmememiz gerekir.
-- Velinin Baþka çocuðu var ise silmemeliyiz. Eðer dershaneye kayýtlý baþka öðrencisi yoksa silmememiz gerekir.

CREATE TRIGGER TG_Silinen_ogrenciye_ekleme_oldugunda_Veliyi_kontrol_et ON silinen_ogrenci AFTER INSERT
AS
	DECLARE @veli_id int
	SELECT @veli_id=inserted.veli_id FROM inserted-- önce silenen_oðrenci tablosuna yapýlan en son ekleme kullanýlýrak inserted tablosundan ogrrencinin veli_id sini elimize almamýz gerekir.
	
	DECLARE @Ogrenci_sayi int
	-- velinin sahip olduðu öðrenci sayýsý alýnýr
	SELECT @Ogrenci_sayi=count(ogr_id) from ogrenci where (veli_id=@veli_id) 
	SELECT @Ogrenci_sayi

	DECLARE 
			@veli_ad NVARCHAR(30),
			@veli_soyad NVARCHAR(30),
			@veli_tel NVARCHAR(10),
			@veli_tc CHAR(11)

	SELECT @veli_ad = veli_ad,@veli_soyad = veli_soyad,@veli_tel = veli_tel ,@veli_tc = veli_tc FROM veli WHERE (veli_id=@veli_id)
	
	IF(@Ogrenci_sayi = 0) -- Velinin öðrenci sayýsý sýfýr ise veli silinir ve silinen_ogrenci tablosuna eklenir.
		BEGIN 
			--Silmeden önce veliye silinen_veli tablosuna ekleyelim.

			

			INSERT INTO silinen_veli (veli_id,veli_ad,veli_soyad,veli_tel,veli_tc)
			VALUES (@veli_id,@veli_ad,@veli_soyad,@veli_tel,@veli_tc)

			DELETE FROM veli WHERE veli_id=@veli_id -- ve burda veliyi silelim.
		END
	ELSE -- Baþka öðrencisi var ise veli silinmez. // Yeni : Ama öðrencinin velisini, öðrenciyi çektiðimizde yine de görmek için, hatta öðrenciyi geri yüklerken, ayný veliyi , gerçek veli tablosunda bulup otomatik onun id sini almasý için , silinenveli yeveliyi aktarýrýz.
		BEGIN
			SELECT 'Veliye kayýtlý baþka öðrenci olduðundan veli tablosundan veli silinmedi ama silinenlere eklendi.'
			INSERT INTO silinen_veli (veli_id,veli_ad,veli_soyad,veli_tel,veli_tc)
			VALUES (@veli_id,@veli_ad,@veli_soyad,@veli_tel,@veli_tc)
		END

	