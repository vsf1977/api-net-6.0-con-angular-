USE [aeropuerto]
GO
/****** Object:  User [Usuario]    Script Date: 25/01/2023 9:48:17 p. m. ******/
CREATE USER [Usuario] FOR LOGIN [Usuario] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Usuario]
GO
/****** Object:  Table [dbo].[Avion]    Script Date: 25/01/2023 9:48:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avion](
	[id] [uniqueidentifier] NOT NULL,
	[matricula] [varchar](10) NOT NULL,
	[fabricante] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Avion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 25/01/2023 9:48:17 p. m. ******/
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
/****** Object:  Table [dbo].[Itinerario]    Script Date: 25/01/2023 9:48:17 p. m. ******/
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
/****** Object:  Table [dbo].[Vuelo]    Script Date: 25/01/2023 9:48:17 p. m. ******/
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
INSERT [dbo].[Avion] ([id], [matricula], [fabricante]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa6', N'HK-100', N'BOEING')
INSERT [dbo].[Avion] ([id], [matricula], [fabricante]) VALUES (N'384421ec-5e6c-444d-85be-41dde92156cb', N'HK-105', N'AIRBUS')
INSERT [dbo].[Avion] ([id], [matricula], [fabricante]) VALUES (N'fe0b41fc-41aa-4c20-b45b-5a50e375f9d0', N'HK-102', N'ARIBUS')
INSERT [dbo].[Avion] ([id], [matricula], [fabricante]) VALUES (N'ed25a0ba-8cd3-4b52-829b-87492b7b0b17', N'HK-106', N'BOEING')
INSERT [dbo].[Avion] ([id], [matricula], [fabricante]) VALUES (N'45055a93-9fcd-494f-8ef3-958936d8a964', N'HK-104', N'BOEING')
INSERT [dbo].[Avion] ([id], [matricula], [fabricante]) VALUES (N'74250de6-70be-468f-aecd-9624449dff45', N'HK-101', N'BOEING')
INSERT [dbo].[Avion] ([id], [matricula], [fabricante]) VALUES (N'e745dfd9-8a1a-4ae1-9345-b480200b63f2', N'HK-103', N'AIRBUS')
INSERT [dbo].[Avion] ([id], [matricula], [fabricante]) VALUES (N'b3a8ef4a-43c5-4bfa-9870-b792350c6d91', N'HK-107', N'AIRBUS')
GO
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'3fa85f64-5817-4562-b3fc-2c963f66afa6', N'Barranquilla')
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'3fa85f64-5317-4562-b3fc-2c963f66afa6', N'Bogotá D.C.')
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'5e588f67-37e7-4b62-a96c-1e8f66dde971', N'Bucaramanga')
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'9c500c2d-9ee9-4fb0-ad25-1b493ebfa58a', N'Cali')
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'677bc6e7-5d6c-4821-861b-e7843f87e87c', N'Cartagena')
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'b7ed0ad2-5f15-4625-8cc1-ce42543c040f', N'Medellin')
INSERT [dbo].[Ciudad] ([id], [nombre]) VALUES (N'068cb7d7-0c2f-4158-befe-59c61835317e', N'Santa Marta')
GO
INSERT [dbo].[Vuelo] ([id], [id_ciudad_salida], [id_ciudad_llegada], [id_avion]) VALUES (N'dbb1fdd0-03b0-43fb-896d-6395026daa57', N'3fa85f64-5817-4562-b3fc-2c963f66afa6', N'3fa85f64-5317-4562-b3fc-2c963f66afa6', N'3fa85f64-5717-4562-b3fc-2c963f66afa6')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Avion]    Script Date: 25/01/2023 9:48:17 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Avion] ON [dbo].[Avion]
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Ciudad]    Script Date: 25/01/2023 9:48:17 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Ciudad] ON [dbo].[Ciudad]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
