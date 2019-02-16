CREATE PROC SP_Kitaplar_Ekle 

@ders_id int,

@kitap_ad nvarchar(30),
@kitap_yayin nvarchar(20),
@kitap_ucret int

AS

set @kitap_ad = upper(SUBSTRING(@kitap_ad,1,1))+LOWER(SUBSTRING(@kitap_ad,2,len(@kitap_ad)-1))

	--------#### Kitap�n eklenmek istendi�i ders ger�ekten var m� ona bakar�z, hat�rla kitap bir derse ba�l� olmak zorunda
	Declare @varmi int

	Select @varmi=ders_id FROM dersler WHERE(ders_id=@ders_id) -- e�er �yle ders varsa de�i�kenimize al�r�z

	IF(@varmi is null) -- de�i�ken bo�sa b�yle bir ders yok demektir, ozaman kitap da ekleyemeyiz, o y�zden return ile bitiririz.
	BEGIN
		Select 'Boyle bir ders bulunamad�...' as HATA
		Return -1
	END
	---------#### ders varsa, bu sefer olan bir kitab� m� tekrar ekliyoruz ona bakar�z
	Declare @kitap_id int

	Select @kitap_id=kitap_id FROM kitaplar WHERE ( ders_id=@ders_id AND kitap_ad = @kitap_ad ) -- eklemeye �al��t���m�z �zellikler aran�p id de�i�kenimize at�l�r

	IF(@kitap_id is null)-- id ' bo� ise daha �nce b�yle bir kitap eklenmemi� demektir, kitab� ekleriz
	BEGIN
		INSERT INTO kitaplar (ders_id,kitap_ad,kitap_yayin,kitap_ucret) VALUES(@ders_id,@kitap_ad,@kitap_yayin,@kitap_ucret)
	END
	ELSE -- id' bo� de�ilse , ayn� kitab� daha �nce eklemi�iz demektir, hi� bir �ey yapmay�z buradan sonra kod olmad���ndan, prosed�r a�a��daki hatay� yazd�r�p kendili�inden biter zaten.
	BEGIN
		SELECT 'B�yle bir kitap zaten mevcut...' as HATA
	END

GO