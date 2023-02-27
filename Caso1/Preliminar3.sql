------------------------------------------------
--					parte 9		
------------------------------------------------
-- Dirty read
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION		

update dbo.Productos SET precioVenta=10000 WHERE idProducto=4
select * from Productos
WAITFOR DELAY '00:00:05'

ROLLBACK

select * from productos;
--------------------------------------------------
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

-- Ahora ejecutar este codigo en una pestaña diferente inmediatamente
-- no se puede correr todo en un mismo script

begin transaction 
declare @precioActu money
select @precioActu = Productos.precioVenta from Productos where idProducto=1
set @precioActu =  @precioActu-2
update dbo.Productos set precioVenta=@precioActu where idProducto=1
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

------------------------------------------------
--					parte 10		
------------------------------------------------

select * from inventarios;

begin transaction
update Inventarios
set Cantidad = Cantidad+1
where idProducto = 1

-----------------------
waitfor delay '00:00:05'

update Productos
set precioVenta = 1500
where idProducto=2
 ---------------------------------------------------------------------
 -- por favor, como en la parte 9, lo siguiente se ejecuta en otra instancia de sql
 -- sucederá que, al estar ambas instancias intentando actualizar los datos de ambas tablas, estarán esperandose entre ellas, lo que ejecutará un deadlock
 begin transaction 
update Productos
set precioVenta = 1500
where idProducto=2
-----------------------
waitfor delay '00:00:05'

update Inventarios
set Cantidad = Cantidad+1
where idProducto = 1

------------------------------------------------
--					parte 11		
------------------------------------------------

