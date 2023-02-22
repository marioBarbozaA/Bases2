
GO
-- Uso de este view para facilitar el procedimiento para ver el 20 %
CREATE VIEW EntregasPorDias AS
SELECT r.idRuta, rxo.ordenId
FROM Ferianueva.dbo.Rutas r
INNER JOIN Ferianueva.dbo.rutaXOrden rxo ON r.idRuta = rxo.idRuta
INNER JOIN Ferianueva.dbo.Ordenes o ON o.ordenId = rxo.ordenId
where (o.estadoOrdenId = 3)or (o.estadoOrdenId = 2 );
GO
Create PROCEDURE CompararCargaTrabajo
    @idRuta1 INT,
    @idRuta2 INT,
    @idSemana INT
AS
BEGIN
    DECLARE @total1 INT, @total2 INT
    DECLARE @diferencia FLOAT
	DECLARE @message varchar(50)

	-- obtenemos totales
	SELECT @total1 = COUNT(r.idRuta)
    FROM EntregasPorDias r
    WHERE r.idRuta= @idRuta1;

	SELECT @total2 = COUNT(r.idRuta)
    FROM EntregasPorDias r
    WHERE r.idRuta= @idRuta2;

	IF (((Select count(idruta) from Ferianueva.dbo.SemanaXEntrega where @idRuta1 = idRuta and @idSemana = idSemana)<= 0 )
	or ((Select count(idruta) from Ferianueva.dbo.SemanaXEntrega where @idRuta2 = idRuta and @idSemana = idSemana)<= 0 ))
	 BEGIN
    
        RAISERROR('La ruta debe existir y ser de esa semana', 16, 1);
        RETURN;
    END
	BEGIN TRY 
		    SET @message = 'Hay una diferencia del'
			SET @diferencia = ABS(((CAST((@total1)AS FLOAT)*100)/Cast((@total2+@total1)As FLOAT))
			- ((CAST((@total2)AS FLOAT)*100)/Cast((@total2+@total1)As FLOAT)))
			SELECT @message AS mensaje, @diferencia AS diferencia
	END TRY
	BEGIN CATCH
	RAISERROR('Error en la operacion, probable division por 0', 16, 1);
        RETURN;
	END CATCH
END;
GO
EXEC CompararCargaTrabajo @idRuta1 = 2,@idRuta2=4,@idSemana= 1;
