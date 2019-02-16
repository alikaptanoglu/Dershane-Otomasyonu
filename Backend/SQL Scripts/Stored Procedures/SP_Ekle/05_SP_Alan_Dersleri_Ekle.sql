CREATE PROC SP_Alan_Dersleri_Ekle 

	@ders_id int,

	@alan_ad nvarchar(3) -- alan id sini bulmak i�in

AS
	---- bahsetti�i Ders var m� kontrol edelim
	Declare @dersvarmi int
	SELECT @dersvarmi=ders_id FROM dersler WHERE (ders_id=@ders_id )

	
	
	IF (@dersvarmi is null)
	BEGIN
		SELECT 'Girilen ders bulunmamakta...'
		RETURN -1
	END
		
	---- bahsetti�i ALAN var m� kontrol edelim
	Declare @alan_id int
	SELECT @alan_id=alan_id FROM alan WHERE (alan_ad=@alan_ad)

	IF (@alan_id is null)
	BEGIN
		SELECT 'Girilen alan bulunmamakta...'
		RETURN -1
	END

	----girilen ders 9.s�n�f dersi ise alan� direkt olarak '-' girdirt.
	
	Declare @seviye nvarchar(2)
	Select @seviye=ders_seviye from dersler where (ders_id=@ders_id)
	if(@seviye='9')
		Set @alan_id = 1
	
	---- ders ve alan varsa , bu iki kayd� Alan_Dersleri'ne eklemeye �al��al�m, ama ya daha �nceden eklendiyse ? bunu sorgulayal�p yoksa akabinin de ekleyelim, varsa hata verdirelim

	Declare @alan_dersleri_id int
	Select @alan_dersleri_id=alan_dersleri_id FROM alan_dersleri WHERE ( alan_id=@alan_id AND ders_id=@ders_id)

	IF (@alan_dersleri_id is null)
	BEGIN
		INSERT INTO alan_dersleri (alan_id,ders_id) VALUES (@alan_id,@ders_id)
	END
	ELSE
	BEGIN
		Select 'Bu ders zaten bu alana eklenmi�...'
	END
GO



