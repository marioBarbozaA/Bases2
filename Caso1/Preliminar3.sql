-- Dirty read
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION		

update dbo.Productos SET precioVenta=10000 WHERE idProducto=4
select * from Productos
WAITFOR DELAY '00:00:05'

ROLLBACK


-- lost update 

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
begin transaction 
update dbo.Productos set precioVenta=precioVenta-1  where idProducto=1
commit transaction

select * from Productos


-- phantoms
declare @clienteID int
declare @cantidadPagos int 
declare @monto decimal(12,2)
declare @abono decimal(12,2)

set @clienteID = 14
set @cantidadPagos = 5

select @monto=sum(totalPrice) 
from dbo.Ordenes where clienteId = @clienteID
group by clienteId

waitfor delay '00:00:05'

select @abono=SUM(totalprice)/@cantidadPagos from dbo.Ordenes where clienteId=@clienteID
group by clienteId

select @monto, @abono

select * from dbo.Ordenes where clienteId = 14