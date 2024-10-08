USE [master]
GO
/****** Object:  Database [MiEdficio-database]    Script Date: 1/7/2022 10:03:54 ******/
CREATE DATABASE [MiEdficio-database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MiEdficio-database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MiEdficio-database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MiEdficio-database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MiEdficio-database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MiEdficio-database] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MiEdficio-database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MiEdficio-database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MiEdficio-database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MiEdficio-database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MiEdficio-database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MiEdficio-database] SET ARITHABORT OFF 
GO
ALTER DATABASE [MiEdficio-database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MiEdficio-database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MiEdficio-database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MiEdficio-database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MiEdficio-database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MiEdficio-database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MiEdficio-database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MiEdficio-database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MiEdficio-database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MiEdficio-database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MiEdficio-database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MiEdficio-database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MiEdficio-database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MiEdficio-database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MiEdficio-database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MiEdficio-database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MiEdficio-database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MiEdficio-database] SET RECOVERY FULL 
GO
ALTER DATABASE [MiEdficio-database] SET  MULTI_USER 
GO
ALTER DATABASE [MiEdficio-database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MiEdficio-database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MiEdficio-database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MiEdficio-database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MiEdficio-database] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MiEdficio-database', N'ON'
GO
ALTER DATABASE [MiEdficio-database] SET QUERY_STORE = OFF
GO
USE [MiEdficio-database]
GO
/****** Object:  User [alumno]    Script Date: 1/7/2022 10:03:54 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 1/7/2022 10:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administradores](
	[Id_Administrador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Mail] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Telefono] [int] NULL,
 CONSTRAINT [PK_Administradorre] PRIMARY KEY CLUSTERED 
(
	[Id_Administrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[Id_Departamento] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](200) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Dni] [int] NULL,
	[Telefono] [int] NULL,
	[Departamento] [varchar](5) NOT NULL,
	[Id_Edificio] [int] NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[Id_Departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Edificios]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Edificios](
	[Id_Edificio] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Año_Construccion] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[Clave_Suterh] [int] NOT NULL,
	[Id_Administrador] [int] NOT NULL,
	[Nro_Encargado] [int] NULL,
	[Nro_Emergencia] [int] NULL,
 CONSTRAINT [PK_Edificios] PRIMARY KEY CLUSTERED 
(
	[Id_Edificio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EdificioxEspacio]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EdificioxEspacio](
	[Id_Edificio] [int] NOT NULL,
	[Id_EspacioCC] [int] NOT NULL,
 CONSTRAINT [PK_EdificioxEspacio] PRIMARY KEY CLUSTERED 
(
	[Id_Edificio] ASC,
	[Id_EspacioCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EspaciosComunes]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EspaciosComunes](
	[Id_EspacioCC] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_espacio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EspaciosComunes] PRIMARY KEY CLUSTERED 
(
	[Id_EspacioCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eventos](
	[Id_Evento] [int] IDENTITY(1,1) NOT NULL,
	[Id_TipoEvento] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora_Inicio] [varchar](50) NOT NULL,
	[Hora_final] [varchar](50) NOT NULL,
	[Cant_Invitados] [int] NULL,
	[Invitaredificio] [bit] NOT NULL,
	[Id_Departamento] [int] NULL,
	[Id_Edficio] [int] NULL,
	[Id_Espaciocomun] [int] NULL,
 CONSTRAINT [PK_Eventos] PRIMARY KEY CLUSTERED 
(
	[Id_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expensas]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expensas](
	[Id_Expensa] [int] IDENTITY(1,1) NOT NULL,
	[Id_Departamento] [int] NOT NULL,
	[Monto] [float] NOT NULL,
	[Fecha_Vencimiento] [date] NOT NULL,
	[Pdf_Expensa] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Expensas] PRIMARY KEY CLUSTERED 
(
	[Id_Expensa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inconvenientes]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inconvenientes](
	[Id_Incoveniente] [int] IDENTITY(1,1) NOT NULL,
	[Id_Departamento] [int] NOT NULL,
	[Id_TipoInconveniente] [int] NULL,
	[Descripcion] [varchar](200) NULL,
	[Fecha] [date] NOT NULL,
	[Fecha_Fin] [date] NULL,
 CONSTRAINT [PK_Inconvenientes] PRIMARY KEY CLUSTERED 
(
	[Id_Incoveniente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEventos]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEventos](
	[Id_Tipoevento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoEventos] PRIMARY KEY CLUSTERED 
(
	[Id_Tipoevento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoIncovenientes]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoIncovenientes](
	[Id_Tipoincoveniente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoIncovenientes] PRIMARY KEY CLUSTERED 
(
	[Id_Tipoincoveniente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administradores] ON 

INSERT [dbo].[Administradores] ([Id_Administrador], [Nombre], [Apellido], [Mail], [Contraseña], [Telefono]) VALUES (1, N'Victor', N'Fiszer', N'VFiszer', N'Eitan123', NULL)
INSERT [dbo].[Administradores] ([Id_Administrador], [Nombre], [Apellido], [Mail], [Contraseña], [Telefono]) VALUES (2, N'Julian', N'Schiffer', N'erwerewr', N'ewrewrew', NULL)
INSERT [dbo].[Administradores] ([Id_Administrador], [Nombre], [Apellido], [Mail], [Contraseña], [Telefono]) VALUES (3, N'sss', N'DF', N'SSS', N'', 1)
SET IDENTITY_INSERT [dbo].[Administradores] OFF
SET IDENTITY_INSERT [dbo].[Departamentos] ON 

INSERT [dbo].[Departamentos] ([Id_Departamento], [Codigo], [Nombre], [Apellido], [Dni], [Telefono], [Departamento], [Id_Edificio]) VALUES (1, N'443324', N'Julian', N'SDA', 123231, 142124, N'1A', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Codigo], [Nombre], [Apellido], [Dni], [Telefono], [Departamento], [Id_Edificio]) VALUES (2, N'23112312', N'Ramiro', N'Funes', 214421, 412214, N'1B', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Codigo], [Nombre], [Apellido], [Dni], [Telefono], [Departamento], [Id_Edificio]) VALUES (3, N'324432324', N'Muan', N'ES', 132312, 321123, N'1A', 2)
SET IDENTITY_INSERT [dbo].[Departamentos] OFF
SET IDENTITY_INSERT [dbo].[Edificios] ON 

INSERT [dbo].[Edificios] ([Id_Edificio], [Direccion], [Año_Construccion], [CUIT], [Clave_Suterh], [Id_Administrador], [Nro_Encargado], [Nro_Emergencia]) VALUES (1, N'yatay 204', 2022, 231213, 321, 1, 231231, 213231)
INSERT [dbo].[Edificios] ([Id_Edificio], [Direccion], [Año_Construccion], [CUIT], [Clave_Suterh], [Id_Administrador], [Nro_Encargado], [Nro_Emergencia]) VALUES (2, N'La Plata 190', 2001, 231, 32, 1, 231132, 213132)
INSERT [dbo].[Edificios] ([Id_Edificio], [Direccion], [Año_Construccion], [CUIT], [Clave_Suterh], [Id_Administrador], [Nro_Encargado], [Nro_Emergencia]) VALUES (3, N'Diaz Velez 200', 1990, 321, 123, 2, 213, 123)
SET IDENTITY_INSERT [dbo].[Edificios] OFF
INSERT [dbo].[EdificioxEspacio] ([Id_Edificio], [Id_EspacioCC]) VALUES (1, 1)
INSERT [dbo].[EdificioxEspacio] ([Id_Edificio], [Id_EspacioCC]) VALUES (1, 2)
INSERT [dbo].[EdificioxEspacio] ([Id_Edificio], [Id_EspacioCC]) VALUES (1, 3)
INSERT [dbo].[EdificioxEspacio] ([Id_Edificio], [Id_EspacioCC]) VALUES (2, 1)
INSERT [dbo].[EdificioxEspacio] ([Id_Edificio], [Id_EspacioCC]) VALUES (2, 2)
SET IDENTITY_INSERT [dbo].[EspaciosComunes] ON 

INSERT [dbo].[EspaciosComunes] ([Id_EspacioCC], [Tipo_espacio]) VALUES (1, N'SUM')
INSERT [dbo].[EspaciosComunes] ([Id_EspacioCC], [Tipo_espacio]) VALUES (2, N'Terraza')
INSERT [dbo].[EspaciosComunes] ([Id_EspacioCC], [Tipo_espacio]) VALUES (3, N'Pileta')
SET IDENTITY_INSERT [dbo].[EspaciosComunes] OFF
SET IDENTITY_INSERT [dbo].[Eventos] ON 

INSERT [dbo].[Eventos] ([Id_Evento], [Id_TipoEvento], [Fecha], [Hora_Inicio], [Hora_final], [Cant_Invitados], [Invitaredificio], [Id_Departamento], [Id_Edficio], [Id_Espaciocomun]) VALUES (1, 1, CAST(N'2022-01-01' AS Date), N'10:00', N'11:00', 1, 0, 1, 1, 1)
INSERT [dbo].[Eventos] ([Id_Evento], [Id_TipoEvento], [Fecha], [Hora_Inicio], [Hora_final], [Cant_Invitados], [Invitaredificio], [Id_Departamento], [Id_Edficio], [Id_Espaciocomun]) VALUES (2, 2, CAST(N'2022-02-01' AS Date), N'12:00', N'15:00', 0, 1, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Eventos] OFF
SET IDENTITY_INSERT [dbo].[Expensas] ON 

INSERT [dbo].[Expensas] ([Id_Expensa], [Id_Departamento], [Monto], [Fecha_Vencimiento], [Pdf_Expensa]) VALUES (1, 1, 132231, CAST(N'2022-12-12' AS Date), N'231231')
INSERT [dbo].[Expensas] ([Id_Expensa], [Id_Departamento], [Monto], [Fecha_Vencimiento], [Pdf_Expensa]) VALUES (2, 1, 231213, CAST(N'2022-08-08' AS Date), N'23213')
INSERT [dbo].[Expensas] ([Id_Expensa], [Id_Departamento], [Monto], [Fecha_Vencimiento], [Pdf_Expensa]) VALUES (3, 2, 231132, CAST(N'2000-01-01' AS Date), N'213213')
SET IDENTITY_INSERT [dbo].[Expensas] OFF
SET IDENTITY_INSERT [dbo].[Inconvenientes] ON 

INSERT [dbo].[Inconvenientes] ([Id_Incoveniente], [Id_Departamento], [Id_TipoInconveniente], [Descripcion], [Fecha], [Fecha_Fin]) VALUES (2, 1, 1, NULL, CAST(N'2022-12-12' AS Date), NULL)
INSERT [dbo].[Inconvenientes] ([Id_Incoveniente], [Id_Departamento], [Id_TipoInconveniente], [Descripcion], [Fecha], [Fecha_Fin]) VALUES (3, 1, 2, NULL, CAST(N'2022-12-09' AS Date), NULL)
INSERT [dbo].[Inconvenientes] ([Id_Incoveniente], [Id_Departamento], [Id_TipoInconveniente], [Descripcion], [Fecha], [Fecha_Fin]) VALUES (4, 2, 3, NULL, CAST(N'2021-01-01' AS Date), NULL)
INSERT [dbo].[Inconvenientes] ([Id_Incoveniente], [Id_Departamento], [Id_TipoInconveniente], [Descripcion], [Fecha], [Fecha_Fin]) VALUES (6, 3, 4, NULL, CAST(N'2000-01-01' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Inconvenientes] OFF
SET IDENTITY_INSERT [dbo].[TipoEventos] ON 

INSERT [dbo].[TipoEventos] ([Id_Tipoevento], [Nombre]) VALUES (1, N'Fiesta')
INSERT [dbo].[TipoEventos] ([Id_Tipoevento], [Nombre]) VALUES (2, N'Asamblea')
INSERT [dbo].[TipoEventos] ([Id_Tipoevento], [Nombre]) VALUES (3, N'Reunion')
SET IDENTITY_INSERT [dbo].[TipoEventos] OFF
SET IDENTITY_INSERT [dbo].[TipoIncovenientes] ON 

INSERT [dbo].[TipoIncovenientes] ([Id_Tipoincoveniente], [Nombre]) VALUES (1, N'Incendio')
INSERT [dbo].[TipoIncovenientes] ([Id_Tipoincoveniente], [Nombre]) VALUES (2, N'Olor gas')
INSERT [dbo].[TipoIncovenientes] ([Id_Tipoincoveniente], [Nombre]) VALUES (3, N'Corte de luz')
INSERT [dbo].[TipoIncovenientes] ([Id_Tipoincoveniente], [Nombre]) VALUES (4, N'Ausenca del encargado')
SET IDENTITY_INSERT [dbo].[TipoIncovenientes] OFF
ALTER TABLE [dbo].[Departamentos]  WITH CHECK ADD  CONSTRAINT [FK_Departamentos_Edificios] FOREIGN KEY([Id_Edificio])
REFERENCES [dbo].[Edificios] ([Id_Edificio])
GO
ALTER TABLE [dbo].[Departamentos] CHECK CONSTRAINT [FK_Departamentos_Edificios]
GO
ALTER TABLE [dbo].[Edificios]  WITH CHECK ADD  CONSTRAINT [FK_Edificios_Administradores] FOREIGN KEY([Id_Administrador])
REFERENCES [dbo].[Administradores] ([Id_Administrador])
GO
ALTER TABLE [dbo].[Edificios] CHECK CONSTRAINT [FK_Edificios_Administradores]
GO
ALTER TABLE [dbo].[EdificioxEspacio]  WITH CHECK ADD  CONSTRAINT [FK_EdificioxEspacio_Edificios] FOREIGN KEY([Id_Edificio])
REFERENCES [dbo].[Edificios] ([Id_Edificio])
GO
ALTER TABLE [dbo].[EdificioxEspacio] CHECK CONSTRAINT [FK_EdificioxEspacio_Edificios]
GO
ALTER TABLE [dbo].[EdificioxEspacio]  WITH CHECK ADD  CONSTRAINT [FK_EdificioxEspacio_EspaciosComunes] FOREIGN KEY([Id_EspacioCC])
REFERENCES [dbo].[EspaciosComunes] ([Id_EspacioCC])
GO
ALTER TABLE [dbo].[EdificioxEspacio] CHECK CONSTRAINT [FK_EdificioxEspacio_EspaciosComunes]
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [FK_Eventos_Departamentos] FOREIGN KEY([Id_Departamento])
REFERENCES [dbo].[Departamentos] ([Id_Departamento])
GO
ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [FK_Eventos_Departamentos]
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [FK_Eventos_Edificios] FOREIGN KEY([Id_Edficio])
REFERENCES [dbo].[Edificios] ([Id_Edificio])
GO
ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [FK_Eventos_Edificios]
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [FK_Eventos_TipoEventos] FOREIGN KEY([Id_TipoEvento])
REFERENCES [dbo].[TipoEventos] ([Id_Tipoevento])
GO
ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [FK_Eventos_TipoEventos]
GO
ALTER TABLE [dbo].[Expensas]  WITH CHECK ADD  CONSTRAINT [FK_Expensas_Departamentos] FOREIGN KEY([Id_Departamento])
REFERENCES [dbo].[Departamentos] ([Id_Departamento])
GO
ALTER TABLE [dbo].[Expensas] CHECK CONSTRAINT [FK_Expensas_Departamentos]
GO
ALTER TABLE [dbo].[Inconvenientes]  WITH CHECK ADD  CONSTRAINT [FK_Inconvenientes_Departamentos] FOREIGN KEY([Id_Departamento])
REFERENCES [dbo].[Departamentos] ([Id_Departamento])
GO
ALTER TABLE [dbo].[Inconvenientes] CHECK CONSTRAINT [FK_Inconvenientes_Departamentos]
GO
ALTER TABLE [dbo].[Inconvenientes]  WITH CHECK ADD  CONSTRAINT [FK_Inconvenientes_TipoIncovenientes] FOREIGN KEY([Id_TipoInconveniente])
REFERENCES [dbo].[TipoIncovenientes] ([Id_Tipoincoveniente])
GO
ALTER TABLE [dbo].[Inconvenientes] CHECK CONSTRAINT [FK_Inconvenientes_TipoIncovenientes]
GO
/****** Object:  StoredProcedure [dbo].[sp_AdministradorDelete]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AdministradorDelete]
@id int,
@id_nuevoadministrador int,
@id_edifico int
as
begin
Update Edificios set Id_Administrador=@id_nuevoadministrador WHERE Id_Administrador=@id and Id_Edificio=@id_edifico
end
GO
/****** Object:  StoredProcedure [dbo].[sp_AdministradorSelectAll]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AdministradorSelectAll]

as
begin

Select * from Administradores
end
GO
/****** Object:  StoredProcedure [dbo].[sp_AdministradorSelectById]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AdministradorSelectById]
@id int
as
begin

Select * from Administradores where Id_Administrador=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DepartamentoCreate]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DepartamentoCreate]
@codigo varchar(200),
@nombre varchar(50),
@apellido varchar(50),
@dni int,
@telefono int,
@departamento varchar(5),
@id_edficio int
as
begin
insert into Departamentos (Codigo,nombre,Apellido,Dni,Telefono,Departamento,Id_Edificio)values(@codigo,@nombre,@apellido,@dni,@telefono,@departamento,@id_edficio)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DepartamentoSelectAll]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DepartamentoSelectAll]
as
begin
Select * from Departamentos
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DepartamentoSelectById]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DepartamentoSelectById]
@id int
as
begin
select * from Departamentos where @id=Id_Departamento
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DepartamentoUpdate]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DepartamentoUpdate]
@id int,
@codigo varchar(200),
@nombre varchar(50),
@apellido varchar(50),
@dni int,
@telefono int,
@departamento varchar(5),
@id_edficio int
as
begin
update Departamentos set Codigo=@codigo,Nombre=@nombre,Apellido=@apellido,Dni=@dni,Telefono=@telefono,Departamento=@departamento,Id_Edificio=@id_edficio where Id_Departamento=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EdificioCreate]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EdificioCreate]
@direccion varchar(50),
@año_construccion int,
@cuit int,
@clave_suterh int,
@id_administrador int,
@nro_encargado int,
@nro_emergencia int
as
begin
insert into Edificios (direccion,Año_Construccion,CUIT,Clave_Suterh,Id_Administrador,Nro_Encargado,Nro_Emergencia)values(@direccion,@año_construccion,@cuit,@clave_suterh,@id_administrador,@nro_encargado,@nro_emergencia) 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EdificioDelete]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_EdificioDelete]
@id int,
@idAdministrador int
as
begin
UPDATE Edificios set Id_Administrador=@idAdministrador where Id_Edificio=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EdificioSelectAll]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EdificioSelectAll]
as
begin
Select * from Edificios
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EdificioSelectByAdministrador]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EdificioSelectByAdministrador]
@id_administrador int
as
begin
Select * from Edificios where @id_administrador=Id_Administrador
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EdificioSelectById]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EdificioSelectById]
@id int
as
begin
Select * from Edificios where @id=Id_Edificio
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EdificioUpdate]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EdificioUpdate]
@id int,
@direccion varchar(50),
@año_construccion int,
@cuit int,
@clave_suterh int,
@id_administrador int,
@nro_encargado int,
@nro_emergencia int
as
begin
update Edificios set direccion=@direccion,Año_Construccion = @año_construccion ,CUIT =@cuit ,Clave_Suterh = @clave_suterh,Id_Administrador=@id_administrador,Nro_Encargado=@nro_encargado,Nro_Emergencia=@nro_emergencia where Id_Edificio=@id 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EspacioSelectAll]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EspacioSelectAll]
as
begin
select Tipo_espacio from EspaciosComunes 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EventoCreate]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EventoCreate]
@Id_TipoEvento int,
@Fecha date,
@Hora_Inicio varchar(50),
@Hora_final varchar(50),
@Cant_Invitados int,
@Invitaredificio bit,
@Id_Departamento int,
@Id_Edficio int,
@Id_Espaciocomun int
as
begin
insert into Eventos (Id_TipoEvento,Fecha,Hora_Inicio,Hora_final,Cant_Invitados,Invitaredificio,Id_Departamento,Id_Edficio,Id_Espaciocomun) values (@Id_TipoEvento,@Fecha,@Hora_Inicio,@Hora_final,@Cant_Invitados,@Invitaredificio,@Id_Departamento,@Id_Edficio,@Id_Espaciocomun)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EventoDelete]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EventoDelete]
@id int
as
begin
delete from Eventos where Id_Evento=@id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_EventoSelectAll]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EventoSelectAll]
as
begin
select * from Eventos
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EventoSelectByDepartamento]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EventoSelectByDepartamento]
@id_departamento int
as
begin
select * from Eventos where Id_Departamento=@id_departamento
end


GO
/****** Object:  StoredProcedure [dbo].[sp_EventoSelectByEdificio]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EventoSelectByEdificio]
@id_edficio int
as
begin
select * from Eventos where Id_Edficio=@id_edficio
end

GO
/****** Object:  StoredProcedure [dbo].[sp_EventoSelectById]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EventoSelectById]
@id int
as
begin
select * from Eventos where Id_Evento=@id
end


GO
/****** Object:  StoredProcedure [dbo].[sp_EventoUpdate]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EventoUpdate]
@Id_Evento int,
@Id_TipoEvento int,
@Fecha date,
@Hora_Inicio varchar(50),
@Hora_final varchar(50),
@Cant_Invitados int,
@Invitaredificio bit,
@Id_Departamento int,
@Id_Edficio int,
@Id_Espaciocomun int
as
begin
update Eventos set Id_TipoEvento=@Id_TipoEvento,Fecha=@Fecha,Hora_Inicio=@Hora_Inicio,Hora_final=@Hora_final,Cant_Invitados=@Cant_Invitados,Invitaredificio=@Invitaredificio,Id_Departamento=@Id_Departamento,Id_Edficio=@Id_Edficio,Id_Espaciocomun=@Id_Espaciocomun
WHERE Id_evento=@Id_evento
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ExpensaDelete]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ExpensaDelete]
@id int
as
begin

delete from Expensas where Id_Expensa=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ExpensaSelectAll]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ExpensaSelectAll]
as
begin

select * from Expensas 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ExpensaSelectByDepartamento]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_ExpensaSelectByDepartamento]
@id int
as
begin
select * from Expensas where Id_Departamento=@id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_ExpensaSelectById]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ExpensaSelectById]
@id int
as
begin

select * from Expensas where Id_Expensa=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_IncovenienteDelete]    Script Date: 1/7/2022 10:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_IncovenienteDelete]
@id int
as
begin
delete from Inconvenientes where Id_Incoveniente=@id
end
GO
USE [master]
GO
ALTER DATABASE [MiEdficio-database] SET  READ_WRITE 
GO
