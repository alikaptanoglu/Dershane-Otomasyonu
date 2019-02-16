create PRoc SP_Ders_Guncelle
	@ders_id int,
	
	@yeni_ders_ad nvarchar(30),
	@yeni_ders_seviye nvarchar(2)

AS

set @yeni_ders_ad = upper(SUBSTRING(@yeni_ders_ad,1,1))+LOWER(SUBSTRING(@yeni_ders_ad,2,len(@yeni_ders_ad)-1))

	--ders var m� kontrol
		declare @varmi int
		Select @varmi=ders_id from dersler where (ders_id=@ders_id)
		if(@varmi is null)
		BEGIN
			Select 'Belirtilen Ders Bulunmamakta...'
			return -1
		END
		
	-- prametreler bo�  ise  default olarak eskileri al

		if(@yeni_ders_ad is null)
			BEGIN
				Select @yeni_ders_ad=ders_ad from dersler where (ders_id=@ders_id)
			END
		if(@yeni_ders_seviye is null)
			BEGIN
				Select @yeni_ders_seviye=ders_seviye from dersler where (ders_id=@ders_id)
			END
			
	-- de�i�tirilmeye �al���lan ders zaten var m�, de�i�en ad seviyeyle yine kendisiyse devam et
	
		declare @varmi2 int
		Select @varmi2=ders_id from dersler where(ders_ad=@yeni_ders_ad and ders_seviye=@yeni_ders_seviye)
		if(@varmi2 = @ders_id)
			BEGIN
				--zaten yine kendisiyse bitir.
				Select 'Yeni Verilen De�erler Zaten Dersin Kendisine Ait...'
				return -1
			END
		ELSE IF (@varmi2 is null)
			BEGIN
				--verilen ders ad� ve seviye bo�taysa , dersi g�ncelle.
				update dersler set ders_ad=@yeni_ders_ad,ders_seviye=@yeni_ders_seviye where (ders_id=@ders_id)
			END
		ELSE
			BEGIN -- hem kendisi de�il , hem bo�ta da de�ilse , ozaman zaten b�yle bir ders vard�r.
				Select 'De�i�tirilmeye �al���lan Ders Zaten Bulunmakta.'
			END
		
	
		