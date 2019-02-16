CREATE VIEW VW_Ogrenci AS

Select 

	o.ogr_id as Öðrenci_Numarasý,
	o.ogr_ad as Öðrenci_Ýsmi,
	o.ogr_soyad as Öðrenci_Soyadý ,
	s.sube_seviye as Seviye,
	s.sube_harf as Sýnýf,
	a.alan_ad as Alaný,
	o.ogr_tc as Öðrenci_TC,
	od.ogr_tel as Öðrenci_Telefon,
	od.ogr_adres as Öðrenci_Adres,
	od.ogr_okul as Okulu,
	od.ogr_kayit_tar as Kayýt_Tarihi,
	od.ogr_dogum_tar as Doðum_Tarihi,
	od.ogr_ucret as Alýnan_Ücret,
	v.veli_ad as Veli_Ýsmi,
	v.veli_soyad as Veli_Soyismi,
	v.veli_tc as Veli_TC,
	v.veli_tel as Veli_Telefon


from 

ogrenci o 

left join ogrenci_detay od on o.ogr_id = od.ogr_id
left join veli v on v.veli_id=o.veli_id 
left join sube s on s.sube_id=o.sube_id
left join alan a on a.alan_id=s.alan_id