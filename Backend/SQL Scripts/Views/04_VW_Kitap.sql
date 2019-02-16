create view  VW_Kitap

AS

Select 

	k.kitap_id,
	d.ders_ad,
	d.ders_seviye,
	k.kitap_ad,
	k.kitap_yayin,
	k.kitap_ucret
	
	

from kitaplar k inner join dersler d on k.ders_id=d.ders_id

