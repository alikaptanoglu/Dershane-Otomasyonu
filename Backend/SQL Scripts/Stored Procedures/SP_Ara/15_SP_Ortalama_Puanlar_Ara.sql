create proc SP_Ortalama_Puanlar_Ara

@tarih date

as

	Select 
	d.deneme_seviye,
	avg(puan_ygs_1) as 'YGS 1',
	avg(puan_ygs_2) as 'YGS 2',
	avg(puan_ygs_3) as 'YGS 3',
	avg(puan_ygs_4) as 'YGS 4',
	avg(puan_ygs_5) as 'YGS 5',
	avg(puan_ygs_6) as 'YGS 6'
	from ogrenci_deneme od
	inner join deneme d on od.deneme_id = d.deneme_id 
	where (d.deneme_tarih = @tarih )
	group by d.deneme_seviye order by d.deneme_seviye asc
	

go
