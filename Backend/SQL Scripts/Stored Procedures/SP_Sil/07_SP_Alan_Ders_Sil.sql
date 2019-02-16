Create PROC SP_Alan_Ders_Sil 
	
		@alan_dersleri_id int
AS
	
		declare @varmi int
		
		select @varmi=alan_dersleri_id from alan_dersleri where (alan_dersleri_id=@alan_dersleri_id)
	
		if(@varmi is null)
		BEGIN
			Select 'Ders Bulunamadý...'
			RETURN -1
		END


		--alan dersi sil.
		delete from alan_dersleri where (alan_dersleri_id=@alan_dersleri_id)


