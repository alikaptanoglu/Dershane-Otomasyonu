--seviye bilgisinden sonra gelen şube harfin sonrasında alan adını çekmek için.
Create proc SP_Alan_Ara
@seviye nvarchar(2),
@harf nvarchar(1)
AS
Select alan_ad from alan where alan_id=(select alan_id from sube where (sube_seviye=@seviye and sube_harf=@harf))
GO