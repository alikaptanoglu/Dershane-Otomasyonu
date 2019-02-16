Create PROC SP_Hoca_Ders_Sil 
	
		@hoca_tc char(11),
		@ders_id int
AS
	
		declare @hoca_id int,@dersvarmi int

		Select @hoca_id=hoca_id from hoca where (hoca_tc=@hoca_tc)
		
		--hoca var mý
		if(@hoca_id is null)
		BEGIN
			SELECT 'Hoca bulunamadý...'
			RETURN -1
		END
		
		--ders var mý
		select @dersvarmi=ders_id from dersler where (ders_id=@ders_id )
	
		if(@dersvarmi is null)
		BEGIN
			Select 'Ders Bulunamadý...'
			RETURN -1
		END


		--hoca_dersleri sil.
		delete from hoca_dersleri where (ders_id=@ders_id and hoca_id=@hoca_id)

	