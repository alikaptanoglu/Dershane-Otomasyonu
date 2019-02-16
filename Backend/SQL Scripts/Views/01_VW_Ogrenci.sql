CREATE VIEW VW_Ogrenci AS

Select 

	o.ogr_id as ��renci_Numaras�,
	o.ogr_ad as ��renci_�smi,
	o.ogr_soyad as ��renci_Soyad� ,
	s.sube_seviye as Seviye,
	s.sube_harf as S�n�f,
	a.alan_ad as Alan�,
	o.ogr_tc as ��renci_TC,
	od.ogr_tel as ��renci_Telefon,
	od.ogr_adres as ��renci_Adres,
	od.ogr_okul as Okulu,
	od.ogr_kayit_tar as Kay�t_Tarihi,
	od.ogr_dogum_tar as Do�um_Tarihi,
	od.ogr_ucret as Al�nan_�cret,
	v.veli_ad as Veli_�smi,
	v.veli_soyad as Veli_Soyismi,
	v.veli_tc as Veli_TC,
	v.veli_tel as Veli_Telefon


from 

ogrenci o 

left join ogrenci_detay od on o.ogr_id = od.ogr_id
left join veli v on v.veli_id=o.veli_id 
left join sube s on s.sube_id=o.sube_id
left join alan a on a.alan_id=s.alan_id