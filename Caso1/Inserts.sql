-- ------------------------------------------------------------------------
/*									TypeContact           			*/
-- ------------------------------------------------------------------------

INSERT INTO [Ferianueva].[dbo].[tipoContactInfo] 
([Descripcion])
VALUES 
('Phone'),
('Email');

-- ------------------------------------------------------------------------
/*									ContactInfo     					*/
-- ------------------------------------------------------------------------
INSERT INTO [Ferianueva].[dbo].[ContactInfo] 
([tipoId],[contacto])
VALUES 
(1,'80080268'),
(2,'GraStarcher@gmail.com'),
(1,'83365631'),
(2, 'TinJones@gmail.com'),
(1,'89956157'),
(2,'EvaReichenbach@gmail.com'),
(1,'82806739'),
(2,'RicRush@gmail.com'),
(1, '83714516'),
(2, 'LawBernhart@gmail.com'),
(1, '82688393'),
(2, 'JoaGosselin@gmail.com'),
(1, '81370699'),
(2, 'JasHoag@gmail.com'),
(1, '86617568'),
(2, 'DavTung@gmail.com'),
(1, '89874539'),
(2, 'ChrSabino@gmail.com'),
(1, '89874539'),
(2, 'JefGuerrero@gmail.com'),
(1, '82385652'),
(2, 'RayFoust@gmail.com'),
(1, '86830732'),
(2, 'DeaConsidine@gmail.com'),
(1, '89605250'),
(2,  'TerArnold@gmail.com'),
(1, '86079107'),
(2,  'NinWesterman@gmail.com'),
(1, '85371669'),
(2, 'AshMckinley@gmail.com'),
(1, '81029918'),
(2, 'JoyHathaway@gmail.com'),
(1, '85133678'),
(2, 'LorBullock@gmail.com'),
(1, '84914047'),
(2,  'JoaJones@gmail.com'),
(1, '89180931'),
(2,  'KevKent@gmail.com'),
(1, '85096644'),
(2,  'CheWyman@gmail.com'),
(1,'5551234'),
(1, '5555678'),
(1, '5559012'),
(1, '5553456'),
(1, '5557890'),
(1,'55512341'),
(1, '55556782'),
(1, '55590123'),
(1, '55534564'),
(1, '55578905');

select * from [Ferianueva].[dbo].[ContactInfo] ;
-- ------------------------------------------------------------------------
/*									CLIENTES							*/
-- ------------------------------------------------------------------------
insert into [Ferianueva].[dbo].[Clientes] (dbo.Clientes.nombre, dbo.Clientes.apellido1, dbo.Clientes.apellido2) values 
('Grace','Starcher','Parker' ),
 ('Tiny','Jones','Mansfield'),
 ('Evan','Reichenbach','Tran' ),
 ('Richard','Rush','Gartrell'),
 ('Lawrence','Bernhart','Settles'),
 ('Joan','Gosselin','Griffin'),
 ('Jason','Hoag','Daley' ),
 ('David','Tung','Sharp'),
 ('Christina','Sabino','Chatfield'),
 ('Jeffrey','Guerrero','Patillo'),
 ('Raymond','Foust','Nguyen'),
 ('Deangelo','Considine','Gordon'),
 ('Terry','Arnold','Mathew'),
 ('Nina','Westerman','Banda'),
 ('Ashley','Mckinley','Priolo'),
 ('Joya','Hathaway','Smith'),
 ('Lorraine','Bullock','Keeler'),
 ('Joan','Jones','Madden'),
 ('Kevin','Kent','Black'),
 ('Cheryl','Wyman','Mcfarland');
 

 

-- ------------------------------------------------------------------------
/*									ContactInfoByClient					*/
-- ------------------------------------------------------------------------
INSERT INTO [Ferianueva].[dbo].[contactoInfoXCliente] 
([idCliente],[idContactoInfo])
VALUES 
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16),
(9, 17),
(9, 18),
(10, 19),
(10, 20),
(11, 21),
(11, 22),
(12, 23),
(12, 24),
(13, 25),
(13, 26),
(14, 27),
(14, 28),
(15, 29),
(15, 30),
(16, 31),
(16, 32),
(17, 33),
(17, 34),
(18, 35),
(18, 36),
(19, 37),
(19, 38),
(20, 39),
(20, 40);

 -- ---------------------------------------------------------------
 -- Insert data into the Provincias
