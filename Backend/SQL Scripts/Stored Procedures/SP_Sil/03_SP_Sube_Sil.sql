create proc SP_Sube_Sil @sube_seviye nvarchar(2),@sube_harf char(1)

as

	declare @sube_id int

	Select @sube_id=sube_id from sube where (sube_seviye=@sube_seviye and sube_harf= @sube_harf)

	if(@sube_id is null)
	BEGIN
		Select 'Böyle bir þube bulunmamakta...'
		RETURN -1
	END

	declare @sube_ogrenci_sayi int

	Select @sube_ogrenci_sayi = count(ogr_id) from ogrenci where (sube_id=@sube_id)

	if(@sube_ogrenci_sayi > 0)
	BEGIN
		Select 'Þube silinemez, Þubeye ait öðrenci bulunmakta...'
		RETURN -1
	END


	delete from sube where sube_id=@sube_id