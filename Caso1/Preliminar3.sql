------------------------------------------------
--					parte 9		
------------------------------------------------
-- generacion del error
-- Dirty read

BEGIN TRANSACTION		
update dbo.Productos SET precioVenta=10000 WHERE idProducto=4
WAITFOR DELAY '00:00:05'
ROLLBACK --se cancela 
select * from productos WHERE idProducto=4; --demuestra como no se actualizo

-- Ejecucion en 2da instancia (forma instantanea)
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
select * from productos WHERE idProducto=4; --ejecucion del dirty read

--solucion 

SET TRANSACTION ISOLATION LEVEL READ COMMITTED -- con esto se hace un lock a la fila, y no permite hacer el read de la segunda instancia
-- hasta que se termine de ejecutar la transaccion
BEGIN TRANSACTION		
update dbo.Productos SET precioVenta=10000 WHERE idProducto=4
WAITFOR DELAY '00:00:05'
ROLLBACK --cancela la transaccion
select * from productos WHERE idProducto=4; --demuestra como no se actualizo

-- ejecucion en la 2da instancia
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
select * from productos WHERE idProducto=4; -- muestra (hasta finalizar la transaccion) el dato real  (no se actualiza)

--------------------------------------------------
-- generacion del error
-- lost update 

-- en este caso se esta simulando el cambio de precios de un producto, en la transaction 1 se le rebaja 1 colon
-- mientras que en la transaction 2 se le rebaja 2 colones, la transaction 1 no toma en cuenta el update de la transaction 2
-- Primero ejecutar este codigo
begin transaction 
declare @precioActu money
select @precioActu = Productos.precioVenta from Productos where idProducto=1
WAITFOR DELAY '00:00:10'
set @precioActu = @precioActu-1
update dbo.Productos set precioVenta=@precioActu where idProducto=1
commit transaction

-- Ahora ejecutar este codigo en una pesta�a diferente inmediatamente
-- no se puede correr todo en un mismo script

begin transaction 
declare @precioActu money
select @precioActu = Productos.precioVenta from Productos where idProducto=1
set @precioActu =  @precioActu-2
update dbo.Productos set precioVenta=@precioActu where idProducto=1
commit transaction

-- solucion
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ -- har� que la siguiente transaccion que se haga caiga en un deadlocked
begin transaction 
declare @precioActu money
select @precioActu = Productos.precioVenta from Productos where idProducto=1
WAITFOR DELAY '00:00:10'
set @precioActu = @precioActu-1
update dbo.Productos set precioVenta=@precioActu where idProducto=1
commit transaction

-- Ahora ejecutar este codigo en una pesta�a diferente inmediatamente
-- no se puede correr todo en un mismo script
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
begin transaction 
declare @precioActu money
select @precioActu = Productos.precioVenta from Productos where idProducto=1
set @precioActu =  @precioActu-2
update dbo.Productos  set precioVenta=@precioActu where idProducto=1
commit transaction


-----------------------------------------------------
-- phantoms

begin transaction
declare @clienteID int
declare @cantidadPagos int 
declare @monto decimal(12,2)
declare @abono decimal(12,2)

set @clienteID = 14
set @cantidadPagos = 5

select @monto=sum(totalPrice) 
from dbo.Ordenes where clienteId = @clienteID
group by clienteId
select * from dbo.Ordenes where clienteId = 14

waitfor delay '00:00:10'

select @abono=SUM(totalprice)/@cantidadPagos from dbo.Ordenes where clienteId=@clienteID
group by clienteId

select  @monto, @abono

select * from dbo.Ordenes where clienteId = 14
commit transaction

-- El siguiente codigo tambien se tiene que ejecutar en otra instancia de sql server
-- lo que se hace es que mientras la primera transaccion se ejecuta, insertamos una nueava orden al mismo cliente
-- esta orden se refleja en abono, pues el cliente tendra que abonar mas, pero su @monto no refleja la nueva
-- aparicion de la orden

BEGIN TRANSACTION
insert into Ferianueva.dbo.Ordenes (FeriaNueva.dbo.Ordenes.postime, FeriaNueva.dbo.Ordenes.totalPrice, 
FeriaNueva.dbo.Ordenes.pesoTotal, FeriaNueva.dbo.Ordenes.clienteId, FeriaNueva.dbo.Ordenes.estadoOrdenId, 
FeriaNueva.dbo.Ordenes.direccionId)
values (GETDATE(), 0,0,14,3,14)
EXEC InsertarProductoXOrden @idProducto = 1, @idOrden = 51,    @cantidad = 10;
commit transaction


-- SOLUCION 
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE 
begin transaction
declare @clienteID int
declare @cantidadPagos int 
declare @monto decimal(12,2)
declare @abono decimal(12,2)

set @clienteID = 14
set @cantidadPagos = 5

select @monto=sum(totalPrice) 
from dbo.Ordenes where clienteId = @clienteID
group by clienteId
select * from dbo.Ordenes where clienteId = 14

waitfor delay '00:00:10'

select @abono=SUM(totalprice)/@cantidadPagos from dbo.Ordenes where clienteId=@clienteID
group by clienteId

select  @monto AS Deuda, @abono AS Abono

select * from dbo.Ordenes where clienteId = 14
commit transaction

-- El siguiente codigo tambien se tiene que ejecutar en otra instancia de sql server

