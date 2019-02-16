create view VW_Siniflar
AS

Select 
s.sube_id as 'Şube Sırası',
s.sube_seviye as 'Seviye',
s.sube_harf as 'Şube',
a.alan_ad as 'Alanı'
from sube s
inner join alan a on s.alan_id = a.alan_id

go