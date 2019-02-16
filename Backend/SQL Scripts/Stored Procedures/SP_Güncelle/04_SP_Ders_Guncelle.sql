create PRoc SP_Ders_Guncelle
	@ders_id int,
	
	@yeni_ders_ad nvarchar(30),
	@yeni_ders_seviye nvarchar(2)

AS

set @yeni_ders_ad = upper(SUBSTRING(@yeni_ders_ad,1,1))+LOWER(SUBSTRING(@yeni_ders_ad,2,len(@yeni_ders_ad)-1))

	--ders var mý kontrol
		declare @varmi int
		Select @varmi=ders_id from dersler where (ders_id=@ders_id)
		if(@varmi is null)
		BEGIN
			Select 'Belirtilen Ders Bulunmamakta...'
			return -1
		END
		
	-- prametreler boþ  ise  default olarak eskileri al

		if(@yeni_ders_ad is null)
			BEGIN
				Select @yeni_ders_ad=ders_ad from dersler where (ders_id=@ders_id)
			END
		if(@yeni_ders_seviye is null)
			BEGIN
				Select @yeni_ders_seviye=ders_seviye from dersler where (ders_id=@ders_id)
			END
			
	-- deðiþtirilmeye çalýþýlan ders zaten var mý, deðiþen ad seviyeyle yine kendisiyse devam et
	
		declare @varmi2 int
		Select @varmi2=ders_id from dersler where(ders_ad=@yeni_ders_ad and ders_seviye=@yeni_ders_seviye)
		if(@varmi2 = @ders_id)
			BEGIN
				--zaten yine kendisiyse bitir.
				Select 'Yeni Verilen Deðerler Zaten Dersin Kendisine Ait...'
				return -1
			END
		ELSE IF (@varmi2 is null)
			BEGIN
				--verilen ders adý ve seviye boþtaysa , dersi güncelle.
				update dersler set ders_ad=@yeni_ders_ad,ders_seviye=@yeni_ders_seviye where (ders_id=@ders_id)
			END
		ELSE
			BEGIN -- hem kendisi deðil , hem boþta da deðilse , ozaman zaten böyle bir ders vardýr.
				Select 'Deðiþtirilmeye Çalýþýlan Ders Zaten Bulunmakta.'
			END
		
	
		