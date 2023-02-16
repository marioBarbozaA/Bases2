

-- Querys

-- cu�l es el top 5 de compradores estrella

SELECT TOP 5 c.nombre AS Cliente, SUM(f.Total ) AS TotalGastado
FROM Ferianueva.dbo.Clientes c
INNER JOIN Ferianueva.dbo.Ordenes o ON (o.clienteId = c.idCliente )
INNER JOIN Ferianueva.dbo.Facturas f ON (o.ordenId = f.OrdenId)
GROUP BY c.Nombre
ORDER BY TotalGastado DESC;

-- cu�l es el top 5 de productos m�s vendidos en los �ltimos 15 d�as

SELECT TOP 5 p.Nombre, SUM(pxo.Cantidad) AS TotalVendido
FROM Ferianueva.dbo.Ordenes o
INNER JOIN Ferianueva.dbo.ProductoXOrden pxo ON (o.ordenId = pxo.idOrden)
INNER JOIN Ferianueva.dbo.Productos p ON (pxo.idProducto = p.idProducto)
INNER JOIN Ferianueva.dbo.Facturas f ON (f.OrdenId = o.ordenId)
WHERE DATEDIFF(day, f.Fecha, GETDATE()) <= 15
GROUP BY p.Nombre
ORDER BY TotalVendido DESC;

-- cu�l es el total de compras por persona

SELECT c.Nombre, COUNT(*) AS TotalCompras
FROM Ferianueva.dbo.Clientes c
INNER JOIN Ferianueva.dbo.Ordenes o ON (o.clienteId = c.idCliente )
INNER JOIN Ferianueva.dbo.Facturas f ON (o.ordenId = f.OrdenId)
GROUP BY c.Nombre;

-- cu�l es el total vendido por producto

SELECT p.Nombre, SUM(pxo.Cantidad * p.precioVenta) AS TotalVendido
FROM Ferianueva.dbo.ProductoXOrden pxo
INNER JOIN Ferianueva.dbo.Productos p ON pxo.idProducto = p.idProducto
GROUP BY p.Nombre;