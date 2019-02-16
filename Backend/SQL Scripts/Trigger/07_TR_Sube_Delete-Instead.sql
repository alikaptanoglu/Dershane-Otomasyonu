
CREATE TRIGGER TR_Sube_Sil ON sube INSTEAD OF DELETE
AS
	DECLARE @sube_id INT -- Önce bu dersin id'sini elimize alalım.
	SELECT @sube_id = deleted.sube_id FROM deleted 

	update ogrenci set sube_id = null where sube_id=@sube_id
	delete from sube where sube_id=@sube_id