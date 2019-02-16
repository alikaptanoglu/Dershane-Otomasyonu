--- Hoca silme iþlemi: Hoca silme iþlemini yapmadan önce hocaya ait dersleri silmemiz gerekir.

CREATE TRIGGER TG_Hoca_sil ON hoca INSTEAD OF DELETE
AS
	DECLARE @hoca_id INT

	SELECT @hoca_id = deleted.hoca_id FROM deleted -- hoca_id'sini elimize aldýk.

	IF(@hoca_id IS NULL) -- hoca var mý  diye kontrol edelim.
	BEGIN -- Böyle bir hoca yoksa
		SELECT 'Hoca bulunamadý.'
	END
	ELSE 
	BEGIN -- Böyle bir hoca varsa bu hocanýn dersleri silinir ve hocayý hoca tablosundan da silip silinen_hoca tablosuna eklememiz gerekir.
		
		DELETE FROM hoca_dersleri WHERE hoca_id=@hoca_id  -- hocanýn derslerini sildik.
		
	DECLARE 
		@hoca_ad NVARCHAR(30),
		@hoca_soyad NVARCHAR(30),
		@hoca_tel NVARCHAR(10),
		@hoca_ucret INT,
		@hoca_tc CHAR(11),
		@hoca_kayit_tarih DATE,
		@hoca_silinme_tarih DATE

		SELECT
		@hoca_ad =hoca_ad , @hoca_soyad = hoca_soyad , @hoca_tel = hoca_tel , @hoca_ucret = hoca_ucret , @hoca_tc = hoca_tc , @hoca_kayit_tarih = hoca_kayit_tarih , @hoca_silinme_tarih = GETDATE()
		FROM hoca WHERE (hoca_id = @hoca_id)

		INSERT INTO silinen_hoca(hoca_id,hoca_ad,hoca_soyad,hoca_tel,hoca_ucret,hoca_tc,hoca_kayit_tarih,hoca_silinme_tarih) 
		VALUES (@hoca_id,@hoca_ad,@hoca_soyad,@hoca_tel,@hoca_ucret,@hoca_tc,@hoca_kayit_tarih,@hoca_silinme_tarih)

		--- Bu hocayi silenen hoca tablosuna ekledikten sonra artýk kaldýrabilir.
		DELETE FROM hoca WHERE hoca_id = @hoca_id
	END