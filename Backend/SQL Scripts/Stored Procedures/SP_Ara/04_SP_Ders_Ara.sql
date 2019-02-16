Create Proc SP_Ders_Ara
@kelime nvarchar(30)
AS

Select 
	
	d.ders_id,
	d.ders_ad,
	d.ders_seviye,
	h.hoca_ad as Veren_Hoca_Ad,
	h.hoca_soyad as Veren_Hoca_Soyad,
	h.hoca_tc as Veren_Hoca_TC
	
	
from 

dersler d

left join  hoca_dersleri hd on d.ders_id=hd.ders_id
left join  hoca h on hd.hoca_id=h.hoca_id
where (
	
	d.ders_ad like '%'+@kelime+'%' or 
	d.ders_seviye like '%'+@kelime+'%' or 
	h.hoca_ad like '%'+@kelime+'%' or 
	h.hoca_soyad like '%'+@kelime+'%' or 
	h.hoca_tc like '%'+@kelime+'%' 
	
	)