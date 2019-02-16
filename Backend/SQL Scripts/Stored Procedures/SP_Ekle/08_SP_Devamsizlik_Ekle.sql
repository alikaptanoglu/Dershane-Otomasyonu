CREATE PROC SP_Devamsizlik_Ekle 

	@ogr_id int, -- ��RENC�N�N OKUL NUMARASI...
	@tarih date

AS
	----ogrenci var m� sorgula
	declare @ogr int
	Select @ogr=ogr_id from ogrenci where(ogr_id=@ogr_id)
	IF(@ogr is null)
	BEGIN
		Select '��renci Bulunamad�'
		RETURN -1
	END

	----ayn� ��renci ayn� tarih de gelmedi�i kay�t� daha �nce girilmi� mi sorgula
	declare @varmi int
	Select @varmi=ogr_id from devamsizlik where(ogr_id=@ogr and tarih=@tarih)
	IF(@varmi is not null)
	BEGIN
		Select 'Bu ��rencinin Bu tarihte gelmedi�i zaten girilmi�.'
		RETURN -1
	END

	----gelmedi�i g�n� ekle
	INSERT INTO devamsizlik (ogr_id,tarih) values(@ogr,@tarih)
