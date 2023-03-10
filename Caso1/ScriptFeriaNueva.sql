USE [master]
GO
/****** Object:  Database [Ferianueva]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[cantones]    Script Date: 15/2/2023 16:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cantones](
	[idCanton] [int] IDENTITY(1,1) NOT NULL,
	[idProvincia] [int] NOT NULL,
	[nombre] [int] NOT NULL,
 CONSTRAINT [PK_cantones] PRIMARY KEY CLUSTERED 
(
	[idCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 15/2/2023 16:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](128) NOT NULL,
	[apellido1] [varchar](128) NOT NULL,
	[apellido2] [varchar](128) NOT NULL,
	[celular] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[DireccionXCliente]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[direccionXProveedor]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[distritos]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[Empleados]    Script Date: 15/2/2023 16:36:06 ******/
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
	[celular] [int] NOT NULL,
	[tipoEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoOrdenId]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[Facturas]    Script Date: 15/2/2023 16:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[facturaId] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[Total] [money] NOT NULL,
	[OrdenId] [int] NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[facturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturaXProducto]    Script Date: 15/2/2023 16:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturaXProducto](
	[factXproductoId] [int] NOT NULL,
	[productoId] [int] NOT NULL,
	[cantProducto] [float] NOT NULL,
	[precio] [money] NOT NULL,
	[facturaId] [int] NOT NULL,
 CONSTRAINT [PK_facturaXProducto] PRIMARY KEY CLUSTERED 
(
	[factXproductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventarios]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[Lotes]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[Ordenes]    Script Date: 15/2/2023 16:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordenes](
	[ordenId] [int] IDENTITY(1,1) NOT NULL,
	[postime] [datetime] NOT NULL,
	[totalPrice] [money] NOT NULL,
	[estadoId] [int] NOT NULL,
	[pesoTotal] [float] NOT NULL,
	[clienteId] [int] NULL,
	[estadoOrdenId] [int] NULL,
 CONSTRAINT [PK_Ordenes] PRIMARY KEY CLUSTERED 
(
	[ordenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[ProductoXOrden]    Script Date: 15/2/2023 16:36:06 ******/
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
	[estadoId] [int] NOT NULL,
 CONSTRAINT [PK_ProductoXOrden] PRIMARY KEY CLUSTERED 
(
	[producXOrdenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productoXProveedor]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[Proveedores]    Script Date: 15/2/2023 16:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[idProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[telefono] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[Recorridos]    Script Date: 15/2/2023 16:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recorridos](
	[idRecorrido] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[idStatus] [int] NOT NULL,
	[idRuta] [int] NOT NULL,
	[idLote] [int] NOT NULL,
 CONSTRAINT [PK_Recorridos] PRIMARY KEY CLUSTERED 
(
	[idRecorrido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restauraciones]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[RestauracionXInventario]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[Rutas]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[RutaXProveedor]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[StatusProducto]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[StatusRecorridos]    Script Date: 15/2/2023 16:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusRecorridos](
	[idStatus] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
 CONSTRAINT [PK_StatusRecorrido] PRIMARY KEY CLUSTERED 
(
	[idStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoAccion]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[tipoProveedor]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[tipoProveedorXProveedor]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[Transporte]    Script Date: 15/2/2023 16:36:06 ******/
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
/****** Object:  Table [dbo].[Unidades]    Script Date: 15/2/2023 16:36:06 ******/
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
ALTER TABLE [dbo].[cantones]  WITH CHECK ADD  CONSTRAINT [FK_cantones_Provincias] FOREIGN KEY([idProvincia])
REFERENCES [dbo].[Provincias] ([idProvincia])
GO
ALTER TABLE [dbo].[cantones] CHECK CONSTRAINT [FK_cantones_Provincias]
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
ALTER TABLE [dbo].[facturaXProducto]  WITH CHECK ADD  CONSTRAINT [FK_facturaXProducto_Facturas] FOREIGN KEY([facturaId])
REFERENCES [dbo].[Facturas] ([facturaId])
GO
ALTER TABLE [dbo].[facturaXProducto] CHECK CONSTRAINT [FK_facturaXProducto_Facturas]
GO
ALTER TABLE [dbo].[facturaXProducto]  WITH CHECK ADD  CONSTRAINT [FK_facturaXProducto_Productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[facturaXProducto] CHECK CONSTRAINT [FK_facturaXProducto_Productos]
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
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_EstadoOrdenId] FOREIGN KEY([estadoOrdenId])
REFERENCES [dbo].[EstadoOrdenId] ([idEstadoOrden])
GO
ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [FK_Ordenes_EstadoOrdenId]
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
ALTER TABLE [dbo].[Recorridos]  WITH CHECK ADD  CONSTRAINT [FK_Recorridos_Lotes] FOREIGN KEY([idLote])
REFERENCES [dbo].[Lotes] ([idLote])
GO
ALTER TABLE [dbo].[Recorridos] CHECK CONSTRAINT [FK_Recorridos_Lotes]
GO
ALTER TABLE [dbo].[Recorridos]  WITH CHECK ADD  CONSTRAINT [FK_Recorridos_Rutas] FOREIGN KEY([idRuta])
REFERENCES [dbo].[Rutas] ([idRuta])
GO
ALTER TABLE [dbo].[Recorridos] CHECK CONSTRAINT [FK_Recorridos_Rutas]
GO
ALTER TABLE [dbo].[Recorridos]  WITH CHECK ADD  CONSTRAINT [FK_Recorridos_StatusRecorrido] FOREIGN KEY([idStatus])
REFERENCES [dbo].[StatusRecorridos] ([idStatus])
GO
ALTER TABLE [dbo].[Recorridos] CHECK CONSTRAINT [FK_Recorridos_StatusRecorrido]
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
USE [master]
GO
ALTER DATABASE [Ferianueva] SET  READ_WRITE 
GO
