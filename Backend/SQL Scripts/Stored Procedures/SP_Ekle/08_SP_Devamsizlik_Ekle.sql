CREATE PROC SP_Devamsizlik_Ekle 

	@ogr_id int, -- ÖÐRENCÝNÝN OKUL NUMARASI...
	@tarih date

AS
	----ogrenci var mý sorgula
	declare @ogr int
	Select @ogr=ogr_id from ogrenci where(ogr_id=@ogr_id)
	IF(@ogr is null)
	BEGIN
		Select 'Öðrenci Bulunamadý'
		RETURN -1
	END

	----ayný öðrenci ayný tarih de gelmediði kayýtý daha önce girilmiþ mi sorgula
	declare @varmi int
	Select @varmi=ogr_id from devamsizlik where(ogr_id=@ogr and tarih=@tarih)
	IF(@varmi is not null)
	BEGIN
		Select 'Bu öðrencinin Bu tarihte gelmediði zaten girilmiþ.'
		RETURN -1
	END

	----gelmediði günü ekle
	INSERT INTO devamsizlik (ogr_id,tarih) values(@ogr,@tarih)
