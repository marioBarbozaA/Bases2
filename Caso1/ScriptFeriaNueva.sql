USE [master]
GO
/****** Object:  Database [Ferianueva]    Script Date: 16/2/2023 22:57:11 ******/
CREATE DATABASE [Ferianueva]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ferianueva', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Ferianueva.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ferianueva_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Ferianueva_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Ferianueva] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ferianueva].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ferianueva] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ferianueva] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ferianueva] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ferianueva] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ferianueva] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ferianueva] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ferianueva] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ferianueva] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ferianueva] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ferianueva] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ferianueva] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ferianueva] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ferianueva] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ferianueva] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ferianueva] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ferianueva] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ferianueva] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ferianueva] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ferianueva] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ferianueva] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ferianueva] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ferianueva] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ferianueva] SET RECOVERY FULL 
GO
ALTER DATABASE [Ferianueva] SET  MULTI_USER 
GO
ALTER DATABASE [Ferianueva] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ferianueva] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ferianueva] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ferianueva] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ferianueva] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ferianueva] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ferianueva', N'ON'
GO
ALTER DATABASE [Ferianueva] SET QUERY_STORE = OFF
GO
USE [Ferianueva]
GO
/****** Object:  Table [dbo].[cantones]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cantones](
	[idCanton] [int] IDENTITY(1,1) NOT NULL,
	[idProvincia] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_cantones] PRIMARY KEY CLUSTERED 
(
	[idCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](128) NOT NULL,
	[apellido1] [varchar](128) NOT NULL,
	[apellido2] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInfo]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInfo](
	[contactInfoId] [int] IDENTITY(1,1) NOT NULL,
	[Contacto] [varchar](50) NULL,
	[tipoId] [int] NOT NULL,
	[borrado] [bit] NULL,
 CONSTRAINT [PK_ContactInfo] PRIMARY KEY CLUSTERED 
(
	[contactInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactoInfoXCliente]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactoInfoXCliente](
	[idCliente] [int] NOT NULL,
	[idContactoInfo] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_contactoInfoXCliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactoInfoXEmpleado]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactoInfoXEmpleado](
	[idEmpleado] [int] NOT NULL,
	[idContacto] [int] NOT NULL,
	[contactoInfoXEmpleado] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_contactoInfoXEmpleado] PRIMARY KEY CLUSTERED 
(
	[contactoInfoXEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactoInfoXProveedor]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactoInfoXProveedor](
	[idProveedor] [int] NOT NULL,
	[idContactoInfo] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_contactoInfoXProveedor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleRuta]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleRuta](
	[idRecorrido] [int] IDENTITY(1,1) NOT NULL,
	[horaLlegada] [datetime] NOT NULL,
	[recolectado] [bit] NOT NULL,
	[idRuta] [int] NOT NULL,
	[idPedido] [int] NOT NULL,
 CONSTRAINT [PK_Recorridos] PRIMARY KEY CLUSTERED 
(
	[idRecorrido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direcciones](
	[idDireccion] [int] IDENTITY(1,1) NOT NULL,
	[localizacion] [geography] NOT NULL,
	[descripcion] [varchar](250) NOT NULL,
	[idDistrito] [int] NOT NULL,
 CONSTRAINT [PK_Direcciones] PRIMARY KEY CLUSTERED 
(
	[idDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DireccionXCliente]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DireccionXCliente](
	[idDirXCliente] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idDireccion] [int] NOT NULL,
 CONSTRAINT [PK_DireccionXCliente] PRIMARY KEY CLUSTERED 
(
	[idDirXCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[direccionXProveedor]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direccionXProveedor](
	[intDireccionXProv] [int] IDENTITY(1,1) NOT NULL,
	[idDireccion] [int] NOT NULL,
	[idProveedor] [int] NOT NULL,
 CONSTRAINT [PK_direccionXProveedor] PRIMARY KEY CLUSTERED 
(
	[intDireccionXProv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[distritos]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distritos](
	[idDistrito] [int] IDENTITY(1,1) NOT NULL,
	[idCanton] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_distritos] PRIMARY KEY CLUSTERED 
(
	[idDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido1] [varchar](50) NOT NULL,
	[apellido2] [varchar](50) NOT NULL,
	[FechaContrato] [date] NOT NULL,
	[tipoEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoOrdenId]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoOrdenId](
	[idEstadoOrden] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstadoOrdenId] PRIMARY KEY CLUSTERED 
(
	[idEstadoOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[facturaId] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[Total] [money] NOT NULL,
	[OrdenId] [int] NOT NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[facturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventarios]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventarios](
	[idInventario] [int] IDENTITY(1,1) NOT NULL,
	[idTipoAccion] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[idStatus] [int] NOT NULL,
	[nuevaExpiracion] [date] NOT NULL,
	[idRegistrador] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[idInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lotes]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lotes](
	[idLote] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[peso] [float] NOT NULL,
	[idProveedor] [int] NOT NULL,
	[precioUnitario] [money] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Lotes] PRIMARY KEY CLUSTERED 
(
	[idLote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordenes]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordenes](
	[ordenId] [int] IDENTITY(1,1) NOT NULL,
	[postime] [datetime] NOT NULL,
	[totalPrice] [money] NOT NULL,
	[pesoTotal] [float] NOT NULL,
	[clienteId] [int] NOT NULL,
	[estadoOrdenId] [int] NOT NULL,
	[direccionId] [int] NOT NULL,
 CONSTRAINT [PK_Ordenes] PRIMARY KEY CLUSTERED 
(
	[ordenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[idPedido] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidadProducto] [float] NOT NULL,
	[idProveedor] [int] NOT NULL,
	[FechaEntrega] [date] NOT NULL,
	[precioUnitario] [money] NOT NULL,
	[total] [money] NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[idUnidad] [int] NOT NULL,
	[precioVenta] [money] NOT NULL,
	[max] [float] NOT NULL,
	[min] [float] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[imagen] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoXOrden]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoXOrden](
	[producXOrdenId] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[idOrden] [int] NOT NULL,
	[cantidad] [float] NOT NULL,
	[precio] [money] NOT NULL,
 CONSTRAINT [PK_ProductoXOrden] PRIMARY KEY CLUSTERED 
(
	[producXOrdenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productoXProveedor]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productoXProveedor](
	[idProveeXProduct] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[idProveedor] [int] NOT NULL,
 CONSTRAINT [PK_productoXProveedor] PRIMARY KEY CLUSTERED 
(
	[idProveeXProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[idProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[idProvincia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restauraciones]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restauraciones](
	[idRestauracion] [int] NOT NULL,
	[idLote] [int] NOT NULL,
	[PesoDesechado] [float] NOT NULL,
	[NuevaExpiracion] [date] NOT NULL,
	[idRestaurador] [int] NOT NULL,
 CONSTRAINT [PK_Restauracion] PRIMARY KEY CLUSTERED 
(
	[idRestauracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestauracionXInventario]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestauracionXInventario](
	[idInventario] [int] NOT NULL,
	[idRestauración] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[restauXInvenId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_RestauracionXInventario] PRIMARY KEY CLUSTERED 
(
	[restauXInvenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutas]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutas](
	[idRuta] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[idTransporte] [int] NOT NULL,
	[idChofer] [int] NOT NULL,
 CONSTRAINT [PK_Rutas] PRIMARY KEY CLUSTERED 
(
	[idRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rutaXPedido]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rutaXPedido](
	[ID] [int] NOT NULL,
	[idRuta] [int] NOT NULL,
	[idPedido] [int] NOT NULL,
	[orden] [int] NOT NULL,
	[idDireccion] [int] NOT NULL,
 CONSTRAINT [PK_rutaXPedido] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RutaXProveedor]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RutaXProveedor](
	[idProveedor] [int] NOT NULL,
	[idRuta] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[rutaXProvId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_RutaXProveedor] PRIMARY KEY CLUSTERED 
(
	[rutaXProvId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusProducto]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusProducto](
	[idStatus] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[IconoURL] [varchar](128) NOT NULL,
 CONSTRAINT [PK_StatusProducto] PRIMARY KEY CLUSTERED 
(
	[idStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusRecorridos]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusRecorridos](
	[idStatus] [bit] NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
 CONSTRAINT [PK_StatusRecorrido] PRIMARY KEY CLUSTERED 
(
	[idStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoAccion]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoAccion](
	[idTipoAccion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_tipoAccion] PRIMARY KEY CLUSTERED 
(
	[idTipoAccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoContactInfo]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoContactInfo](
	[idTipo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipoContactInfo] PRIMARY KEY CLUSTERED 
(
	[idTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpleado](
	[idTipoEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[salario] [money] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoEmpleado] PRIMARY KEY CLUSTERED 
(
	[idTipoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoProveedor]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoProveedor](
	[idTipo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
 CONSTRAINT [PK_tipoProveedor] PRIMARY KEY CLUSTERED 
(
	[idTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoProveedorXProveedor]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoProveedorXProveedor](
	[idProveedor] [int] NOT NULL,
	[idTipoProveedor] [int] NOT NULL,
	[idTipoProvXProv] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tipoProveedorXProveedor] PRIMARY KEY CLUSTERED 
(
	[idTipoProvXProv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transporte]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transporte](
	[idTransporte] [int] IDENTITY(1,1) NOT NULL,
	[Capacidad] [float] NOT NULL,
 CONSTRAINT [PK_Transporte] PRIMARY KEY CLUSTERED 
(
	[idTransporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unidades]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidades](
	[idUnidad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Unidades] PRIMARY KEY CLUSTERED 
(
	[idUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactInfo] ADD  CONSTRAINT [DF_ContactInfo_borrado]  DEFAULT ((0)) FOR [borrado]
GO
ALTER TABLE [dbo].[cantones]  WITH CHECK ADD  CONSTRAINT [FK_cantones_Provincias] FOREIGN KEY([idProvincia])
REFERENCES [dbo].[Provincias] ([idProvincia])
GO
ALTER TABLE [dbo].[cantones] CHECK CONSTRAINT [FK_cantones_Provincias]
GO
ALTER TABLE [dbo].[ContactInfo]  WITH CHECK ADD  CONSTRAINT [FK_ContactInfo_tipoContactInfo] FOREIGN KEY([tipoId])
REFERENCES [dbo].[tipoContactInfo] ([idTipo])
GO
ALTER TABLE [dbo].[ContactInfo] CHECK CONSTRAINT [FK_ContactInfo_tipoContactInfo]
GO
ALTER TABLE [dbo].[contactoInfoXCliente]  WITH CHECK ADD  CONSTRAINT [FK_contactoInfoXCliente_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[contactoInfoXCliente] CHECK CONSTRAINT [FK_contactoInfoXCliente_Clientes]
GO
ALTER TABLE [dbo].[contactoInfoXCliente]  WITH CHECK ADD  CONSTRAINT [FK_contactoInfoXCliente_ContactInfo] FOREIGN KEY([idContactoInfo])
REFERENCES [dbo].[ContactInfo] ([contactInfoId])
GO
ALTER TABLE [dbo].[contactoInfoXCliente] CHECK CONSTRAINT [FK_contactoInfoXCliente_ContactInfo]
GO
ALTER TABLE [dbo].[contactoInfoXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_contactoInfoXEmpleado_ContactInfo] FOREIGN KEY([idContacto])
REFERENCES [dbo].[ContactInfo] ([contactInfoId])
GO
ALTER TABLE [dbo].[contactoInfoXEmpleado] CHECK CONSTRAINT [FK_contactoInfoXEmpleado_ContactInfo]
GO
ALTER TABLE [dbo].[contactoInfoXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_contactoInfoXEmpleado_Empleados] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleados] ([idEmpleado])
GO
ALTER TABLE [dbo].[contactoInfoXEmpleado] CHECK CONSTRAINT [FK_contactoInfoXEmpleado_Empleados]
GO
ALTER TABLE [dbo].[contactoInfoXProveedor]  WITH CHECK ADD  CONSTRAINT [FK_contactoInfoXProveedor_ContactInfo] FOREIGN KEY([idContactoInfo])
REFERENCES [dbo].[ContactInfo] ([contactInfoId])
GO
ALTER TABLE [dbo].[contactoInfoXProveedor] CHECK CONSTRAINT [FK_contactoInfoXProveedor_ContactInfo]
GO
ALTER TABLE [dbo].[contactoInfoXProveedor]  WITH CHECK ADD  CONSTRAINT [FK_contactoInfoXProveedor_Proveedores] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedores] ([idProveedor])
GO
ALTER TABLE [dbo].[contactoInfoXProveedor] CHECK CONSTRAINT [FK_contactoInfoXProveedor_Proveedores]
GO
ALTER TABLE [dbo].[DetalleRuta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleRuta_Pedidos] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedidos] ([idPedido])
GO
ALTER TABLE [dbo].[DetalleRuta] CHECK CONSTRAINT [FK_DetalleRuta_Pedidos]
GO
ALTER TABLE [dbo].[DetalleRuta]  WITH CHECK ADD  CONSTRAINT [FK_Recorridos_Lotes] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Lotes] ([idLote])
GO
ALTER TABLE [dbo].[DetalleRuta] CHECK CONSTRAINT [FK_Recorridos_Lotes]
GO
ALTER TABLE [dbo].[DetalleRuta]  WITH CHECK ADD  CONSTRAINT [FK_Recorridos_Rutas] FOREIGN KEY([idRuta])
REFERENCES [dbo].[Rutas] ([idRuta])
GO
ALTER TABLE [dbo].[DetalleRuta] CHECK CONSTRAINT [FK_Recorridos_Rutas]
GO
ALTER TABLE [dbo].[DetalleRuta]  WITH CHECK ADD  CONSTRAINT [FK_Recorridos_StatusRecorrido] FOREIGN KEY([recolectado])
REFERENCES [dbo].[StatusRecorridos] ([idStatus])
GO
ALTER TABLE [dbo].[DetalleRuta] CHECK CONSTRAINT [FK_Recorridos_StatusRecorrido]
GO
ALTER TABLE [dbo].[Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Direcciones_distritos] FOREIGN KEY([idDistrito])
REFERENCES [dbo].[distritos] ([idDistrito])
GO
ALTER TABLE [dbo].[Direcciones] CHECK CONSTRAINT [FK_Direcciones_distritos]
GO
ALTER TABLE [dbo].[DireccionXCliente]  WITH CHECK ADD  CONSTRAINT [FK_DireccionXCliente_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[DireccionXCliente] CHECK CONSTRAINT [FK_DireccionXCliente_Clientes]
GO
ALTER TABLE [dbo].[DireccionXCliente]  WITH CHECK ADD  CONSTRAINT [FK_DireccionXCliente_Direcciones] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direcciones] ([idDireccion])
GO
ALTER TABLE [dbo].[DireccionXCliente] CHECK CONSTRAINT [FK_DireccionXCliente_Direcciones]
GO
ALTER TABLE [dbo].[direccionXProveedor]  WITH CHECK ADD  CONSTRAINT [FK_direccionXProveedor_Direcciones] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direcciones] ([idDireccion])
GO
ALTER TABLE [dbo].[direccionXProveedor] CHECK CONSTRAINT [FK_direccionXProveedor_Direcciones]
GO
ALTER TABLE [dbo].[direccionXProveedor]  WITH CHECK ADD  CONSTRAINT [FK_direccionXProveedor_Proveedores] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedores] ([idProveedor])
GO
ALTER TABLE [dbo].[direccionXProveedor] CHECK CONSTRAINT [FK_direccionXProveedor_Proveedores]
GO
ALTER TABLE [dbo].[distritos]  WITH CHECK ADD  CONSTRAINT [FK_distritos_cantones] FOREIGN KEY([idCanton])
REFERENCES [dbo].[cantones] ([idCanton])
GO
ALTER TABLE [dbo].[distritos] CHECK CONSTRAINT [FK_distritos_cantones]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_TipoEmpleado] FOREIGN KEY([tipoEmpleado])
REFERENCES [dbo].[TipoEmpleado] ([idTipoEmpleado])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_TipoEmpleado]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Ordenes] FOREIGN KEY([OrdenId])
REFERENCES [dbo].[Ordenes] ([ordenId])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Ordenes]
GO
ALTER TABLE [dbo].[Inventarios]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_StatusProducto] FOREIGN KEY([idStatus])
REFERENCES [dbo].[StatusProducto] ([idStatus])
GO
ALTER TABLE [dbo].[Inventarios] CHECK CONSTRAINT [FK_Inventario_StatusProducto]
GO
ALTER TABLE [dbo].[Inventarios]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_tipoAccion] FOREIGN KEY([idTipoAccion])
REFERENCES [dbo].[tipoAccion] ([idTipoAccion])
GO
ALTER TABLE [dbo].[Inventarios] CHECK CONSTRAINT [FK_Inventario_tipoAccion]
GO
ALTER TABLE [dbo].[Inventarios]  WITH CHECK ADD  CONSTRAINT [FK_Inventarios_Empleados] FOREIGN KEY([idRegistrador])
REFERENCES [dbo].[Empleados] ([idEmpleado])
GO
ALTER TABLE [dbo].[Inventarios] CHECK CONSTRAINT [FK_Inventarios_Empleados]
GO
ALTER TABLE [dbo].[Inventarios]  WITH CHECK ADD  CONSTRAINT [FK_Inventarios_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[Inventarios] CHECK CONSTRAINT [FK_Inventarios_Productos]
GO
ALTER TABLE [dbo].[Lotes]  WITH CHECK ADD  CONSTRAINT [FK_Lotes_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[Lotes] CHECK CONSTRAINT [FK_Lotes_Productos]
GO
ALTER TABLE [dbo].[Lotes]  WITH CHECK ADD  CONSTRAINT [FK_Lotes_Proveedores] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedores] ([idProveedor])
GO
ALTER TABLE [dbo].[Lotes] CHECK CONSTRAINT [FK_Lotes_Proveedores]
GO
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_Clientes] FOREIGN KEY([clienteId])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [FK_Ordenes_Clientes]
GO
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_DireccionXCliente] FOREIGN KEY([direccionId])
REFERENCES [dbo].[DireccionXCliente] ([idDirXCliente])
GO
ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [FK_Ordenes_DireccionXCliente]
GO
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_EstadoOrdenId] FOREIGN KEY([estadoOrdenId])
REFERENCES [dbo].[EstadoOrdenId] ([idEstadoOrden])
GO
ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [FK_Ordenes_EstadoOrdenId]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Productos]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Proveedores] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedores] ([idProveedor])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Proveedores]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Unidades] FOREIGN KEY([idUnidad])
REFERENCES [dbo].[Unidades] ([idUnidad])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Unidades]
GO
ALTER TABLE [dbo].[ProductoXOrden]  WITH CHECK ADD  CONSTRAINT [FK_ProductoXOrden_Ordenes] FOREIGN KEY([idOrden])
REFERENCES [dbo].[Ordenes] ([ordenId])
GO
ALTER TABLE [dbo].[ProductoXOrden] CHECK CONSTRAINT [FK_ProductoXOrden_Ordenes]
GO
ALTER TABLE [dbo].[ProductoXOrden]  WITH CHECK ADD  CONSTRAINT [FK_ProductoXOrden_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[ProductoXOrden] CHECK CONSTRAINT [FK_ProductoXOrden_Productos]
GO
ALTER TABLE [dbo].[productoXProveedor]  WITH CHECK ADD  CONSTRAINT [FK_productoXProveedor_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[productoXProveedor] CHECK CONSTRAINT [FK_productoXProveedor_Productos]
GO
ALTER TABLE [dbo].[productoXProveedor]  WITH CHECK ADD  CONSTRAINT [FK_productoXProveedor_Proveedores] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedores] ([idProveedor])
GO
ALTER TABLE [dbo].[productoXProveedor] CHECK CONSTRAINT [FK_productoXProveedor_Proveedores]
GO
ALTER TABLE [dbo].[Restauraciones]  WITH CHECK ADD  CONSTRAINT [FK_Restauraciones_Empleados] FOREIGN KEY([idRestaurador])
REFERENCES [dbo].[Empleados] ([idEmpleado])
GO
ALTER TABLE [dbo].[Restauraciones] CHECK CONSTRAINT [FK_Restauraciones_Empleados]
GO
ALTER TABLE [dbo].[Restauraciones]  WITH CHECK ADD  CONSTRAINT [FK_Restauraciones_Lotes] FOREIGN KEY([idLote])
REFERENCES [dbo].[Lotes] ([idLote])
GO
ALTER TABLE [dbo].[Restauraciones] CHECK CONSTRAINT [FK_Restauraciones_Lotes]
GO
ALTER TABLE [dbo].[RestauracionXInventario]  WITH CHECK ADD  CONSTRAINT [FK_RestauracionXInventario_Inventarios] FOREIGN KEY([idInventario])
REFERENCES [dbo].[Inventarios] ([idInventario])
GO
ALTER TABLE [dbo].[RestauracionXInventario] CHECK CONSTRAINT [FK_RestauracionXInventario_Inventarios]
GO
ALTER TABLE [dbo].[RestauracionXInventario]  WITH CHECK ADD  CONSTRAINT [FK_RestauracionXInventario_Restauraciones] FOREIGN KEY([idRestauración])
REFERENCES [dbo].[Restauraciones] ([idRestauracion])
GO
ALTER TABLE [dbo].[RestauracionXInventario] CHECK CONSTRAINT [FK_RestauracionXInventario_Restauraciones]
GO
ALTER TABLE [dbo].[Rutas]  WITH CHECK ADD  CONSTRAINT [FK_Rutas_Empleados] FOREIGN KEY([idChofer])
REFERENCES [dbo].[Empleados] ([idEmpleado])
GO
ALTER TABLE [dbo].[Rutas] CHECK CONSTRAINT [FK_Rutas_Empleados]
GO
ALTER TABLE [dbo].[Rutas]  WITH CHECK ADD  CONSTRAINT [FK_Rutas_Transporte] FOREIGN KEY([idTransporte])
REFERENCES [dbo].[Transporte] ([idTransporte])
GO
ALTER TABLE [dbo].[Rutas] CHECK CONSTRAINT [FK_Rutas_Transporte]
GO
ALTER TABLE [dbo].[rutaXPedido]  WITH CHECK ADD  CONSTRAINT [FK_rutaXPedido_Pedidos] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedidos] ([idPedido])
GO
ALTER TABLE [dbo].[rutaXPedido] CHECK CONSTRAINT [FK_rutaXPedido_Pedidos]
GO
ALTER TABLE [dbo].[rutaXPedido]  WITH CHECK ADD  CONSTRAINT [FK_rutaXPedido_Rutas] FOREIGN KEY([idRuta])
REFERENCES [dbo].[Rutas] ([idRuta])
GO
ALTER TABLE [dbo].[rutaXPedido] CHECK CONSTRAINT [FK_rutaXPedido_Rutas]
GO
ALTER TABLE [dbo].[RutaXProveedor]  WITH CHECK ADD  CONSTRAINT [FK_RutaXProveedor_Proveedores] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedores] ([idProveedor])
GO
ALTER TABLE [dbo].[RutaXProveedor] CHECK CONSTRAINT [FK_RutaXProveedor_Proveedores]
GO
ALTER TABLE [dbo].[RutaXProveedor]  WITH CHECK ADD  CONSTRAINT [FK_RutaXProveedor_Rutas] FOREIGN KEY([idRuta])
REFERENCES [dbo].[Rutas] ([idRuta])
GO
ALTER TABLE [dbo].[RutaXProveedor] CHECK CONSTRAINT [FK_RutaXProveedor_Rutas]
GO
ALTER TABLE [dbo].[tipoProveedorXProveedor]  WITH CHECK ADD  CONSTRAINT [FK_tipoProveedorXProveedor_Proveedores] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedores] ([idProveedor])
GO
ALTER TABLE [dbo].[tipoProveedorXProveedor] CHECK CONSTRAINT [FK_tipoProveedorXProveedor_Proveedores]
GO
ALTER TABLE [dbo].[tipoProveedorXProveedor]  WITH CHECK ADD  CONSTRAINT [FK_tipoProveedorXProveedor_tipoProveedor] FOREIGN KEY([idTipoProveedor])
REFERENCES [dbo].[tipoProveedor] ([idTipo])
GO
ALTER TABLE [dbo].[tipoProveedorXProveedor] CHECK CONSTRAINT [FK_tipoProveedorXProveedor_tipoProveedor]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarFactura]    Script Date: 16/2/2023 22:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarFactura]
AS
BEGIN
    SET NOCOUNT ON;
    update dbo.Facturas 
	set dbo.facturas.Total = (SELECT Ordenes.totalPrice from Ordenes where Facturas.OrdenId = Ordenes.ordenId),
	dbo.facturas.fecha = (SELECT Ordenes.postime from Ordenes where Facturas.OrdenId = Ordenes.ordenId)
	where 1=1;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarProductoXOrden]    Script Date: 16/2/2023 22:57:11 ******/
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
USE [master]
GO
ALTER DATABASE [Ferianueva] SET  READ_WRITE 
GO
