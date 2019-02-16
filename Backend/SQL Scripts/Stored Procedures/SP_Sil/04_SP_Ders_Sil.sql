CREATE PROC SP_Ders_Sil @ders_id int

AS
	
	-- alan dersleri sileriz

	delete from alan_dersleri where (ders_id=@ders_id)

	-- kitaplarý sil

	delete from kitaplar where (ders_id=@ders_id)

	-- hoca dersleri sil

	delete from hoca_dersleri where (ders_id=@ders_id)


	-- en son :ders sil

	delete from dersler where ders_id=@ders_id
GO