BEGIN TRANSACTION -- ya que la primer transaction se ha puesto como serializable, el codigo aca generado esperara 
-- hasta que esa primer transaction termine, para insertar la nueva orden, por lo tanto, el abono * cantidadPagos (recordemos que es 5)
-- dara el monto o deuda
insert into Ferianueva.dbo.Ordenes (FeriaNueva.dbo.Ordenes.postime, FeriaNueva.dbo.Ordenes.totalPrice, 
FeriaNueva.dbo.Ordenes.pesoTotal, FeriaNueva.dbo.Ordenes.clienteId, FeriaNueva.dbo.Ordenes.estadoOrdenId, 
FeriaNueva.dbo.Ordenes.direccionId)
values (GETDATE(), 0,0,14,3,14)
EXEC InsertarProductoXOrden @idProducto = 1, @idOrden = 52,    @cantidad = 10;
commit transaction

SELECT * FROM ORDENES;
------------------------------------------------
--					parte 10		
------------------------------------------------

create procedure [dbo].[spEjemplo1]
as
begin
	begin transaction
	update Inventarios
	set Cantidad = Cantidad+1
	where idProducto = 1
	-----------------------
	waitfor delay '00:00:05'
	update Productos
	set precioVenta = 1500
	where idProducto=2
	commit 
end
select * from Productos
exec spEjemplo1;
 ---------------------------------------------------------------------
 -- por favor, como en la parte 9, lo siguiente se ejecuta en otra instancia de sql
 -- suceder� que, al estar ambas instancias intentando actualizar los datos de ambas tablas, estar�n esperandose entre ellas, lo que ejecutar� un deadlock
 create procedure spEjemplo2
 as
 begin
	begin transaction 
	update Productos
	set precioVenta = 1500
	where idProducto=2
	-----------------------
	waitfor delay '00:00:05'
	update Inventarios
	set Cantidad = Cantidad+1
	where idProducto = 1
	commit transaction
end

-- se deben crear los procedures
-- Seguidamente se ejecuta en la primera instancia
EXEC spEjemplo1;
-- y en otra instancia se corre inmediatamente
EXEC spEjemplo2;

-- Solucion

-- Para la solucion de este error, simplemente hacemos que se accese la informacion al mismo tiempo,
-- significa que, cambiamos el orden de los updates de alguna de las 2 transacciones, en este caso
-- a la transaccion 2, invertiremos su proceso para que sea parecida a la transaccion 1

alter procedure spEjemplo1
as
begin
begin transaction
update Inventarios
set Cantidad = Cantidad+1
where idProducto = 1
-----------------------
waitfor delay '00:00:05'

update Productos
set precioVenta = 1500
where idProducto=2
commit transaction
end
 ------------------------------------------------

 alter procedure spEjemplo2
 as
 begin
 begin transaction 
 update Inventarios
set Cantidad = Cantidad+1
where idProducto = 1
-----------------------
waitfor delay '00:00:05'
update Productos
set precioVenta = 1500
where idProducto=2
commit transaction
end
-- luego de haber hecho los alter procedures, se hace en una instancia
EXEC spEjemplo1;

-- y luego en otra instancia se hace 
EXEC spEjemplo2;
------------------------------------------------
--					parte 11		
------------------------------------------------

-- decrypt the ContactoXCliente: desencripta la info con un password Que viene predeterminado a la hora de Encriptar
-- Correrlo por aparte los procedures

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[decryptContactoXCliente]
	@password varchar(50),
	@idCliente int
	AS
	IF( @idCliente <= 0 or @idCliente > (SELECT COUNT(*) from Clientes)
	or (Select COUNT(*) from contactoInfoXCliente where @idCliente = idCliente) <= 0)
		begin
			RAISERROR('No Existe el cliente', 16, 1);
				RETURN; 
		end
	BEGIN
    
		SELECT CONVERT (varchar(50),DecryptBYPASSPHRASE(@password,Contacto)) as desencriptado, cc.idCliente FROM ContactInfo c
		INNER JOIN contactoInfoXCliente cc ON cc.idContactoInfo = c.contactInfoId
		WHERE  @idCliente = idCliente
	END;
GO
-- Ejecuta el c�digo y va a observar que ya est� desencriptado 

EXEC decryptContactoXCliente @password = 'encriptacion', @idCliente = 1;

-- decrypt the ContactoXEmpleado: desencripta la info con un password Que viene predeterminado a la hora de Encriptar
CREATE PROCEDURE [dbo].[decryptContactoXEmpleado]
	@password varchar(50),
	@idEmpleado int
	AS
	IF( @idEmpleado <= 0 or @idEmpleado > (SELECT COUNT(*) from Empleados)
	or (Select COUNT(*) from contactoInfoXEmpleado where @idEmpleado = idEmpleado) <= 0)
		begin
			RAISERROR('No Existe el Empleado', 16, 1);
				RETURN; 
		end
	BEGIN
		SELECT CONVERT (varchar(50),DecryptBYPASSPHRASE(@password,Contacto)) as desencriptado, cc.idEmpleado FROM ContactInfo c
		INNER JOIN contactoInfoXEmpleado cc ON cc.idContacto = c.contactInfoId
		WHERE  @idEmpleado = cc.idEmpleado
	END;
GO
-- Ejecuta el c�digo y va a observar que ya est� desencriptado 

EXEC decryptContactoXEmpleado @password = 'encriptacion', @idEmpleado = 1;

CREATE PROCEDURE [dbo].[decryptAll]
	@password varchar(50)
	AS
	BEGIN
		SELECT CONVERT (varchar(50),DecryptBYPASSPHRASE(@password,Contacto)) as desencriptado, c.tipoId,c.contactInfoId FROM ContactInfo c
		WHERE  borrado = 0
	END;
GO
-- Ejecuta el c�digo y va a observar que ya est� desencriptado 

Exec decryptAll @password = 'encriptacion';

-- Este Metodo de Encriptaci�n puede ser utilizado Tambi�n para el PASSWORD del usuario 
select * from ContactInfo