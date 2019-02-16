-- Ders silme iþlemi : Bu derse ait kitaplarý , alan dersleri tablosundaki kayýtlarý ve hoca_dersleri tablosundaki kayýtlarý silmemiz gerekir.

CREATE TRIGGER TG_Ders_sil ON dersler INSTEAD OF DELETE
AS
	DECLARE @ders_id INT -- Önce bu dersin id'sini elimize alalým.
	SELECT @ders_id = deleted.ders_id FROM deleted 

	IF (@ders_id IS NULL) -- Böyle bir ders varmý kontrol edelim.
	BEGIN
		SELECT 'Ders Bulunamadý...'
	END
	ELSE -- Böyle bir ders varsa o derse ait bilgileri silelim.
	BEGIN
		DELETE FROM alan_dersleri WHERE ders_id = @ders_id
		DELETE FROM hoca_dersleri WHERE ders_id = @ders_id
		DELETE FROM kitaplar WHERE ders_id = @ders_id
		DELETE FROM dersler WHERE ders_id=@ders_id
	END