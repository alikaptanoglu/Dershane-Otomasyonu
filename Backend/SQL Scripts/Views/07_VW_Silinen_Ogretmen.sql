create View VW_Silinen_Ogretmen

	
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

GO