CREATE PROC SP_Kitaplar_Ekle 

@ders_id int,

@kitap_ad nvarchar(30),
@kitap_yayin nvarchar(20),
@kitap_ucret int

AS

set @kitap_ad = upper(SUBSTRING(@kitap_ad,1,1))+LOWER(SUBSTRING(@kitap_ad,2,len(@kitap_ad)-1))

	--------#### Kitapýn eklenmek istendiði ders gerçekten var mý ona bakarýz, hatýrla kitap bir derse baðlý olmak zorunda
	Declare @varmi int

	Select @varmi=ders_id FROM dersler WHERE(ders_id=@ders_id) -- eðer öyle ders varsa deðiþkenimize alýrýz

	IF(@varmi is null) -- deðiþken boþsa böyle bir ders yok demektir, ozaman kitap da ekleyemeyiz, o yüzden return ile bitiririz.
	BEGIN
		Select 'Boyle bir ders bulunamadý...' as HATA
		Return -1
	END
	---------#### ders varsa, bu sefer olan bir kitabý mý tekrar ekliyoruz ona bakarýz
	Declare @kitap_id int

	Select @kitap_id=kitap_id FROM kitaplar WHERE ( ders_id=@ders_id AND kitap_ad = @kitap_ad ) -- eklemeye çalýþtýðýmýz özellikler aranýp id deðiþkenimize atýlýr

	IF(@kitap_id is null)-- id ' boþ ise daha önce böyle bir kitap eklenmemiþ demektir, kitabý ekleriz
	BEGIN
		INSERT INTO kitaplar (ders_id,kitap_ad,kitap_yayin,kitap_ucret) VALUES(@ders_id,@kitap_ad,@kitap_yayin,@kitap_ucret)
	END
	ELSE -- id' boþ deðilse , ayný kitabý daha önce eklemiþiz demektir, hiç bir þey yapmayýz buradan sonra kod olmadýðýndan, prosedür aþaðýdaki hatayý yazdýrýp kendiliðinden biter zaten.
	BEGIN
		SELECT 'Böyle bir kitap zaten mevcut...' as HATA
	END

GO