create proc SP_Kitap_Sil 

@kitap_id int

as

	declare @varmi int

	Select @varmi=kitap_id from kitaplar where (kitap_id= @kitap_id)

	if(@varmi is null)
	BEGIN
		Select 'Böyle bir kitap bulunmamakta'
		RETURN -1
	END

	delete from kitaplar where kitap_id=@kitap_id