create procedure SP_Devamsizlik_Sil
@ogr_id int,
@tarih date

AS

	delete from devamsizlik where (ogr_id=@ogr_id and tarih=@tarih)
	
GO