create proc SP_Kullanici_Ekle

	@kullanici_ad nvarchar(20),
	@kullanici_sifre nvarchar(20),
	
	@ogretmen_islemleri bit,
	@veli_ogrenci_islemleri bit,
	@ders_islemleri bit,
	@sinav_islemleri bit,
	@kullanici_islemleri bit,
	@devamsizlik_islemleri bit,
	@arsiv_islemleri bit
AS
	
	
	if(@kullanici_ad = 'müdür')
	BEGIN
		Select 'Müdür adlı kullanıcı eklenilemez.'
		return -1
	END

	INSERT INTO kullanicilar values(@kullanici_ad,@kullanici_sifre,@ogretmen_islemleri,@veli_ogrenci_islemleri,@ders_islemleri,@sinav_islemleri,@kullanici_islemleri,@devamsizlik_islemleri,@arsiv_islemleri,NULL)
	
GO