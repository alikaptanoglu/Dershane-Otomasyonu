CREATE PROC SP_Dersler_Ekle 
@ad nvarchar(20),
@seviye nvarchar(2)

AS
	
set @ad = upper(SUBSTRING(@ad,1,1))+LOWER(SUBSTRING(@ad,2,len(@ad)-1))
	Declare @id int
	
	Select @id=ders_id FROM dersler WHERE (ders_ad=@ad AND ders_seviye=@seviye)

	IF(@id is null) -- BÖyle bir der daha önce girildi mi
	BEGIN--girilmediyse
		INSERT INTO dersler (ders_ad,ders_seviye) VALUES (@ad,@seviye)
	END
	ELSE
	BEGIN -- girildiyse
		SELECT 'Bu Ders Zaten Var...'
	END
