

-- #### Pk Fk ilişkilerinden ötürü aşağıdaki Sırayla tablo açılabilinir. ####

-- 1 - veli
create table veli (

	veli_id int identity(1,1),
	veli_ad nvarchar(30) not null,
	veli_soyad nvarchar(30) not null,
	veli_tel nvarchar(10) CONSTRAINT ck_veli_tel CHECK ( veli_tel LIKE ( REPLICATE('[0-9]',10))),
	veli_tc char(11) constraint ck_veli_tc CHECK (veli_tc LIKE REPLICATE('[0-9]', 11)),

	primary key(veli_id),
	unique(veli_tel),
	unique(veli_tc)
)

-- 2 - hoca
create table hoca(

	hoca_id int identity(1,1),
	hoca_ad nvarchar(30) not null,
	hoca_soyad nvarchar(30) not null,
	hoca_tel nvarchar(10) CONSTRAINT ck_hoca_tel CHECK ( hoca_tel LIKE (REPLICATE('[0-9]',10))),
	hoca_ucret int not null,
	hoca_tc char(11) CONSTRAINT ck_hoca_tc CHECK (hoca_tc LIKE REPLICATE('[0-9]', 11)),
	hoca_kayit_tarih date constraint df_hoca_kayit default(getdate()),

	primary key(hoca_id),
	unique (hoca_tel),
	unique (hoca_tc)
)


-- 3 - dersler

create table dersler(

	ders_id int identity(1,1),
	ders_ad nvarchar(30) not null,
	ders_seviye nvarchar(2) Constraint ck_ders_seviye CHECK ( ders_seviye in('9','10','11','12') ),

	primary key (ders_id),
	unique(ders_ad,ders_seviye)
)

-- 4 - kitaplar

create table kitaplar(

	kitap_id int identity(1,1),
	ders_id int,
	kitap_ad nvarchar(30) not null,
	kitap_yayin nvarchar(20) not null,
	kitap_ucret int not null,

	primary key(kitap_id),
	foreign key(ders_id) references dersler(ders_id),
	unique(ders_id,kitap_ad)

)

-- 5 - hoca_dersleri

create table hoca_dersleri(

	hoca_dersleri_id int identity(1,1),
	ders_id int,
	hoca_id int,

	primary key(hoca_dersleri_id),
	foreign key(ders_id) references dersler(ders_id),
	foreign key(hoca_id) references hoca(hoca_id),
	unique(ders_id)
)

-- 6 - alan

create table alan(

	alan_id int identity(1,1),
	alan_ad nvarchar(3) Constraint ck_alan_ad CHECK ( alan_ad in('mf','tm','ts','dil','-') ),

	primary key(alan_id),
	unique(alan_ad)
)
---- ALAN'A HEMEN SABİT OLAN DEĞERLERİNİ VERELİM...
INSERT INTO alan (alan_ad) VALUES('-'),('mf'),('tm'),('ts'),('dil')

-- 7 - alan_dersleri

create table alan_dersleri(

	alan_dersleri_id int identity(1,1),
	alan_id int,
	ders_id int,
	
	primary key(alan_dersleri_id),
	foreign key(alan_id) references alan(alan_id),
	foreign key(ders_id) references dersler(ders_id),
	unique(alan_id,ders_id)
)


-- 8 - şube

create table sube(

	sube_id int identity(1,1),
	sube_harf nvarchar(1) constraint ck_sube_harf CHECK (sube_harf like '[A-Z]'),
	sube_seviye nvarchar(2) Constraint ck_sube_seviye CHECK ( sube_seviye in('9','10','11','12')),
	alan_id int,

	primary key (sube_id),
	foreign key (alan_id) references alan(alan_id),
	unique(sube_harf,sube_seviye)
)

-- 9 - ögrenci