INSERT INTO [Ferianueva].[dbo].[Provincias] 
([nombre])
VALUES 
('San Jos�'),
('Alajuela'),
('Herdia'),
('Cartago'),
('Puntarenas'),
('Guanacaste'),
('Limon');

-- Insert data into the Cantones
INSERT INTO [Ferianueva].[dbo].[cantones] 
([idProvincia],[nombre])
VALUES 
(4,'Paraiso'),
(4,'Oros�'),
(4,'Tres Rios'),
(4,'Cartago'),
(1,'San Jose'),
(1,'Curridabat'),
(1,'Zapote');

-- Insert data into the Distritos
INSERT INTO [Ferianueva].[dbo].[distritos] 
([idCanton],[nombre])
VALUES 
(4,'San Juan'),
(4,'San Rafael'),
(4,'San Ram�n'),
(1,'Cipreses'),
(1,'San Jose centro'),
(2,'Oros�'),
(1,'Plaza del Sol');

-- Insert data into the Direccion
INSERT INTO [Ferianueva].[dbo].[Direcciones] 
([idDistrito],[descripcion],[localizacion])
VALUES 
(1,'Al apar de Panaderia bollo',geography::STGeomFromText('POINT(-84.0516022 9.9363268)', 4326)),
(1,'Panaderia bollo',geography::STGeomFromText('POINT(-83.8672039 9.8642548)', 4326)),
(2,'Condominio Natu',geography::STGeomFromText('POINT(-84.1424987 9.9284708)', 4326)),
(4,'Al apar del la Verdureria',geography::STGeomFromText('POINT(-84.0896881 9.9352776)', 4326)),
(4,'Verdureria la buena verdura',geography::STGeomFromText('POINT(-83.8533345 9.8396185)', 4326)),
(5,'75 metros oeste del correo',geography::STGeomFromText('POINT(-83.6788755 9.9049048)', 4326)),
(7,'En la Plaza',geography::STGeomFromText('POINT(-83.9075614 9.8639347)', 4326)),
(4, 'Feria del Agricultor Cartago', geography::STGeomFromText('POINT(-83.9351168 9.8649457)', 4326)),
(4, 'Zapateria Cartago', geography::STGeomFromText('POINT(-83.9192693 9.8591526)', 4326)),
(4, 'Restaurante Donde Luis', geography::STGeomFromText('POINT(-83.9210471 9.8610845)', 4326)),
(4, 'Boliche Cartago', geography::STGeomFromText('POINT(-83.9199044 9.8575946)', 4326)),
(5, 'Parque Central San Jose', geography::STGeomFromText('POINT(-84.0757082 9.9349311)', 4326)),
(5, 'Casa Amarilla San Jose', geography::STGeomFromText('POINT(-84.0854303 9.9354057)', 4326)),
(5, 'Teatro Nacional San Jose', geography::STGeomFromText('POINT(-84.0720131 9.9330666)', 4326)),
(5, 'Paseo de los Estudiantes San Jose', geography::STGeomFromText('POINT(-84.0825682 9.9309967)', 4326)),
(5, 'Catedral Metropolitana San Jose', geography::STGeomFromText('POINT(-84.0804116 9.9340774)', 4326)),
(5, 'Barrio Chino San Jose', geography::STGeomFromText('POINT(-84.0759217 9.9326541)', 4326)),
(4, 'Ruinas de Cartago', geography::STGeomFromText('POINT(-83.9491268 9.8684989)', 4326)),
(6, 'Iglesia Orosi', geography::STGeomFromText('POINT(-83.8532387 9.8390821)', 4326)),
(6, 'Supermercado Pal� Orosi', geography::STGeomFromText('POINT(-83.8529279 9.8373461)', 4326)),
(4, 'Basilica', geography::STGeomFromText('POINT(-83.6867057 9.9004417)', 4326)),
(4, 'Casa de la Cultura Cartago', geography::STGeomFromText('POINT(-83.9369842 9.8659972)', 4326)),
(5, 'Plaza de la Democracia San Jose', geography::STGeomFromText('POINT(-84.0826774 9.9332748)', 4326)),
(5, 'Plaza de la Cultura San Jose', geography::STGeomFromText('POINT(-84.0784608 9.9341316)', 4326)),
(5, 'Museo del Oro San Jose', geography::STGeomFromText('POINT(-84.0765114 9.9351754)', 4326));-- 25

