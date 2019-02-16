Create PROC SP_Sube_Guncelle

	@sube_harf char(1),
	@sube_seviye nvarchar(2),
	
	
	@yeni_sube_harf char(1),
	@yeni_sube_seviye nvarchar(2),
	@yeni_alan_ad nvarchar(3)
AS

	---- dönüþtürülmesi istenilen sube var mý kontrol et

	declare @sube_id int

	Select @sube_id=sube_id from sube where (sube_harf=@sube_harf and sube_seviye=@sube_seviye)

	if(@sube_id is null)
	BEGIN
		Select 'Böyle bir þube bulunamadý'
		return -1
	END
	---- Dönüþüm sonrasý çakýþacak þube var mý kontrol
	declare @sube_id2 int
	Select  @sube_id2 from sube where (sube_harf=@yeni_sube_harf and sube_seviye = @yeni_sube_seviye)
	if (@sube_id2 is not null)
	BEGIN
		Select 'Var olan bir þubeye deðiþtirilemez.'
		REturn -1
	END
	
	----benzer þube yoksa þube deðiþtirilme üzere , parametrelere deðer verilmemiþse eski bilgileri default olarak girilecek

	if(@yeni_sube_harf is null)
	BEGIN
		Select @yeni_sube_harf=sube_harf from sube where (sube_id=@sube_id)
	END
	if(@yeni_sube_seviye is null)
	BEGIN
		Select @yeni_sube_seviye=sube_seviye from sube where (sube_id=@sube_id)
	END
	
	----alan Default için alan_id bulma
	
		Declare @yeni_alan_id int
		Select @yeni_alan_id=alan_id from alan where (alan_ad=@yeni_alan_ad)
		
		if(@yeni_alan_id is null)
		BEGIN
			Select 'Girilen alan bulunamadýðý için alan güncellemesi yapýlmadý.'
			Select @yeni_alan_id=alan_id from sube where (sube_id=@sube_id)
		END
		

	
	---- þube deðiþtirilir

	update sube set sube_harf=@sube_harf,sube_seviye=@sube_seviye,alan_id=@yeni_alan_id
	where sube_id=@sube_id