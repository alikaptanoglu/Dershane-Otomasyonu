create PROCEDURE SP_Silinen_Ogretmen_Ara

@kelime nvarchar(30)
	
AS

Select
	hoca_id as Sıra,
	hoca_ad as İsim,
	hoca_soyad as Soyisim,
	hoca_tel as Telefon,
	hoca_ucret as Maaş,
	hoca_tc as TC,
	hoca_kayit_tarih as Kayıt_Tarihi,
	hoca_silinme_tarih as 'Silinme Tarihi'
	
From Silinen_Hoca

where (
	
	hoca_ad like '%'+@kelime+'%' or 
	hoca_soyad like '%'+@kelime+'%' or 
	hoca_tel like '%'+@kelime+'%' or 
	hoca_ucret like '%'+@kelime+'%' or 
	hoca_tc like '%'+@kelime+'%' or 
	hoca_kayit_tarih like '%'+@kelime+'%' or 
	hoca_silinme_tarih like '%'+@kelime+'%' 
	
	)
	
	