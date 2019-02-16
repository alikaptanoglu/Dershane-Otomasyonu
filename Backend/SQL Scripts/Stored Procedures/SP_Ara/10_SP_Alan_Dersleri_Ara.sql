create proc SP_Alan_Dersleri_Ara
	@ders_id int
AS

Select
	ad.alan_dersleri_id as Alan_Ders_Sıra,
	a.alan_ad as Alanı,
	d.ders_seviye as Seviyesi,
	d.ders_ad as Ders_Adı,
	h.hoca_ad as Hoca_İsmi,
	h.hoca_soyad as Hoca_Soyad

from dersler d
inner join alan_dersleri ad on d.ders_id = ad.ders_id
inner join alan a on ad.alan_id = a.alan_id
inner join hoca_dersleri hd on d.ders_id=hd.ders_id
inner join hoca h on h.hoca_id=hd.hoca_id


where (d.ders_id=@ders_id)

go