USE [master]
GO
/****** Object:  Database [Ferianueva]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[cantones]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Direcciones]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[DireccionXCliente]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[direccionXProveedor]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[distritos]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Empleados]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[EstadoOrdenId]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Facturas]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Inventarios]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Lotes]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Ordenes]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Productos]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[ProductoXOrden]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[productoXProveedor]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Proveedores]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Provincias]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Recorridos]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Restauraciones]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[RestauracionXInventario]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Rutas]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[RutaXProveedor]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[StatusProducto]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[StatusRecorridos]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[tipoAccion]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[tipoProveedor]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[tipoProveedorXProveedor]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Transporte]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  Table [dbo].[Unidades]    Script Date: 15/2/2023 20:44:16 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarProductoXOrden]    Script Date: 15/2/2023 20:44:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ------------------------------------------------------------------------
/*									CLIENTES							*/
-- ------------------------------------------------------------------------
insert into dbo.Clientes (dbo.Clientes.nombre, dbo.Clientes.apellido1, dbo.Clientes.apellido2, dbo.Clientes.celular,
dbo.Clientes.email) values 
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
 insert into dbo.EstadoOrdenID (dbo.EstadoOrdenId.descripcion)
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
   (10000, 'Facturador'),
   (20000,'Restuarador'),
   (15000,'Chofer');

 -- Insert data into the Empleados

INSERT INTO [Ferianueva].[dbo].[Empleados] 
([nombre], [apellido1], [apellido2], [FechaContrato], [celular], [tipoEmpleado])
VALUES 
('Juan', 'P�rez', 'G�mez', '2022-01-01', 5551234, 1),
('Mar�a', 'L�pez', 'Fern�ndez', '2022-02-01', 5555678, 2),
('Pedro', 'Garc�a', 'S�nchez', '2022-03-01', 5559012, 1),
('Ana', 'Mart�nez', 'Guti�rrez', '2022-04-01', 5553456, 2),
('Carlos', 'Jim�nez', 'D�az', '2022-05-01', 5557890, 1);
 
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
USE [Ferianueva]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarFacturas]    Script Date: 15/2/2023 20:35:06 ******/
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
/**/
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
Exec ActualizarFactura;

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