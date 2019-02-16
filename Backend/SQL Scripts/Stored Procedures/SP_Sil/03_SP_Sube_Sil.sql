create proc SP_Sube_Sil @sube_seviye nvarchar(2),@sube_harf char(1)

as

	declare @sube_id int

	Select @sube_id=sube_id from sube where (sube_seviye=@sube_seviye and sube_harf= @sube_harf)

	if(@sube_id is null)
	BEGIN
		Select 'B�yle bir �ube bulunmamakta...'
		RETURN -1
	END

	declare @sube_ogrenci_sayi int

	Select @sube_ogrenci_sayi = count(ogr_id) from ogrenci where (sube_id=@sube_id)

	if(@sube_ogrenci_sayi > 0)
	BEGIN
		Select '�ube silinemez, �ubeye ait ��renci bulunmakta...'
		RETURN -1
	END


	delete from sube where sube_id=@sube_id