-- Insert data into the DireccionXClientes
INSERT INTO [Ferianueva].[dbo].[DireccionXCliente]
([idCliente],[idDireccion])
VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20);

 -- ----------------------------------------------------------------


 -- ---------------------------------------------------------------
 --						Estado orden
 -- ---------------------------------------------------------------
 insert into [Ferianueva].[dbo].[EstadoOrdenID] (dbo.EstadoOrdenId.descripcion)
values ('En proceso'), ('Por entregar'), ('Entregada')

 -- ---------------------------------------------------------------
 --						 orden
 -- ---------------------------------------------------------------
 
insert into Ferianueva.dbo.Ordenes (FeriaNueva.dbo.Ordenes.postime, FeriaNueva.dbo.Ordenes.totalPrice, 
FeriaNueva.dbo.Ordenes.pesoTotal, FeriaNueva.dbo.Ordenes.clienteId, FeriaNueva.dbo.Ordenes.estadoOrdenId, 
FeriaNueva.dbo.Ordenes.direccionId)
values 
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,1,3, 1),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,1,3, 1),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,1,3, 1),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,2,3, 2),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,3,3, 3),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,3,3, 3),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,3,3, 3),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,4,3, 4),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,4,3, 4),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,4,3, 4),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,5,3, 5),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,6,3, 6),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,6,3, 6),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,6,3, 6),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,7,3, 7),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,7,3, 7),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,8,3, 8),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,8,3, 8),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,8,3, 8),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,9,3, 9),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,9,3, 9),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,9,3, 9),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,10,3, 10),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,10,3, 10),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,10,3, 10),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,11,3, 11),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,11,3, 11),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,11,3, 11),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,12,3, 12),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,12,3, 12),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,12,3, 12),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,13,3, 13),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,13,3, 13),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,13,3, 13),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,14,3, 14),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,14,3, 14),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,15,3, 15),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,15,3, 15),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,15,3, 15),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,16,3, 16),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,16,3, 16),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,16,3, 16),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,17,3, 17),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,17,3, 17),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,17,3, 17),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,18,3, 18),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,18,3, 18),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,19,3, 19),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,19,3, 19),
((SELECT DATEADD(dd, RAND()*27*-2, GETDATE())), 0, 0,20,3, 20);

 -- ---------------------------------------------------------------
 --						 productoXOrden
 -- ---------------------------------------------------------------

 -- ---------------------------------------------------------------
 -- Insert data into the Tipo Empleado
 -- ---------------------------------------------------------------
 INSERT INTO [Ferianueva].[dbo].[TipoEmpleado] ([salario], [descripcion])
VALUES 
   (10000, 'Bodeguero'),
   (20000,'Restuarador'),
   (15000,'Chofer');

 -- Insert data into the Empleados
INSERT INTO [Ferianueva].[dbo].[Empleados] 
([nombre], [apellido1], [apellido2], [FechaContrato], [tipoEmpleado])
VALUES 
('Juan', 'P�rez', 'G�mez', '2022-01-01', 1),
('Mar�a', 'L�pez', 'Fern�ndez', '2022-02-01', 2),
('Pedro', 'Garc�a', 'S�nchez', '2022-03-01', 1),
('Ana', 'Mart�nez', 'Guti�rrez', '2022-04-01', 2),
('Carlos', 'Jim�nez', 'D�az', '2022-05-01', 3);
 
 -- ------------------------------------------------------------------------
/*									ContactInfoByClient					*/
-- ------------------------------------------------------------------------
INSERT INTO [Ferianueva].[dbo].[contactoInfoXEmpleado] 
([idEmpleado],[idContacto])
VALUES 
(1,41),
(2,42),
(3,43),
(4,44),
(5,45);

 -- Insert data into the Unidades
