-- ------------------------------------------------------------------------
/*									CLIENTES							*/
-- ------------------------------------------------------------------------
/*insert into dbo.Clientes (dbo.Clientes.nombre, dbo.Clientes.apellido1, dbo.Clientes.apellido2, dbo.Clientes.celular,
dbo.Clientes.email)
values ('Grace','Starcher','Parker',80080268, 'GraStarcher@gmail.com'),
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
 ('Cheryl','Wyman','Mcfarland',85096644, 'CheWyman@gmail.com') */

 -- ---------------------------------------------------------------
 --						Estado orden
 -- ---------------------------------------------------------------
 /*insert into dbo.EstadoOrden (dbo.EstadoOrden.descripcion)
values ('En proceso'), ('Por entregar'), ('Entregada')*/

 -- ---------------------------------------------------------------
 --						 orden
 -- ---------------------------------------------------------------
 /*
insert into Ferianueva.dbo.Ordenes (FeriaNueva.dbo.Ordenes.postime, FeriaNueva.dbo.Ordenes.totalPrice, 
FeriaNueva.dbo.Ordenes.pesoTotal, FeriaNueva.dbo.Ordenes.clienteId, FeriaNueva.dbo.Ordenes.estadoOrdenId, 
FeriaNueva.dbo.Ordenes.direccionId)
values (SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,1,3, 1),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,1,3, 1),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,2,3, 2),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,2,3, 2),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,3,3, 3),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,3,3, 3),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,4,3, 4),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,4,3, 4),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,5,3, 5),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,5,3, 5),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,5,3, 5),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,6,3, 6),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,6,3, 6),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,7,3, 7),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,7,3, 7),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,7,3, 7),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,8,3, 8),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,9,3, 9),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,9,3, 9),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,10,3, 10),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,11,3, 11),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,12,3, 12),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,13,3, 13),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,13,3, 13),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,13,3, 13),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,14,3, 14),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,14,3, 14),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,14,3, 14),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,15,3, 15),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,16,3, 16),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,16,3, 16),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,17,3, 17),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,17,3, 17),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,18,3, 18),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,18,3, 18),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,18,3, 18),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,19,3, 19),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,19,3, 19),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,20,3, 20),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,20,3, 20),
(SELECT DATEADD(dd, RAND()*27*-2, GETDATE()), 0, 0,20,3, 20);*/

 -- ---------------------------------------------------------------
 --						 productoXOrden
 -- ---------------------------------------------------------------