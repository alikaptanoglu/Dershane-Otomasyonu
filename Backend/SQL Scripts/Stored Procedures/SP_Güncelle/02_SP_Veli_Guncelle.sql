create proc SP_Veli_Guncelle
	@ogr_id int,
	
	@yeni_veli_tc char(11),
	@yeni_veli_ad nvarchar(30),
	@yeni_veli_soyad nvarchar(30),
	@yeni_veli_tel char(10)

as

set @yeni_veli_ad = upper(SUBSTRING(@yeni_veli_ad,1,1))+LOWER(SUBSTRING(@yeni_veli_ad,2,len(@yeni_veli_ad)-1))
set @yeni_veli_soyad = upper(SUBSTRING(@yeni_veli_soyad,1,1))+LOWER(SUBSTRING(@yeni_veli_soyad,2,len(@yeni_veli_soyad)-1))

	--öðrenci var mý : öðrenci var sa veli_id ' si elimize gelir , veli id yi olup olmadýðýný sordururuz. farketmez.
	declare @veli_id int
	Select @veli_id=veli_id from ogrenci where (ogr_id=@ogr_id)
	if(@veli_id is null)
	BEGIN
		Select 'Belirtilen Veli Bulunamadý...(Öðrenci Olmayabilir.)'
		return -1
	END
	-- veli_id ' almýþ olduk
	
	
	

	-- veriler boþ girilmiþse default olarak eski verileri alalým
	if(@yeni_veli_ad is null)
	BEGIN
		Select @yeni_veli_ad=veli_ad from veli where (veli_id=@veli_id)
	END

	if(@yeni_veli_soyad is null)
	BEGIN
		Select @yeni_veli_soyad=veli_soyad from veli where (veli_id=@veli_id)
	END
	if(@yeni_veli_tel is null)
	BEGIN
		Select @yeni_veli_tel=veli_tel from veli where (veli_id=@veli_id)
	END

	-- update yapýlýr
	UPDATE veli set veli_ad=@yeni_veli_ad,veli_soyad=@yeni_veli_soyad,veli_tel=@yeni_veli_tel,veli_tc=@yeni_veli_tc where veli_id=@veli_id

