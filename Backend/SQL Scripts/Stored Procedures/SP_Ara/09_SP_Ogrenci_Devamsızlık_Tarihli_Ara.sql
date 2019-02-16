create procedure SP_Devamsizlik_Tarihli_Ara

@tarih date
AS

	select 
		o.ogr_id as Öğrenci_Numara,
		o.ogr_ad as Öğrenci_İsim,
		o.ogr_soyad as Öğrenci_Soyad,
		d.tarih as Devamsızlık_Tarihi
	
	from devamsizlik d inner join ogrenci o on d.ogr_id=o.ogr_id
	where d.tarih=@tarih
	
GO