

--- ogrenci tablosunda bir silme i�lemi ger�ekle�tir�inde olacak i�lemler.
--- 1  : Silinen kay�t silienen_ogrenci tablosuna eklenir.
--- 2  : Veli ontrolu yap�l�r.

CREATE TRIGGER TR_Ogrenc_tablosunda_bir_silme_oldugunda ON ogrenci AFTER DELETE
AS
	
	DECLARE @ogr_id INT -- Silinen ��renciyi elimize ald�k.
	SELECT @ogr_id = deleted.ogr_id FROM deleted

	DECLARE
	@ogr_tc CHAR(11),
	@ogr_ad NVARCHAR(20),
	@ogr_soyad NVARCHAR(20),
	@Veli_id INT,
	@Sube_id INT

	SELECT
	@ogr_tc = deleted.ogr_tc,
	@ogr_ad = deleted.ogr_ad,
	@ogr_soyad = deleted.ogr_soyad,
	@Veli_id = deleted.veli_id,
	@Sube_id = deleted.sube_id
	FROM deleted

	INSERT INTO silinen_ogrenci(ogr_id,ogr_tc,ogr_ad,ogr_soyad,Veli_id,Sube_id)
	VALUES (@ogr_id,@ogr_tc,@ogr_ad,@ogr_soyad,@Veli_id,@Sube_id) --silinen_ogrenci tablosuna bilgiler eklendi.


