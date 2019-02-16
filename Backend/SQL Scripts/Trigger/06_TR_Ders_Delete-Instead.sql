-- Ders silme i�lemi : Bu derse ait kitaplar� , alan dersleri tablosundaki kay�tlar� ve hoca_dersleri tablosundaki kay�tlar� silmemiz gerekir.

CREATE TRIGGER TG_Ders_sil ON dersler INSTEAD OF DELETE
AS
	DECLARE @ders_id INT -- �nce bu dersin id'sini elimize alal�m.
	SELECT @ders_id = deleted.ders_id FROM deleted 

	IF (@ders_id IS NULL) -- B�yle bir ders varm� kontrol edelim.
	BEGIN
		SELECT 'Ders Bulunamad�...'
	END
	ELSE -- B�yle bir ders varsa o derse ait bilgileri silelim.
	BEGIN
		DELETE FROM alan_dersleri WHERE ders_id = @ders_id
		DELETE FROM hoca_dersleri WHERE ders_id = @ders_id
		DELETE FROM kitaplar WHERE ders_id = @ders_id
		DELETE FROM dersler WHERE ders_id=@ders_id
	END