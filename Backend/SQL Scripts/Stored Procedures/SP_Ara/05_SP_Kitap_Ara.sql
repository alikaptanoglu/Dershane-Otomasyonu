create procedure  SP_Kitap_Ara

@ders_id int

AS

Select 

	k.kitap_id as Kitap_No,
	d.ders_ad as Ders_İsmi,
	d.ders_seviye as Ders_Seviye,
	k.kitap_ad as Kitap_İsim,
	k.kitap_yayin as Kitap_Yayın,
	k.kitap_ucret as Kitap_Ücret
	
	

from kitaplar k inner join dersler d on k.ders_id=d.ders_id

where 
(	d.ders_id =@ders_id )

