USE [master]
GO
/****** Object:  Database [MiEdficio-database]    Script Date: 3/6/2022 11:48:30 ******/
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
/****** Object:  User [alumno]    Script Date: 3/6/2022 11:48:30 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 3/6/2022 11:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administradores](
	[Id_Administrador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Mail] [varchar](50) NOT NULL,
	[Constraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Administradorre] PRIMARY KEY CLUSTERED 
(
	[Id_Administrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 3/6/2022 11:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[Id_Departamento] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](200) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Dni] [int] NOT NULL,
	[Telefono] [int] NOT NULL,
	[Departamento] [varchar](5) NOT NULL,
	[Id_Edificio] [int] NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[Id_Departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Edificios]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  Table [dbo].[EdificioxEspacio]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  Table [dbo].[EspaciosComunes]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  Table [dbo].[Eventos]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  Table [dbo].[Expensas]    Script Date: 3/6/2022 11:48:31 ******/
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
	[Mes] [int] NOT NULL,
	[Año] [int] NOT NULL,
 CONSTRAINT [PK_Expensas] PRIMARY KEY CLUSTERED 
(
	[Id_Expensa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inconvenientes]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  Table [dbo].[TipoEventos]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  Table [dbo].[TipoIncovenientes]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AdministradorCreate]    Script Date: 3/6/2022 11:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AdministradorCreate]
@nombre varchar(50),
@apellido varchar(50),
@mail varchar(50),
@contraseña varchar(50)

as
begin

INSERT INTO Administradores(Nombre,Apellido,Mail,Constraseña)Values(@nombre,@apellido,@mail,@contraseña)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_AdministradorDelete]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AdministradorSelectAll]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AdministradorSelectById]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AdministradorUpdate]    Script Date: 3/6/2022 11:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AdministradorUpdate]
@id int,
@nombre varchar(50),
@apellido varchar(50),
@mail varchar(50),
@contraseña varchar(50)

as
begin

UPDATE Administradores SET Nombre=@nombre,Apellido=@apellido,Mail=@mail,Constraseña=@contraseña where Id_Administrador=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DepartamentoCreate]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DepartamentoSelectAll]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DepartamentoSelectById]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DepartamentoUpdate]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EdificioCreate]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EdificioDelete]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EdificioSelectAll]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EdificioSelectByAdministrador]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EdificioSelectById]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EdificioUpdate]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EspacioSelectAll]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EventoCreate]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EventoDelete]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EventoSelectAll]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EventoSelectByDepartamento]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EventoSelectByEdificio]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EventoSelectById]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EventoUpdate]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ExpensaCreate]    Script Date: 3/6/2022 11:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ExpensaCreate]
@id_departamento int,
@monto int,
@fecha_vencimiento date,
@pdf_expensas varchar(50),
@mes int,
@año int
as
begin

insert into Expensas(Id_Departamento,Monto,Fecha_Vencimiento,Pdf_Expensa,Mes,Año)Values(@id_departamento,@monto,@fecha_vencimiento,@pdf_expensas,@mes,@año)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ExpensaDelete]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ExpensaSelectAll]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ExpensaSelectByDepartamento]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ExpensaSelectById]    Script Date: 3/6/2022 11:48:31 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ExpensaUpdate]    Script Date: 3/6/2022 11:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ExpensaUpdate]
@id int,
@id_departamento int,
@monto int,
@fecha_vencimiento date,
@pdf_expensas varchar(50),
@mes int,
@año int
as
begin

update Expensas set Id_Departamento=@id_departamento, Monto = @monto ,Fecha_Vencimiento =@fecha_vencimiento ,Pdf_Expensa = @pdf_expensas ,Mes = @mes ,Año = @año where Id_Expensa=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_IncovenienteDelete]    Script Date: 3/6/2022 11:48:31 ******/
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
