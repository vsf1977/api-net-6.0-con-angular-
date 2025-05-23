USE [master]
GO
/****** Object:  Database [aeropuerto]    Script Date: 21/05/2025 11:00:51 ******/
CREATE DATABASE [aeropuerto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'aeropuerto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\aeropuerto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'aeropuerto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\aeropuerto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [aeropuerto] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [aeropuerto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [aeropuerto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [aeropuerto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [aeropuerto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [aeropuerto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [aeropuerto] SET ARITHABORT OFF 
GO
ALTER DATABASE [aeropuerto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [aeropuerto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [aeropuerto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [aeropuerto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [aeropuerto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [aeropuerto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [aeropuerto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [aeropuerto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [aeropuerto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [aeropuerto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [aeropuerto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [aeropuerto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [aeropuerto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [aeropuerto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [aeropuerto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [aeropuerto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [aeropuerto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [aeropuerto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [aeropuerto] SET  MULTI_USER 
GO
ALTER DATABASE [aeropuerto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [aeropuerto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [aeropuerto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [aeropuerto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [aeropuerto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [aeropuerto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [aeropuerto] SET QUERY_STORE = ON
GO
ALTER DATABASE [aeropuerto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [aeropuerto]
GO
/****** Object:  Table [dbo].[Avion]    Script Date: 21/05/2025 11:00:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avion](
	[id] [uniqueidentifier] NOT NULL,
	[matricula] [varchar](10) NOT NULL,
	[id_fabricante] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Avion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 21/05/2025 11:00:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[id] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ciudades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fabricante]    Script Date: 21/05/2025 11:00:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fabricante](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Fabricante] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Itinerario]    Script Date: 21/05/2025 11:00:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itinerario](
	[id] [uniqueidentifier] NOT NULL,
	[id_vuelo] [uniqueidentifier] NOT NULL,
	[fecha_hora] [date] NOT NULL,
	[duracion] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_Itinerario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelo]    Script Date: 21/05/2025 11:00:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelo](
	[id] [uniqueidentifier] NOT NULL,
	[id_ciudad_salida] [uniqueidentifier] NOT NULL,
	[id_ciudad_llegada] [uniqueidentifier] NOT NULL,
	[id_avion] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Vuelos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Avion] ([id], [matricula], [id_fabricante]) VALUES (N'16facf83-bc3b-47b2-2c98-08dd940c5220', N'HK-110', N'b84cbac1-bd44-4c0d-a2bb-b90de5f70719')
INSERT [dbo].[Avion] ([id], [matricula], [id_fabricante]) VALUES (N'7ed3a9d8-2b66-431f-2c99-08dd940c5220', N'HK-108', N'46ec1b29-ccdf-43a7-98c7-d975692978f9')
INSERT [dbo].[Avion] ([id], [matricula], [id_fabricante]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa6', N'HK-109', N'46ec1b29-ccdf-43a7-98c7-d975692978f9')
INSERT [dbo].[Avion] ([id], [matricula], [id_fabricante]) VALUES (N'384421ec-5e6c-444d-85be-41dde92156cb', N'HK-105', N'46ec1b29-ccdf-43a7-98c7-d975692978f9')
INSERT [dbo].[Avion] ([id], [matricula], [id_fabricante]) VALUES (N'fe0b41fc-41aa-4c20-b45b-5a50e375f9d0', N'HK-102', N'46ec1b29-ccdf-43a7-98c7-d975692978f9')
INSERT [dbo].[Avion] ([id], [matricula], [id_fabricante]) VALUES (N'ed25a0ba-8cd3-4b52-829b-87492b7b0b17', N'HK-106', N'46ec1b29-ccdf-43a7-98c7-d975692978f9')
INSERT [dbo].[Avion] ([id], [matricula], [id_fabricante]) VALUES (N'45055a93-9fcd-494f-8ef3-958936d8a964', N'HK-104', N'c42d0d61-1db8-40bf-8d9c-62595a0afca4')
INSERT [dbo].[Avion] ([id], [matricula], [id_fabricante]) VALUES (N'74250de6-70be-468f-aecd-9624449dff45', N'HK-101', N'c42d0d61-1db8-40bf-8d9c-62595a0afca4')
INSERT [dbo].[Avion] ([id], [matricula], [id_fabricante]) VALUES (N'e745dfd9-8a1a-4ae1-9345-b480200b63f2', N'HK-103', N'46ec1b29-ccdf-43a7-98c7-d975692978f9')
INSERT [dbo].[Avion] ([id], [matricula], [id_fabricante]) VALUES (N'b3a8ef4a-43c5-4bfa-9870-b792350c6d91', N'HK-107', N'46ec1b29-ccdf-43a7-98c7-d975692978f9')
GO
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'1cc473d6-0336-4687-9353-c3248c60789c', N'Barranquilla')
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'9347383a-999a-4d12-b07f-1061ada606da', N'Bogotá D.C.')
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'5e588f67-37e7-4b62-a96c-1e8f66dde971', N'Bucaramanga')
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'677bc6e7-5d6c-4821-861b-e7843f87e87c', N'Cartagena')
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'b7ed0ad2-5f15-4625-8cc1-ce42543c040f', N'Medellin')
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'a2ab72ca-e11b-4aa9-8c18-08dd940c4196', N'Riohacha')
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'068cb7d7-0c2f-4158-befe-59c61835317e', N'Santa Marta')
GO
INSERT [dbo].[Fabricante] ([Id], [Nombre]) VALUES (N'46ec1b29-ccdf-43a7-98c7-d975692978f9', N'AIRBUS')
INSERT [dbo].[Fabricante] ([Id], [Nombre]) VALUES (N'c42d0d61-1db8-40bf-8d9c-62595a0afca4', N'BOEING')
INSERT [dbo].[Fabricante] ([Id], [Nombre]) VALUES (N'b84cbac1-bd44-4c0d-a2bb-b90de5f70719', N'EMBRAER')
GO
INSERT [dbo].[Vuelo] ([id], [id_ciudad_salida], [id_ciudad_llegada], [id_avion]) VALUES (N'0e3dce4c-38fe-4f2c-2fcb-08dd9245c5b2', N'1cc473d6-0336-4687-9353-c3248c60789c', N'068cb7d7-0c2f-4158-befe-59c61835317e', N'ed25a0ba-8cd3-4b52-829b-87492b7b0b17')
INSERT [dbo].[Vuelo] ([id], [id_ciudad_salida], [id_ciudad_llegada], [id_avion]) VALUES (N'afb4bbc4-dcd5-4e3b-2fcc-08dd9245c5b2', N'1cc473d6-0336-4687-9353-c3248c60789c', N'9347383a-999a-4d12-b07f-1061ada606da', N'b3a8ef4a-43c5-4bfa-9870-b792350c6d91')
INSERT [dbo].[Vuelo] ([id], [id_ciudad_salida], [id_ciudad_llegada], [id_avion]) VALUES (N'3fb82255-80a0-46b0-2fcd-08dd9245c5b2', N'1cc473d6-0336-4687-9353-c3248c60789c', N'677bc6e7-5d6c-4821-861b-e7843f87e87c', N'b3a8ef4a-43c5-4bfa-9870-b792350c6d91')
INSERT [dbo].[Vuelo] ([id], [id_ciudad_salida], [id_ciudad_llegada], [id_avion]) VALUES (N'11b12ca7-df97-4dc6-2fce-08dd9245c5b2', N'677bc6e7-5d6c-4821-861b-e7843f87e87c', N'5e588f67-37e7-4b62-a96c-1e8f66dde971', N'384421ec-5e6c-444d-85be-41dde92156cb')
INSERT [dbo].[Vuelo] ([id], [id_ciudad_salida], [id_ciudad_llegada], [id_avion]) VALUES (N'ca124e75-5e0f-4a90-fef4-08dd93e21c9f', N'1cc473d6-0336-4687-9353-c3248c60789c', N'068cb7d7-0c2f-4158-befe-59c61835317e', N'b3a8ef4a-43c5-4bfa-9870-b792350c6d91')
INSERT [dbo].[Vuelo] ([id], [id_ciudad_salida], [id_ciudad_llegada], [id_avion]) VALUES (N'61aed5ae-f109-457c-8af9-08dd93fdbbf1', N'9347383a-999a-4d12-b07f-1061ada606da', N'5e588f67-37e7-4b62-a96c-1e8f66dde971', N'ed25a0ba-8cd3-4b52-829b-87492b7b0b17')
INSERT [dbo].[Vuelo] ([id], [id_ciudad_salida], [id_ciudad_llegada], [id_avion]) VALUES (N'b8efd48c-3368-4d0c-8afa-08dd93fdbbf1', N'5e588f67-37e7-4b62-a96c-1e8f66dde971', N'1cc473d6-0336-4687-9353-c3248c60789c', N'b3a8ef4a-43c5-4bfa-9870-b792350c6d91')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Avion]    Script Date: 21/05/2025 11:00:51 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Avion] ON [dbo].[Avion]
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Ciudad]    Script Date: 21/05/2025 11:00:51 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Ciudad] ON [dbo].[Ciudad]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Fabricante]    Script Date: 21/05/2025 11:00:51 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fabricante] ON [dbo].[Fabricante]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Avion]  WITH CHECK ADD  CONSTRAINT [FK_Avion_Fabricante] FOREIGN KEY([id_fabricante])
REFERENCES [dbo].[Fabricante] ([Id])
GO
ALTER TABLE [dbo].[Avion] CHECK CONSTRAINT [FK_Avion_Fabricante]
GO
ALTER TABLE [dbo].[Itinerario]  WITH CHECK ADD  CONSTRAINT [FK_Itinerario_Vuelos] FOREIGN KEY([id_vuelo])
REFERENCES [dbo].[Vuelo] ([id])
GO
ALTER TABLE [dbo].[Itinerario] CHECK CONSTRAINT [FK_Itinerario_Vuelos]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Vuelo] FOREIGN KEY([id_avion])
REFERENCES [dbo].[Avion] ([id])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Vuelo]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelos_Ciudades] FOREIGN KEY([id_ciudad_llegada])
REFERENCES [dbo].[Ciudad] ([id])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelos_Ciudades]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelos_Ciudades1] FOREIGN KEY([id_ciudad_salida])
REFERENCES [dbo].[Ciudad] ([id])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelos_Ciudades1]
GO
USE [master]
GO
ALTER DATABASE [aeropuerto] SET  READ_WRITE 
GO
