create procedure  SP_Kitap_Ara_Kelimeli

@kelime nvarchar(30),
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
(	d.ders_id =@ders_id and( 
	k.kitap_ad like '%'+@kelime+'%' or 
	k.kitap_yayin like '%'+@kelime+'%' or 
	k.kitap_ucret like '%'+@kelime+'%' )

)

