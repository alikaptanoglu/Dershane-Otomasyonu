Create PROCEDURE SP_Ogrenci_Deneme_Ara

@deneme_seviye nvarchar(2),
@deneme_tarih date

AS

	Select 

		od.ogr_id as Öðrenci_Numarasý,
		UPPER(o.ogr_ad) as Ýsmi,
		UPPER(o.ogr_soyad) as Soyismi,
		UPPER(a.alan_ad) as Alaný,
		od.turkce_net as Türkçe_Net,
		od.sosyal_net as Sosyal_Net,
		od.matematik_net as Matematik_Net,
		od.fen_net as Fen_Net,
		puan_ygs_1 as YGS_1,
		puan_ygs_2 as YGS_2,
		puan_ygs_3 as YGS_3,
		puan_ygs_4 as YGS_4,
		puan_ygs_5 as YGS_5,
		puan_ygs_6 as YGS_6

	from 

	ogrenci_deneme od 
	inner join ogrenci o on od.ogr_id= o.ogr_id
	inner join sube s on o.sube_id = s.sube_id 
	inner join alan a on s.alan_id = a.alan_id
	inner join deneme d on d.deneme_id = od.deneme_id

	where d.deneme_seviye=@deneme_seviye and d.deneme_tarih=@deneme_tarih

GO