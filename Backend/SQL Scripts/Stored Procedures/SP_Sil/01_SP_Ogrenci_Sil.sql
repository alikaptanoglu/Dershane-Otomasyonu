create proc SP_Ogrenci_Sil @ogr_id int
as

	declare @varmi int

	Select @varmi=ogr_id from ogrenci where (ogr_id=@ogr_id)

	if (@varmi is null)
	BEGIN
		Select 'Böyle bir öðrenci bulunmamakta...'
		RETURN -1
	END

	Delete from ogrenci_detay where ogr_id=@ogr_id

GO