create table ogrenci(

	ogr_id int identity(1000,1),
	ogr_tc char(11) NOT NULL CONSTRAINT ck_ogr_tc CHECK (ogr_tc LIKE REPLICATE('[0-9]', 11)),
	ogr_ad nvarchar(20),
	ogr_soyad nvarchar(20),
	veli_id int,
	sube_id int,

	primary key(ogr_id),
	unique (ogr_tc),
	foreign key(veli_id) references veli(veli_id),
	foreign key(sube_id) references sube(sube_id)
)

-- 10 - yoklama

create table devamsizlik(

	
	ogr_id int,
	tarih date constraint df_tarih DEFAULT (getDate()),

	
	foreign key(ogr_id) references ogrenci(ogr_id),
	unique(ogr_id,tarih)

)

-- 11 - öğrenci_detay

create table ogrenci_detay(

	ogr_id int,
	ogr_tel nvarchar(10) CONSTRAINT ck_ogr_tel CHECK ( ogr_tel LIKE ( REPLICATE('[0-9]',10))),
	ogr_adres nvarchar(50) not null,
	ogr_okul nvarchar(30) not null,
	ogr_kayit_tar date constraint df_kayit_tarih DEFAULT (getDate()),
	ogr_dogum_tar date not null,
	ogr_ucret int constraint df_ogr_ucret DEFAULT (2000),

	foreign key(ogr_id) references ogrenci(ogr_id),
	unique(ogr_id)
	

)

-- 12 - deneme_sınavı

create table deneme(

	deneme_id int identity(1,1),
	deneme_seviye nvarchar(2) NOT NULL Constraint ck_deneme_seviye CHECK ( deneme_seviye in('9','10','11','12')),
	deneme_tarih date NOT NULL,

	primary key(deneme_id),
	unique(deneme_seviye,deneme_tarih)
)

-- 13 - puanlar

create table ogrenci_deneme(

	ogrenci_deneme_id int identity(1,1),
	deneme_id int,
	ogr_id int,

	turkce_net float constraint ck_turkce_net check (turkce_net >=-10 and turkce_net<=40),
	sosyal_net float constraint ck_sosyal_net check (sosyal_net >=-10 and sosyal_net<=40),
	matematik_net float constraint ck_matematik_net check (matematik_net >=-10 and matematik_net<=40),
	fen_net float constraint ck_fen_net check (fen_net >=-10 and fen_net<=40),

	-- rastgele netler girildikten sonra... puan hesaplamaları yapan işlemler(iç içe for ile)

	puan_ygs_1 float constraint ck_puan_ygs_1 check(puan_ygs_1>=0 and puan_ygs_1<=500),
	puan_ygs_2 float constraint ck_puan_ygs_2 check(puan_ygs_2>=0 and puan_ygs_2<=500),
	puan_ygs_3 float constraint ck_puan_ygs_3 check(puan_ygs_3>=0 and puan_ygs_3<=500),
	puan_ygs_4 float constraint ck_puan_ygs_4 check(puan_ygs_4>=0 and puan_ygs_4<=500),
	puan_ygs_5 float constraint ck_puan_ygs_5 check(puan_ygs_5>=0 and puan_ygs_5<=500),
	puan_ygs_6 float constraint ck_puan_ygs_6 check(puan_ygs_6>=0 and puan_ygs_6<=500),

	--İSTENİLİRSE LYS KISMI DA EKLENİLEBİLİR...

	primary key(ogrenci_deneme_id),
	foreign key (deneme_id) references deneme(deneme_id),
	foreign key(ogr_id) references ogrenci(ogr_id),
	unique(deneme_id,ogr_id)
)


------- NORMAL TABLOLAR BİTTİ

------- KULLANICILAR TABLOSU ...

create table kullanicilar (
	kullanici_id int identity(1,1) primary key,
	kullanici_ad nvarchar(20) unique,
	kullanici_sifre nvarchar(20),
	
	
	ogretmen_islemleri bit,
	veli_ogrenci_islemleri bit,
	ders_islemleri bit,
	sinav_islemleri bit,
	kullanici_islemleri bit,
	devamsizlik_islemleri bit,
	arsiv_islemleri bit,
	son_giris_tarih datetime
	
	)

