CREATE PROC SP_Hoca_Dersleri_Ekle 
@hoca_tc char(11),-- hoca id i�in

@ders_id int -- ders id 

AS
	---- Hoca var m� sorudural�m
	Declare @hoca_id int
	Select @hoca_id=hoca_id FROM hoca WHERE (hoca_tc=@hoca_tc)

	if(@hoca_id is null)
	BEGIN
		Select 'B�yle bir hoca bulunamad�...'
		RETURN -1
	END

	---- Ders var m� sordural�m
	Declare @varmi int
	Select @varmi=ders_id FROM dersler WHERE(ders_id=@ders_id)

	IF(@varmi is null)
	BEGIN
		Select 'B�yle bir ders bulunamad�...'
		RETURN -1
	END

	---- ders ve hoca var ama, bu tabloya daha �nceden HOCA VE DERS 'ini ekledik mi diye sorgu koyacakt�k ama , hat�rla HOCA_DERSLER� tablosunu olu�tururken
	---- ders_id ve hoca_id'ye birbirlerine ba�l� unique �zellik ekledik,  koymak istedi�imiz ders ile hocan�n kayd� varsa zaten bunu bize yapt�rmayacak.
	---- AMAA... ben yine de bu sorguyu yapmak istiyorum ��nk� sonucunda t�rk�e bir hata bildirisi d�ns�n.

	Declare @hoca_dersleri_id int

	Select @hoca_dersleri_id=hoca_dersleri_id FROM hoca_dersleri WHERE (ders_id=@ders_id AND hoca_id=@hoca_id)

	IF (@hoca_dersleri_id is null)
	BEGIN
		INSERT INTO hoca_dersleri (ders_id,hoca_id) VALUES(@ders_id,@hoca_id)
	END
	ELSE
	BEGIN
		SELECT 'Zaten Bu Ders Al�nm��t�r...'
	END
GO