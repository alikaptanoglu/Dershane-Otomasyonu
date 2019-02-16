CREATE PROC SP_Hoca_Sil 
	
	@hoca_id nvarchar(30)

AS

	Declare @varmi int

	Select @varmi = hoca_id from hoca where (hoca_id=@hoca_id)

	if (@varmi is null)
	BEGIN
		Select 'böyle bir hoca bulunamadý...'
		RETURN -1
	END

	--hocanýn sahip olduðu bütün hoca_dersleri silinir
	delete from hoca_dersleri where (hoca_id=@hoca_id)

	--hoca silinir

	delete from hoca where hoca_id=@hoca_id