-- BİRKAÇ KULLANICI EKLEDİK.
insert into kullanicilar values('müdür','123',1,1,1,1,1,1,1,NULL)
insert into kullanicilar values('memur1','123',0,1,0,1,0,1,0,NULL)
insert into kullanicilar values('memur2','123',0,1,0,0,0,1,0,NULL)



------- KULLANICILAR TABLOSU BİTTİ...


------- İŞLEMLER TABLOSU ------ : Yapılan Yedekleme İşlemlerinin Kayıtı.

create table islemler(

	kullanici_ad nvarchar(20),
	islem_tip nvarchar(12) constraint ck_islem_tip check(islem_tip like 'db export' or islem_tip like 'db import' or islem_tip like 'table export' or islem_tip like 'table import'),
	islem nvarchar(50),
	tarih datetime

	foreign key(kullanici_ad) references kullanicilar(kullanici_ad)
)
------- İŞLEMLER TABLOSU BİTTİ ------ 


------- SİLİNENLER TABLOSU ...

create table silinen_ogrenci(

	ogr_id int , 
	ogr_tc char(11),  -- geri alınabilir 
	ogr_ad nvarchar(20), -- geri alınabilir
	ogr_soyad nvarchar(20), -- geri alınabilir
	veli_id int,
	sube_id int
)

create table silinen_ogrenci_detay(

	ogr_id int,
	ogr_tel nvarchar(10),  -- geri alınabilir 
	ogr_adres nvarchar(50) , -- geri alınabilir
	ogr_okul nvarchar(30), -- geri alınabilir
	ogr_kayit_tar date ,
	ogr_dogum_tar date , -- geri alınabilir
	ogr_ucret int 
	
)


create table silinen_veli (

	veli_id int,
	veli_ad nvarchar(30),-- geri alınabilir
	veli_soyad nvarchar(30),-- geri alınabilir
	veli_tel nvarchar(10),-- geri alınabilir
	veli_tc char(11)-- geri alınabilir

)
-- Silinen hoca tablosu oluşturma

CREATE TABLE silinen_hoca (
	hoca_id INT,
	hoca_ad NVARCHAR(30),
	hoca_soyad NVARCHAR(30),
	hoca_tel NVARCHAR(10),
	hoca_ucret INT,
	hoca_tc CHAR(11),
	hoca_kayit_tarih DATE,
	hoca_silinme_tarih DATE 
		CONSTRAINT df_hoca_silinme_tarih DEFAULT (GETDATE())
)

------- SİLİNENLER TABLOSU BİTTİ...

------- SİLİNENLER TABLOSU YEDEK ...

create table silinen_ogrenci_yedek(

	ogr_id int , 
	ogr_tc char(11),  -- geri alınabilir 
	ogr_ad nvarchar(20), -- geri alınabilir
	ogr_soyad nvarchar(20), -- geri alınabilir
	veli_id int,
	sube_id int
)

create table silinen_ogrenci_detay_yedek(

	ogr_id int,
	ogr_tel nvarchar(10),  -- geri alınabilir 
	ogr_adres nvarchar(50) , -- geri alınabilir
	ogr_okul nvarchar(30), -- geri alınabilir
	ogr_kayit_tar date ,
	ogr_dogum_tar date , -- geri alınabilir
	ogr_ucret int 
	
)


create table silinen_veli_yedek (

	veli_id int,
	veli_ad nvarchar(30),-- geri alınabilir
	veli_soyad nvarchar(30),-- geri alınabilir
	veli_tel nvarchar(10),-- geri alınabilir
	veli_tc char(11)-- geri alınabilir

)
-- Silinen hoca tablosu oluşturma

CREATE TABLE silinen_hoca_yedek (
	hoca_id INT,
	hoca_ad NVARCHAR(30),
	hoca_soyad NVARCHAR(30),
	hoca_tel NVARCHAR(10),
	hoca_ucret INT,
	hoca_tc CHAR(11),
	hoca_kayit_tarih DATE,
	hoca_silinme_tarih DATE
)

------- SİLİNENLER TABLOSU YEDEK BİTTİ...