INSERT INTO [Ferianueva].[dbo].[Unidades] ([Nombre])
VALUES 
   ('Kilogramo'),
   ('Litro'),
   ('Unidad'),
   ('Metro');

-- Insert data into the Productos table
INSERT INTO [Ferianueva].[dbo].[Productos] 
([Nombre], [idUnidad], [precioVenta], [max], [min], [descripcion], [imagen])
VALUES 
('Tomates',1, 1000, 100, 10, 'Tomate delicioso', 'imagen1.png'),
('Banano', 1, 2000, 200, 20, 'Banano grande', 'imagen2.png'),
('Leche',  2, 1400,70, 30, 'Leche Sabrosa', 'imagen3.png'),
( 'Aguacate',  1, 4000, 100, 10, 'Aguacate Dulce', 'imagen4.png'),
('Mamon chino', 1, 2000, 50, 10, 'Mamon Chino Rico', 'imagen5.png'),
('Naranja',  1, 3000, 300, 30, 'Naranja Jugosa', 'imagen6.png'),
('Mango',  1, 3600, 100, 10, 'Mango Exitoso', 'imagen7.png'),
('Pipa',  1, 500, 200, 20, 'Pipa Refrescante', 'imagen8.png'),
('Platano',  1, 3000, 100, 30, 'Buen Platano', 'imagen9.png'),
('Yuca',  1, 1000, 100, 10, 'Yuca linda', 'imagen10.png'),
('Papa',  1, 2000, 200, 20, 'Papa Excelente', 'imagen11.png'),
('Chayote',  1, 2200, 100, 30, 'Chayotazo', 'imagen12.png'),
('Fresas', 1, 3000, 200, 10, 'Fresas rojitas', 'imagen13.png'),
('Zanahoria',  1, 2400, 200, 20, 'Zanahoria Prodigio', 'imagen14.png'),
('Limon',  2, 1400, 400, 40, 'Limon Increible', 'imagen15.png');

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
USE [Ferianueva]
GO
/****** Object:  StoredProcedure [dbo].[InsertarProductoXOrden]    Script Date: 15/2/2023 20:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[InsertarProductoXOrden]
    @idProducto int,
    @idOrden int,
    @cantidad float
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Insertar datos en la tabla ProductoXOrden
    INSERT INTO ProductoXOrden (idProducto, idOrden, cantidad, precio)
    VALUES (@idProducto, @idOrden, @cantidad, (SELECT @cantidad * (select Productos.precioVenta from productos where Productos.idProducto = @idProducto)));
    
    -- Actualizar el totalPrice y pesoTotal de la orden
    UPDATE Ordenes
    SET totalPrice = (SELECT SUM(ProductoXOrden.precio) FROM ProductoXOrden WHERE idOrden = @idOrden),
        pesoTotal = (SELECT SUM(cantidad) FROM ProductoXOrden po INNER JOIN Productos p ON po.idProducto = p.idProducto WHERE idOrden = @idOrden)
    WHERE ordenId = @idOrden;
END;
GO
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
EXEC InsertarProductoXOrden @idProducto = 1, @idOrden = 1,    @cantidad = 10;
EXEC InsertarProductoXOrden @idProducto = 2, @idOrden = 1, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto = 8, @idOrden = 1, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 2, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 2, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 2, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 2, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 2, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 3, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 4, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =14, @idOrden = 4, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 4, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =15, @idOrden = 4, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =3, @idOrden = 4, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 5, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 6, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 6, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =6, @idOrden = 6, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 6, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 6, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =3, @idOrden = 6, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 6, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 6, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 7, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 7, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 7, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 7, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =3, @idOrden = 8, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 8, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 8, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 8, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =15, @idOrden = 8, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =6, @idOrden = 8, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 8, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 9, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 10, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =14, @idOrden = 10, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 10, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =6, @idOrden = 10, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =15, @idOrden = 10, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =3, @idOrden = 10, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 10, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 10, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =6, @idOrden = 11, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =15, @idOrden = 11, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 11, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 11, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 12, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 13, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 13, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =15, @idOrden = 13, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 13, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 13, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 13, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 13, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 13, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =6, @idOrden = 14, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 14, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 14, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 14, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 14, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 15, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 15, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 15, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 16, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =15, @idOrden = 16, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 16, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 17, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 17, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 17, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 17, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 17, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 17, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 17, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =9, @idOrden = 17, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 18, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 18, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 18, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 18, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 18, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =9, @idOrden = 18, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 18, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 19, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 19, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 19, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 20, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 20, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 21, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 21, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 21, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 22, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 22, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 23, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 23, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 24, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 24, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 24, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 25, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 25, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 26, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 27, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 27, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 27, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 27, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 28, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 28, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 28, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 28, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 28, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 29, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 29, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 29, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 29, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =3, @idOrden = 29, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 29, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =15, @idOrden = 29, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =14, @idOrden = 30, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =14, @idOrden = 31, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 31, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 31, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 31, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 31, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =9, @idOrden = 31, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 32, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 32, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 32, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 32, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =14, @idOrden = 33, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 33, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 33, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 33, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 34, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 35, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 35, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 35, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 35, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 35, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =6, @idOrden = 35, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =15, @idOrden = 36, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 36, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 36, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 36, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 36, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 36, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =6, @idOrden = 37, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 37, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 38, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 38, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 39, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =9, @idOrden = 39, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =3, @idOrden = 39, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 39, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 39, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =15, @idOrden = 39, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =9, @idOrden = 40, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 40, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 40, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 40, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 41, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =14, @idOrden = 41, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 41, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =9, @idOrden = 41, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 41, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =6, @idOrden = 42, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 42, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =9, @idOrden = 42, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 42, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 42, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 43, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 43, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =15, @idOrden = 43, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =14, @idOrden = 44, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =15, @idOrden = 45, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =6, @idOrden = 45, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 45, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 45, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 45, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =9, @idOrden = 46, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 46, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 46, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 46, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =13, @idOrden = 46, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 46, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =11, @idOrden = 46, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 47, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =9, @idOrden = 47, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 47, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 47, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =15, @idOrden = 47, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =2, @idOrden = 47, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 47, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 48, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =7, @idOrden = 48, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =1, @idOrden = 48, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =9, @idOrden = 48, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 48, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 48, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 49, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =12, @idOrden = 49, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =6, @idOrden = 49, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =4, @idOrden = 50, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =5, @idOrden = 50, @cantidad = 3;
EXEC InsertarProductoXOrden @idProducto =3, @idOrden = 50, @cantidad = 1;
EXEC InsertarProductoXOrden @idProducto =8, @idOrden = 50, @cantidad = 2;
EXEC InsertarProductoXOrden @idProducto =10, @idOrden = 50, @cantidad = 2;
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
insert into dbo.Facturas (dbo.Facturas.fecha, dbo.Facturas.Total, dbo.Facturas.OrdenId)
values (GETDATE(), 0, 1),
(GETDATE(), 0, 2), 
(GETDATE(), 0, 3), 
(GETDATE(), 0, 4), 
(GETDATE(), 0, 5), 
(GETDATE(), 0, 6), 
(GETDATE(), 0, 7), 
(GETDATE(), 0, 8), 
(GETDATE(), 0, 9), 
(GETDATE(), 0, 10),
(GETDATE(), 0, 11),
(GETDATE(), 0, 12),
(GETDATE(), 0, 13),
(GETDATE(), 0, 14),
(GETDATE(), 0, 15),
(GETDATE(), 0, 16),
(GETDATE(), 0, 17),
(GETDATE(), 0, 18),
(GETDATE(), 0, 19),
(GETDATE(), 0, 20),
(GETDATE(), 0, 21),
(GETDATE(), 0, 22),
(GETDATE(), 0, 23),
(GETDATE(), 0, 24),
(GETDATE(), 0, 25),
(GETDATE(), 0, 26),
(GETDATE(), 0, 27),
(GETDATE(), 0, 28),
(GETDATE(), 0, 29),
(GETDATE(), 0, 30),
(GETDATE(), 0, 31),
(GETDATE(), 0, 32),
(GETDATE(), 0, 33),
(GETDATE(), 0, 34),
(GETDATE(), 0, 35),
(GETDATE(), 0, 36),
(GETDATE(), 0, 37),
(GETDATE(), 0, 38),
(GETDATE(), 0, 39),
(GETDATE(), 0, 40),
(GETDATE(), 0, 41),
(GETDATE(), 0, 42),
(GETDATE(), 0, 43),
(GETDATE(), 0, 44),
(GETDATE(), 0, 45),
(GETDATE(), 0, 46),
(GETDATE(), 0, 47),
(GETDATE(), 0, 48),
(GETDATE(), 0, 49),
(GETDATE(), 0, 50);
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
Exec ActualizarFactura;
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------




insert into [Ferianueva].[dbo].[Proveedores] 
([Ferianueva].[dbo].[Proveedores].[Nombre], [Ferianueva].[dbo].[Proveedores].[Descripcion])
values 
('Apple', 'Filipenses 4:13'),
('Microsoft', 'Isaías 40:29'),     
('Amazon', 'Efesios 6:10'),        
('Google', 'Isaías 40:29-31'),     
('Samsung', 'Salmos 46:1');     
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
INSERT INTO [Ferianueva].[dbo].[contactoInfoXProveedor]
([idProveedor],[idContactoInfo])
VALUES 
(1,46),
(2,47),
(3,48),
(4,49),
(5,50);

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
insert into dbo.tipoProveedor (dbo.tipoProveedor.descripcion) 
values ('Verduras'), ('Frutas'), ('Lacteos');

insert into dbo.tipoProveedorXProveedor(dbo.tipoProveedorXProveedor.idProveedor, dbo.tipoProveedorXProveedor.idTipoProveedor)
values (1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2);


-- ---------------------------------------------------------------------------
--								PROVEEDORxPRODUCTO
-- ---------------------------------------------------------------------------

insert into [Ferianueva].[dbo].[productoXProveedor]
([Ferianueva].[dbo].[productoXProveedor].[idProducto], [Ferianueva].[dbo].[productoXProveedor].[idProveedor])
values 
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,2),
(7,3),
(8,3),
(9,3),
(10,4),
(11,4),
(12,4),
(13,5),
(14,5),
(15,5);

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------
--								DIRECCIONxPROVEEDOR
-- ---------------------------------------------------------------------------
insert into [Ferianueva].[dbo].[direccionXProveedor] 
([Ferianueva].[dbo].[direccionXProveedor].[idDireccion], [Ferianueva].[dbo].[direccionXProveedor].[idProveedor])
values (21, 1),
(22, 2),
(23, 3),
(24, 4),
(25, 5);

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

INSERT INTO [Ferianueva].[dbo].[Pedidos]
([idProveedor],[idProducto],[cantidadProducto],[FechaEntrega],[precioUnitario],[total])
VALUES 
(1,1,40,GETDATE(),500,20000),
(1,2,40,GETDATE(),1000,40000),
(1,3,40,GETDATE(),700,28000),
(2,4,40,GETDATE(),2000,80000),
(2,5,40,GETDATE(),1000,40000),
(2,6,40,GETDATE(),1500,60000),
(3,7,40,GETDATE(),1800,72000),
(3,8,40,GETDATE(),250,10000),
(3,9,40,GETDATE(),1500,60000),
(4,10,40,GETDATE(),500,20000),
(4,11,40,GETDATE(),1000,40000),
(4,12,40,GETDATE(),1100,44000),
(5,13,40,GETDATE(),1500,60000),
(5,14,40,GETDATE(),1200,48000),
(5,15,40,GETDATE(),700,28000);

-- transporte
INSERT INTO [Ferianueva].[dbo].[Transporte]
([Capacidad])
VALUES 
(10000);

-- rutas
INSERT INTO [Ferianueva].[dbo].[Rutas]
([Fecha],[idTransporte],[idChofer])
VALUES 
(GETDATE(),1,5);

-- rutasXPedido
INSERT INTO [Ferianueva].[dbo].[rutaXPedido]
([idPedido],[idRuta],[orden],[idDireccion])
VALUES 
(1,1,1,21),
(2,1,2,21),
(3,1,3,21),
(4,1,4,22),
(5,1,5,22),
(6,1,6,22),
(7,1,7,23),
(8,1,8,23),
(9,1,9,23),
(10,1,10,24),
(11,1,11,24),
(12,1,12,24),
(13,1,13,25),
(14,1,14,25),
(15,1,15,25);
