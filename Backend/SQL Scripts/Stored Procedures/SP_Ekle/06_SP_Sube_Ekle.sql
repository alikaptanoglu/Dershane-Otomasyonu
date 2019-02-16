CREATE PROC SP_Sube_Ekle 

	@sube_harf nvarchar(1),
	@sube_seviye nvarchar(2),

	@alan_ad nvarchar(3) -- alan id 'sini bulacaz

AS
	---- Alan sorgulama
	Declare @alan_id int
	Select @alan_id=alan_id from alan where (alan_ad=@alan_ad)

	IF(@alan_id is null)
	BEGIN
		Select 'belirtilen alan bulunamad�'
		Return -1
	END

	---- �nceden girildi mi kontrol? zaten unique ' koyduk ama t�rk�e hata mesaj� vermek i�in sorduruyoruz.

	Declare @sube_id int
	select @sube_id=sube_id from sube where( sube_harf=@sube_harf and sube_seviye=@sube_seviye and alan_id = @alan_id)

	IF(@sube_id is null)
	BEGIN
		INSERT INTO  sube (sube_harf,sube_seviye,alan_id) values (@sube_harf,@sube_seviye,@alan_id)
	END
	ELSE
	BEGIN
		Select 'B�yle bir �ube zaten bulunmakta'
	END

GO