Create Proc SP_Bugun_Gelmeyenler
AS
declare @tarih date
set @tarih= getdate()

Select
	
	v.veli_tel,
	o.ogr_id,
	o.ogr_ad,
	o.ogr_soyad
	
	
From devamsizlik d inner join ogrenci o on d.ogr_id=o.ogr_id inner join veli v on o.veli_id=v.veli_id
where d.tarih = @tarih

