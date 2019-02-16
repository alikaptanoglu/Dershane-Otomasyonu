create proc SP_Devamsizlik_Orani_Ara
@tarih date

as
	Declare @toplam_ogrenci_sayi int,@toplam_gelmeyen_ogrenci_sayi int
	select @toplam_ogrenci_sayi = count(*) from ogrenci
	Select @toplam_gelmeyen_ogrenci_sayi = count(*) from devamsizlik where tarih=@tarih


	Select @toplam_ogrenci_sayi,@toplam_gelmeyen_ogrenci_sayi

go