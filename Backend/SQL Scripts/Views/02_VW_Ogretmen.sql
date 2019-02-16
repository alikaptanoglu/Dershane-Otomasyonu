Create view VW_Ogretmen AS
	
Select
	hoca_id as Sýra,
	hoca_ad as Ýsim,
	hoca_soyad as Soyisim,
	hoca_tel as Telefon,
	hoca_ucret as Maaþ,
	hoca_tc as TC,
	hoca_kayit_tarih as Kayýt_Tarihi

From Hoca

