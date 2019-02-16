Create PROC SP_Ogrenci_Guncelle

	@ogr_id int,
	@yeni_ogr_ad VARCHAR(30),
	@yeni_ogr_soyad VARCHAR(30),
	@yeni_ogr_tel CHAR(10),
	@yeni_ogr_adres VARCHAR(60),
	@yeni_ogr_okul VARCHAR(50),
	@yeni_ogr_ucret INT,
	@yeni_ogr_dogum_tar date,
	@yeni_ogr_kayit_tar date,
	@yeni_ogr_tc char(11),
	
	@yeni_seviye VARCHAR(2),
	@yeni_harf VARCHAR(1)
	
AS
set @yeni_ogr_ad = upper(SUBSTRING(@yeni_ogr_ad,1,1))+LOWER(SUBSTRING(@yeni_ogr_ad,2,len(@yeni_ogr_ad)-1))
set @yeni_ogr_soyad = upper(SUBSTRING(@yeni_ogr_soyad,1,1))+LOWER(SUBSTRING(@yeni_ogr_soyad,2,len(@yeni_ogr_soyad)-1))

	DECLARE @yeni_sube_id INT

	-- ogrenci var mý kontrol
	declare @varmi int
	Select @varmi=ogr_id from ogrenci where (ogr_id=@ogr_id)
	if(@varmi is null)
	BEGIN
		Select 'Belirtilen Öðrenci Bulunamadý'
		Return -1
	END


	-- veriler boþsa eskilerini default al

	IF(@yeni_ogr_ad is null)
	BEGIN
		Select @yeni_ogr_ad = ogr_ad from ogrenci where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_soyad is null)
	BEGIN
		Select @yeni_ogr_soyad = ogr_soyad from ogrenci where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_tel is null)
	BEGIN
		Select @yeni_ogr_tel = ogr_tel from ogrenci_detay where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_adres is null)
	BEGIN
		Select @yeni_ogr_adres = ogr_adres from ogrenci_detay where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_okul is null)
	BEGIN
		Select @yeni_ogr_okul = ogr_okul from ogrenci_detay where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_ucret is null)
	BEGIN
		Select @yeni_ogr_ucret = ogr_ucret from ogrenci_detay where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_dogum_tar is null)
	BEGIN
		Select @yeni_ogr_dogum_tar = ogr_dogum_tar from ogrenci_detay where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_kayit_tar is null)
	BEGIN
		Select @yeni_ogr_kayit_tar = ogr_kayit_tar from ogrenci_detay where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_tc is null)
	BEGIN
		Select @yeni_ogr_tc = ogr_tc from ogrenci where (ogr_id=@ogr_id)
	END


	--- Sube Güncelleme iþlemi

	DECLARE @sube_id INT

	SELECT @sube_id = sube_id FROM ogrenci WHERE (ogr_id=@ogr_id) -- ilk önce þube id'sini elimeze aldýk.

	
		DECLARE @sube_harf VARCHAR(1),@sube_seviye VARCHAR(2)-- Subenin harfini ve seviyesini bulalým.

		SELECT @sube_harf = sube_harf , @sube_seviye = sube_seviye FROM sube WHERE (sube_id=@sube_id)

				IF(@yeni_seviye is null) -- Eðer güncelleme olmadýysa eski deðerleri yükleyelim.
				BEGIN
					Select @yeni_seviye = @sube_seviye
				END
				IF(@yeni_harf is null)
				BEGIN
					Select @yeni_harf = @sube_harf -- Eðer güncelleme olmadýysa eski deðerleri yükleyelim.
				END

				-- ve son durumda öðrencinin sube_id sini bulup gönderelim.
				SELECT @yeni_sube_id = sube_id FROM sube WHERE (sube_seviye = @yeni_seviye AND sube_harf = @yeni_harf) -- öðrencisnin son durumdaki subesini bulduk.

	
	-- ogrenciyi güncelle
	update ogrenci set ogr_ad=@yeni_ogr_ad,ogr_soyad=@yeni_ogr_soyad,sube_id=@yeni_sube_id,ogr_tc=@yeni_ogr_tc where (ogr_id=@ogr_id)
	update ogrenci_detay set ogr_tel=@yeni_ogr_tel,ogr_adres=@yeni_ogr_adres,ogr_okul=@yeni_ogr_okul,ogr_ucret=@yeni_ogr_ucret,ogr_dogum_tar=@yeni_ogr_dogum_tar,ogr_kayit_tar=@yeni_ogr_kayit_tar where (ogr_id=@ogr_id)
	
	