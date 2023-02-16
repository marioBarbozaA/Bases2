-- ------------------------------------------------------------------------
/*									CLIENTES							*/
-- ------------------------------------------------------------------------
insert into Ferianueva.dbo.Clientes(nombre, dbo.Clientes.apellido1, dbo.Clientes.apellido2, dbo.Clientes.celular,dbo.Clientes.email)
values 
('Grace','Starcher','Parker',80080268, 'GraStarcher@gmail.com'),
 ('Tiny','Jones','Mansfield',83365631, 'TinJones@gmail.com'),
 ('Evan','Reichenbach','Tran',89956157, 'EvaReichenbach@gmail.com'),
 ('Richard','Rush','Gartrell',82806739, 'RicRush@gmail.com'),
 ('Lawrence','Bernhart','Settles',83714516, 'LawBernhart@gmail.com'),
 ('Joan','Gosselin','Griffin',82688393, 'JoaGosselin@gmail.com'),
 ('Jason','Hoag','Daley',81370699, 'JasHoag@gmail.com'),
 ('David','Tung','Sharp',86617568, 'DavTung@gmail.com'),
 ('Christina','Sabino','Chatfield',89874539, 'ChrSabino@gmail.com'),
 ('Jeffrey','Guerrero','Patillo',82979275, 'JefGuerrero@gmail.com'),
 ('Raymond','Foust','Nguyen',82385652, 'RayFoust@gmail.com'),
 ('Deangelo','Considine','Gordon',86830732, 'DeaConsidine@gmail.com'),
 ('Terry','Arnold','Mathew',89605250, 'TerArnold@gmail.com'),
 ('Nina','Westerman','Banda',86079107, 'NinWesterman@gmail.com'),
 ('Ashley','Mckinley','Priolo',85371669, 'AshMckinley@gmail.com'),
 ('Joya','Hathaway','Smith',81029918, 'JoyHathaway@gmail.com'),
 ('Lorraine','Bullock','Keeler',85133678, 'LorBullock@gmail.com'),
 ('Joan','Jones','Madden',84914047, 'JoaJones@gmail.com'),
 ('Kevin','Kent','Black',89180931, 'KevKent@gmail.com'),
 ('Cheryl','Wyman','Mcfarland',85096644, 'CheWyman@gmail.com');
 
 -- Insert data into the Tipo Empleado

 INSERT INTO [Ferianueva].[dbo].[TipoEmpleado] ([salario], [descripcion])
VALUES 
   (10000, 'Facturador'),
   (20000,'Restuarador'),
   (15000,'Chofer');

 -- Insert data into the Empleados

INSERT INTO [Ferianueva].[dbo].[Empleados] 
([nombre], [apellido1], [apellido2], [FechaContrato], [celular], [tipoEmpleado])
VALUES 
('Juan', 'Pérez', 'Gómez', '2022-01-01', 5551234, 1),
('María', 'López', 'Fernández', '2022-02-01', 5555678, 2),
('Pedro', 'García', 'Sánchez', '2022-03-01', 5559012, 1),
('Ana', 'Martínez', 'Gutiérrez', '2022-04-01', 5553456, 2),
('Carlos', 'Jiménez', 'Díaz', '2022-05-01', 5557890, 1);
 
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

-- Insert data into the Provincias
INSERT INTO [Ferianueva].[dbo].[Provincias] 
([nombre])
VALUES 
('San José'),
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
(4,'Orosí'),
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
(4,'San Ramón'),
(1,'Cipreses'),
(1,'San Jose centro'),
(2,'Orosí'),
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
(6, 'Supermercado Palí Orosi', geography::STGeomFromText('POINT(-83.8529279 9.8373461)', 4326)),
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
