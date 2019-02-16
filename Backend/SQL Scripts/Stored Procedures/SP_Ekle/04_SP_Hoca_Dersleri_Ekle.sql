CREATE PROC SP_Hoca_Dersleri_Ekle 
@hoca_tc char(11),-- hoca id için

@ders_id int -- ders id 

AS
	---- Hoca var mý soruduralým
	Declare @hoca_id int
	Select @hoca_id=hoca_id FROM hoca WHERE (hoca_tc=@hoca_tc)

	if(@hoca_id is null)
	BEGIN
		Select 'Böyle bir hoca bulunamadý...'
		RETURN -1
	END

	---- Ders var mý sorduralým
	Declare @varmi int
	Select @varmi=ders_id FROM dersler WHERE(ders_id=@ders_id)

	IF(@varmi is null)
	BEGIN
		Select 'Böyle bir ders bulunamadý...'
		RETURN -1
	END

	---- ders ve hoca var ama, bu tabloya daha önceden HOCA VE DERS 'ini ekledik mi diye sorgu koyacaktýk ama , hatýrla HOCA_DERSLERÝ tablosunu oluþtururken
	---- ders_id ve hoca_id'ye birbirlerine baðlý unique özellik ekledik,  koymak istediðimiz ders ile hocanýn kaydý varsa zaten bunu bize yaptýrmayacak.
	---- AMAA... ben yine de bu sorguyu yapmak istiyorum çünkü sonucunda türkçe bir hata bildirisi dönsün.

	Declare @hoca_dersleri_id int

	Select @hoca_dersleri_id=hoca_dersleri_id FROM hoca_dersleri WHERE (ders_id=@ders_id AND hoca_id=@hoca_id)

	IF (@hoca_dersleri_id is null)
	BEGIN
		INSERT INTO hoca_dersleri (ders_id,hoca_id) VALUES(@ders_id,@hoca_id)
	END
	ELSE
	BEGIN
		SELECT 'Zaten Bu Ders Alýnmýþtýr...'
	END
GO