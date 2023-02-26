-- Para no perderte nada, corre este script por partes! Gracias!

-- Ejemplo 1 de view
go
CREATE VIEW EntregasPorDia AS
SELECT r.idRuta, sx.dia AS Dia, COUNT(rx.idRutaXEntrega) AS CantidadXRuta, sx.idSemana
FROM Rutas r
INNER JOIN rutaXOrden rx ON r.idRuta = rx.idRuta
INNER JOIN SemanaXEntrega sx ON r.idRuta = sx.idRuta
GROUP BY r.idRuta,sx.dia, sx.idSemana;

GO

--	este es para ver la diferencia del 20 % esto en procedure
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
--	Correrlo por separado
EXEC CompararCargaTrabajo;
GO
--	este es para ver la diferencia del 20 % es un query OJITOOOO CORRERLO POR SEPARADO
SELECT 
	SUM(CASE WHEN e.Dia = 1 THEN e.CantidadXRuta ELSE 0 END) AS total1,
    SUM(CASE WHEN e.Dia = 2 THEN e.CantidadXRuta ELSE 0 END) AS total2,

		ABS(((CAST(SUM(CASE WHEN e.Dia = 1 THEN e.CantidadXRuta ELSE 0 END)AS FLOAT)*100)
		/
		(CAST(SUM(CASE WHEN e.Dia = 2 THEN e.CantidadXRuta ELSE 0 END)
		+
		SUM(CASE WHEN e.Dia = 1 THEN e.CantidadXRuta ELSE 0 END) AS FLOAT)))
		- 
		((CAST(SUM(CASE WHEN e.Dia = 2 THEN e.CantidadXRuta ELSE 0 END) AS FLOAT)*100)
		/
		(CAST(SUM(CASE WHEN e.Dia = 2 THEN e.CantidadXRuta ELSE 0 END)
		+
		SUM(CASE WHEN e.Dia = 1 THEN e.CantidadXRuta ELSE 0 END)AS FLOAT)))) AS diferencia,
		
		CASE WHEN SUM(CASE WHEN e.Dia = 1 THEN e.CantidadXRuta ELSE 0 END)
		>=
		SUM(CASE WHEN e.Dia = 2 THEN e.CantidadXRuta ELSE 0 END) THEN 'día 1 tiene igual o más demanda' ELSE 'Día 2 tiene más demanda' END AS Demanda

		FROM EntregasPorDia e 

-- Segundo View creado

-- Top razones por las que devuelven los productos, solo hay  devoluciones
GO
CREATE VIEW CausasDevolucion AS
 SELECT DevolucionCausas.descripcion, count(DevolucionCausas.idCausa) as CantCausa from DevolucionCausas
 inner join CausaXDevolucion on CausaXDevolucion.idCausa = DevolucionCausas.idCausa
 group by DevolucionCausas.descripcion;
 go
 SELECT TOP 3 descripcion, CantCausa  from CausasDevolucion 
 ORDER BY CantCausa DESC;

-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-- Insercion de productoXOrden con transacciones -- Ejemplo visto como quiz
 CREATE TYPE dbo.TVP_OrderProducts AS TABLE(
    [Name] varchar(128),
    cantidad float
)
GO

ALTER PROCEDURE [dbo].[FeriaSP_PlaceOrder]
	@clientId INT,
	@products TVP_OrderProducts READONLY
