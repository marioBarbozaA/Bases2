
go
CREATE VIEW EntregasPorDia AS
SELECT r.idRuta, sx.dia AS Dia, COUNT(rx.idRutaXEntrega) AS CantidadXRuta, sx.idSemana
FROM Rutas r
INNER JOIN rutaXOrden rx ON r.idRuta = rx.idRuta
INNER JOIN SemanaXEntrega sx ON r.idRuta = sx.idRuta
GROUP BY r.idRuta,sx.dia, sx.idSemana
go
CREATE PROCEDURE CompararCargaTrabajo
AS
BEGIN
    DECLARE @message varchar(50) =  'Hay una diferencia del'
    DECLARE @total1 INT, @total2 INT
    DECLARE @diferencia FLOAT

	BEGIN TRY 

		DECLARE @mayor INT;
		SELECT @total1 = SUM(e.CantidadXRuta) from EntregasPorDia e WHERE e.Dia = 1;
		SELECT  @total2 = SUM(e.CantidadXRuta) from EntregasPorDia e WHERE e.Dia = 2;
	
		SET @diferencia = ABS(((CAST((@total1)AS FLOAT)*100)/Cast((@total2+@total1)As FLOAT))
		- ((CAST((@total2)AS FLOAT)*100)/Cast((@total2+@total1)As FLOAT)))
			
		if (@total1 >= @total2)
			begin
				set @mayor = 1
			end
		else
			begin
				set @mayor = 2
			end 
			
		SELECT @message AS mensaje, @diferencia AS diferencia, @mayor AS DiaMayor
	END TRY
	BEGIN CATCH
	RAISERROR('Error en la operacion, probable division por 0', 16, 1);
        RETURN;
	END CATCH
END;

GO
EXEC CompararCargaTrabajo;