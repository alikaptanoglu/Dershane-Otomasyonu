create PROCEDURE SP_Silinen_Ogrenci_Ara

@kelime nvarchar(30)

AS
	
	Select 

	o.ogr_id as Öğrenci_Numarası,
	o.ogr_ad as Öğrenci_İsmi,
	o.ogr_soyad as Öğrenci_Soyadı ,
	s.sube_seviye as Seviye,
	s.sube_harf as Sınıf,
	a.alan_ad as Alanı,
	o.ogr_tc as Öğrenci_TC,
	od.ogr_tel as Öğrenci_Telefon,
	od.ogr_adres as Öğrenci_Adres,
	od.ogr_okul as Okulu,
	od.ogr_kayit_tar as Kayıt_Tarihi,
	od.ogr_dogum_tar as Doğum_Tarihi,
	od.ogr_ucret as Alınan_Ücret,
	v.veli_ad as Veli_İsmi,
	v.veli_soyad as Veli_Soyismi,
	v.veli_tc as Veli_TC,
	v.veli_tel as Veli_Telefon


	from 

	silinen_ogrenci o 

	left join silinen_ogrenci_detay od on o.ogr_id = od.ogr_id
	left join silinen_veli v on v.veli_id=o.veli_id 
	left join sube s on s.sube_id=o.sube_id
	left join alan a on a.alan_id=s.alan_id
	
	where (
	
	o.ogr_id like '%'+@kelime+'%' or 
	o.ogr_ad like '%'+@kelime+'%' or 
	o.ogr_soyad like '%'+@kelime+'%' or 
	s.sube_seviye like '%'+@kelime+'%' or 
	s.sube_harf like '%'+@kelime+'%' or 
	a.alan_ad like '%'+@kelime+'%' or 
	o.ogr_tc like '%'+@kelime+'%' or 
	od.ogr_tel like '%'+@kelime+'%' or 
	od.ogr_adres like '%'+@kelime+'%' or 
	od.ogr_okul like '%'+@kelime+'%' or 
	od.ogr_kayit_tar like '%'+@kelime+'%' or 
	od.ogr_dogum_tar like '%'+@kelime+'%' or 
	od.ogr_ucret like '%'+@kelime+'%' or 
	v.veli_ad like '%'+@kelime+'%' or 
	v.veli_soyad like '%'+@kelime+'%' or 
	v.veli_tc like '%'+@kelime+'%' or 
	v.veli_tel like '%'+@kelime+'%' 
	
	)