AS 
BEGIN
	
	SET NOCOUNT ON -- no retorne metadatos
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	DECLARE @direccionId INT
	DECLARE @productCount INT
	DECLARE @orderStatusId INT
	DECLARE @orderId INT
	DECLARE @Total MONEY

	SELECT @direccionId=ISNULL(idDireccion,0) FROM dbo.DireccionXCliente WHERE idCliente = @clientId

	SELECT @orderStatusId = idEstadoOrden FROM dbo.EstadoOrdenId WHERE Descripcion = 'Por entregar'
	
	SELECT @productCount = COUNT(*) FROM @products

	IF (@direccionId>0 AND @productCount>0) BEGIN

		SET @InicieTransaccion = 0
		IF @@TRANCOUNT=0 BEGIN
			SET @InicieTransaccion = 1
			SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
			BEGIN TRANSACTION		
		END
	
		BEGIN TRY
			SET @CustomError = 2001

			INSERT INTO dbo.Ordenes (postime, totalprice, pesoTotal, clienteid, estadoOrdenId, direccionId)
			VALUES
			(GETDATE(), 0.0, 0.0, @clientId, @orderStatusId, @direccionId)

			SELECT @orderId = SCOPE_IDENTITY()

			INSERT INTO dbo.ProductoXOrden (idProducto, idOrden, cantidad, precio)
			SELECT idProducto, @orderId, prodOrders.cantidad, precioVenta  FROM dbo.Productos prods 
			INNER JOIN @products prodOrders ON prodOrders.Name = prods.Nombre

			SELECT @Total = SUM(cantidad*precio) FROM dbo.ProductoXOrden WHERE idOrden = @orderId

			UPDATE dbo.Ordenes SET totalPrice = @Total WHERE ordenId = @orderId
			
			IF @InicieTransaccion=1 BEGIN
				COMMIT
			END
		END TRY
		BEGIN CATCH
			SET @ErrorNumber = ERROR_NUMBER()
			SET @ErrorSeverity = ERROR_SEVERITY()
			SET @ErrorState = ERROR_STATE()
			SET @Message = ERROR_MESSAGE()
		
			IF @InicieTransaccion=1 BEGIN
				ROLLBACK
			END
			RAISERROR('%s - Error Number: %i', 
				@ErrorSeverity, @ErrorState, @Message, @CustomError)
		END CATCH	
	END
END
RETURN 0	
GO

-- prueba del stored procedure que pasa bien, llega al commit
--select * from dbo.Productos
DECLARE @myProducts TVP_OrderProducts
INSERT @myProducts VALUES 
('Aguacate', 5)

exec dbo.[FeriaSP_PlaceOrder] 3, @myProducts

-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------

-- insercion de datos en los inventarios con transaction (su mejor uso es cuando se devuelven productos),
-- por lo tanto no deberías volverlo a correr

USE [Ferianueva]
GO
/****** Object:  StoredProcedure [dbo].[UpdateInventariosCantidad]    Script Date: 22/2/2023 22:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UpdateInventariosCantidad]
    @idProducto int,
    @cantidad float
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @err int;
    DECLARE @tranStarted bit;
	DECLARE @postTotal float;
	IF NOT (@idProducto>0 and (select count(*) from Productos where Productos.idProducto = @idProducto) = 1)
		begin
			RAISERROR('El producto especificado no existe', 16, 1);
			RETURN;
		end
	SET @postTotal = (select sum(@cantidad+Inventarios.Cantidad) from Inventarios where Inventarios.idProducto = @idProducto);
	IF NOT ((SELECT (SELECT Inventarios.Cantidad from Inventarios where Inventarios.idProducto = @idProducto)-@cantidad) >= 0)
		BEGIN
			RAISERROR('No hay suficiente stock para el pedido', 16, 1);
			RETURN;
		END
    SET @tranStarted = 0;
    BEGIN TRY
        IF @@TRANCOUNT = 0
        BEGIN
            SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
            BEGIN TRANSACTION;
				UPDATE [dbo].[Inventarios]
				SET [Cantidad] = @postTotal
				WHERE [Inventarios].[idProducto] = @idProducto
				SET @tranStarted = 1;
			END
        IF @tranStarted = 1
        BEGIN
            COMMIT TRANSACTION;
        END
    END TRY
    BEGIN CATCH
        SET @err = @@ERROR;

        IF @tranStarted = 1
        BEGIN
            ROLLBACK TRANSACTION;
        END

        RAISERROR('Error updating Inventarios: %d', 16, 1, @err);
    END CATCH
END