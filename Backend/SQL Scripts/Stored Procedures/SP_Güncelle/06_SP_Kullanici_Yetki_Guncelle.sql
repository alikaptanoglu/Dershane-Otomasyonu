create proc SP_Kullanici_Yetki_Guncelle

	@kullanici_id int,
	@ogretmen_islemleri bit,
	@veli_ogrenci_islemleri bit,
	@ders_islemleri bit,
	@sinav_islemleri bit,
	@kullanici_islemleri bit,
	@devamsizlik_islemleri bit,
	@arsiv_islemleri bit
AS
	
	declare @kullanici_ad nvarchar(20)

	select @kullanici_ad=kullanici_ad from kullanicilar where ( kullanici_id=@kullanici_id)
	if(@kullanici_ad = 'müdür')
	BEGIN
		Select 'Müdür için işlem yapılamaz.'
		return -1
	END

	UPDATE kullanicilar set
	ogretmen_islemleri=@ogretmen_islemleri,
	veli_ogrenci_islemleri=@veli_ogrenci_islemleri,
	ders_islemleri=@ders_islemleri,
	sinav_islemleri=@sinav_islemleri,
	kullanici_islemleri=@kullanici_islemleri,
	devamsizlik_islemleri=@devamsizlik_islemleri,
	arsiv_islemleri=@arsiv_islemleri
	where (kullanici_id=@kullanici_id)