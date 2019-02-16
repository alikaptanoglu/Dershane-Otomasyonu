create view  VW_Kullanicilar

AS

Select 

	kullanici_id as Kullanıcı_No,
	kullanici_ad as Kullanıcı_İsim,
	ogretmen_islemleri as Öğretmen_İşlemleri ,
	veli_ogrenci_islemleri as Veli_Öğrenci_İşlemleri,
	ders_islemleri as Ders_İşlemleri,
	sinav_islemleri as Sınav_İşlemleri,
	kullanici_islemleri as Kullanıcı_İşlemleri,
	devamsizlik_islemleri as Devamsızlık_İşlemleri,
	arsiv_islemleri as arsiv_İşlemleri
	
	

from kullanicilar 

