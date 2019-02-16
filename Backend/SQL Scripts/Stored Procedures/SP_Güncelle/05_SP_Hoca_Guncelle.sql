Create PROC SP_Hoca_Guncelle 
	@hoca_id int,
	
	@yeni_hoca_ad nvarchar(30),
	@yeni_hoca_soyad nvarchar(30),
	@yeni_hoca_tel char(10),
	@yeni_hoca_ucret int,
	@yeni_hoca_tc char(11),
	@yeni_hoca_kayit_tarih date

AS

set @yeni_hoca_ad = upper(SUBSTRING(@yeni_hoca_ad,1,1))+LOWER(SUBSTRING(@yeni_hoca_ad,2,len(@yeni_hoca_ad)-1))
set @yeni_hoca_soyad = upper(SUBSTRING(@yeni_hoca_soyad,1,1))+LOWER(SUBSTRING(@yeni_hoca_soyad,2,len(@yeni_hoca_soyad)-1))
	

	--hoca var mý kontrol et
	declare @varmi int
	Select @varmi=hoca_id from hoca where( hoca_id=@hoca_id )
	if(@varmi is null)
	BEGIN
		Select 'Belirtilen hoca bulunamadý...'
		return -1
	END

	--deðerler boþsa eski deðerleri default olarak koy
	if(@yeni_hoca_ad is null)
	BEGIN
		Select @yeni_hoca_ad=hoca_ad from hoca where (hoca_id=@hoca_id)
	END
	if(@yeni_hoca_soyad is null)
	BEGIN
		Select @yeni_hoca_soyad=hoca_soyad from hoca where (hoca_id=@hoca_id)
	END
	if(@yeni_hoca_tel is null)
	BEGIN
		Select @yeni_hoca_tel=hoca_tel from hoca where (hoca_id=@hoca_id)
	END
	if(@yeni_hoca_ucret is null)
	BEGIN
		Select @yeni_hoca_ucret=hoca_ucret from hoca where (hoca_id=@hoca_id)
	END
	if(@yeni_hoca_tc is null)
	BEGIN
		Select @yeni_hoca_tc=hoca_tc from hoca where (hoca_id=@hoca_id)
	END
	if(@yeni_hoca_kayit_tarih is null)
	BEGIN
		Select @yeni_hoca_kayit_tarih=hoca_kayit_tarih from hoca where (hoca_id=@hoca_id)
	END

	--yeni verilerden ortaya çýkan hoca zaten varsa öyle hoca var de
	declare @varmi2 int
	Select @varmi2=hoca_id from hoca where (hoca_ad=@yeni_hoca_ad and hoca_soyad=@yeni_hoca_soyad and hoca_tel=@yeni_hoca_tel and hoca_ucret=@yeni_hoca_ucret and hoca_tc=@yeni_hoca_tc and hoca_kayit_tarih = @yeni_hoca_kayit_tarih)
	if (@varmi2 is not null)
	BEGIN
		Select 'yeni girilen verilere sahip hoca zaten bulunmakta...'
		return -1
	END

	--hocayý update et
	update hoca set 
	
	hoca_ad=@yeni_hoca_ad,
	hoca_soyad=@yeni_hoca_soyad,
	hoca_tel=@yeni_hoca_tel,
	hoca_ucret=@yeni_hoca_ucret,
	hoca_tc=@yeni_hoca_tc,
	hoca_kayit_tarih=@yeni_hoca_kayit_tarih
	where (hoca_id=@hoca_id)
	
	
	
	