--öğrenci ekleme yerinde, seviye girildikten sonra şubeler seçeneğine aşağıdan dönenler eklenir.
Create proc SP_Subeler_Ara
@seviye nvarchar(2)
AS

Select 

sube_harf

from sube 
where (sube_seviye=@seviye)

GO