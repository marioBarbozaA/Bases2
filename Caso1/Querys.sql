

-- Querys

-- cuál es el top 5 de compradores estrella

SELECT TOP 5 c.idCliente AS Cliente, c.nombre, SUM(o.totalPrice ) AS TotalGastado
FROM Ferianueva.dbo.Clientes c
INNER JOIN Ferianueva.dbo.Ordenes o ON (o.clienteId = c.idCliente )
-- INNER JOIN Ferianueva.dbo.Facturas f ON (o.ordenId = f.OrdenId)
WHERE o.estadoOrdenId = 3 -- 3 es que se procesó la compra
GROUP BY c.idCliente,c.nombre
ORDER BY TotalGastado DESC;

-- cuál es el top 5 de productos más vendidos en los últimos 15 días

SELECT TOP 5 p.idProducto,p.Nombre, SUM(pxo.Cantidad) AS TotalVendido
FROM Ferianueva.dbo.Ordenes o
INNER JOIN Ferianueva.dbo.ProductoXOrden pxo ON (o.ordenId = pxo.idOrden)
INNER JOIN Ferianueva.dbo.Productos p ON (pxo.idProducto = p.idProducto)
INNER JOIN Ferianueva.dbo.Facturas f ON (f.OrdenId = o.ordenId)
WHERE DATEDIFF(day, f.Fecha, GETDATE()) <= 15
GROUP BY p.idProducto,p.Nombre
ORDER BY TotalVendido DESC;

-- cuál es el total de compras por persona

SELECT c.idCliente,c.Nombre, COUNT(*) AS TotalCompras
FROM Ferianueva.dbo.Clientes c
INNER JOIN Ferianueva.dbo.Ordenes o ON (o.clienteId = c.idCliente )
INNER JOIN Ferianueva.dbo.Facturas f ON (o.ordenId = f.OrdenId)
GROUP BY c.idCliente, c.Nombre;

-- cuál es el total vendido por producto

SELECT p.idProducto,p.Nombre, SUM(pxo.Cantidad * p.precioVenta) AS TotalVendido
FROM Ferianueva.dbo.ProductoXOrden pxo
INNER JOIN Ferianueva.dbo.Productos p ON pxo.idProducto = p.idProducto
INNER JOIN Ferianueva.dbo.Ordenes o ON (o.ordenId= pxo.idOrden)
INNER JOIN Unidades u ON (u.idUnidad = p.idUnidad)
WHERE o.estadoOrdenId = 3 -- 3 es que se procesó la compra
GROUP BY p.idProducto, p.Nombre;