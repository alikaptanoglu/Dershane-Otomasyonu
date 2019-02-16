
CREATE PROC SP_Hoca_ekle

 @ad nvarchar(20),
 @soyad nvarchar(20),
 @tel nvarchar(10),
 @ucret int,
 @tc char(11),
 @kayit_tarih date

AS

--boyut d�zenleme.
set @ad = upper(SUBSTRING(@ad,1,1))+LOWER(SUBSTRING(@ad,2,len(@ad)-1))
set @soyad = upper(SUBSTRING(@soyad,1,1))+LOWER(SUBSTRING(@soyad,2,len(@soyad)-1))

	-- Hoca var m� yok mu kontrol et
	Declare @id int

	Select @id=hoca_id FROM hoca WHERE (hoca_ad=@ad AND hoca_soyad=@soyad AND (hoca_tel=@tel or hoca_tc=@tc) ) --eklenilmeye �al���lan hoca varsa onun id sini de�i�kene al�r�z
	
	IF (@id is null) -- hoca var m� kontrol ediliyor...
	
		BEGIN
				if(@kayit_tarih is null)
				BEGIN
					set @kayit_tarih = GETDATE()
				END
			INSERT INTO hoca (hoca_ad,hoca_soyad,hoca_tel,hoca_ucret,hoca_tc,hoca_kayit_tarih) VALUES(@ad,@soyad,@tel,@ucret,@tc,@kayit_tarih)
		END
	

	ELSE -- e�er �yle bir hoca varsa , hata ��kart�l�r.
	
		BEGIN
			Select 'Zaten �yle Bir Hoca Mevcut...'
		END

GO


