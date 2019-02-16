/* ogrenci_detay tablosundan bir ogrenci silindiðinde silinen_ogrenince_detay tablosunu eklenir.
Bu bir insert iþlemi oldugundan silinen_ogrenci_detay tablosuna insert olayý gerçekleþtiðinde biz
1-ogrenci_devamsizlik bilgilerini komple siliceðiz.
2-ogrenci_deneme bilgilerini komple siliceðiz.
3-Bu bilgileri sildikten sonra ogrenci tablosunu silebiliriz. */

---

CREATE TRIGGER TG_silinen_ogrenci_detay_tablosuna_ekleme_olunca ON silinen_ogrenci_detay AFTER INSERT
AS
	DECLARE @ogr_id INT
	SELECT @ogr_id = inserted.ogr_id FROM inserted
	PRINT('hELLOOO')
	DELETE FROM devamsizlik WHERE ogr_id=@ogr_id
	DELETE FROM ogrenci_deneme WHERE ogr_id=@ogr_id
	DELETE FROM ogrenci WHERE ogr_id= @ogr_id

