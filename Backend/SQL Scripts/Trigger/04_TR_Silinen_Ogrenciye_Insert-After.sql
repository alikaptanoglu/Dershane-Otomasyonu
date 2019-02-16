--- Silinen_ogrenci tablosuna insert i�lemi ger�ekle�ti�inde veliyi kontrollu bir �ekildi silmememiz gerekir.
-- Velinin Ba�ka �ocu�u var ise silmemeliyiz. E�er dershaneye kay�tl� ba�ka ��rencisi yoksa silmememiz gerekir.

CREATE TRIGGER TG_Silinen_ogrenciye_ekleme_oldugunda_Veliyi_kontrol_et ON silinen_ogrenci AFTER INSERT
AS
	DECLARE @veli_id int
	SELECT @veli_id=inserted.veli_id FROM inserted-- �nce silenen_o�renci tablosuna yap�lan en son ekleme kullan�l�rak inserted tablosundan ogrrencinin veli_id sini elimize almam�z gerekir.
	
	DECLARE @Ogrenci_sayi int
	-- velinin sahip oldu�u ��renci say�s� al�n�r
	SELECT @Ogrenci_sayi=count(ogr_id) from ogrenci where (veli_id=@veli_id) 
	SELECT @Ogrenci_sayi

	DECLARE 
			@veli_ad NVARCHAR(30),
			@veli_soyad NVARCHAR(30),
			@veli_tel NVARCHAR(10),
			@veli_tc CHAR(11)

	SELECT @veli_ad = veli_ad,@veli_soyad = veli_soyad,@veli_tel = veli_tel ,@veli_tc = veli_tc FROM veli WHERE (veli_id=@veli_id)
	
	IF(@Ogrenci_sayi = 0) -- Velinin ��renci say�s� s�f�r ise veli silinir ve silinen_ogrenci tablosuna eklenir.
		BEGIN 
			--Silmeden �nce veliye silinen_veli tablosuna ekleyelim.

			

			INSERT INTO silinen_veli (veli_id,veli_ad,veli_soyad,veli_tel,veli_tc)
			VALUES (@veli_id,@veli_ad,@veli_soyad,@veli_tel,@veli_tc)

			DELETE FROM veli WHERE veli_id=@veli_id -- ve burda veliyi silelim.
		END
	ELSE -- Ba�ka ��rencisi var ise veli silinmez. // Yeni : Ama ��rencinin velisini, ��renciyi �ekti�imizde yine de g�rmek i�in, hatta ��renciyi geri y�klerken, ayn� veliyi , ger�ek veli tablosunda bulup otomatik onun id sini almas� i�in , silinenveli yeveliyi aktar�r�z.
		BEGIN
			SELECT 'Veliye kay�tl� ba�ka ��renci oldu�undan veli tablosundan veli silinmedi ama silinenlere eklendi.'
			INSERT INTO silinen_veli (veli_id,veli_ad,veli_soyad,veli_tel,veli_tc)
			VALUES (@veli_id,@veli_ad,@veli_soyad,@veli_tel,@veli_tc)
		END

	