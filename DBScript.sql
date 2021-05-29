USE [master]
GO
/****** Object:  Database [DistMed]    Script Date: 28/05/2021 09:05:09 p. m. ******/
CREATE DATABASE [DistMed]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DistMed', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DistMed.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DistMed_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DistMed_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DistMed] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DistMed].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DistMed] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DistMed] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DistMed] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DistMed] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DistMed] SET ARITHABORT OFF 
GO
ALTER DATABASE [DistMed] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DistMed] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DistMed] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DistMed] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DistMed] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DistMed] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DistMed] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DistMed] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DistMed] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DistMed] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DistMed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DistMed] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DistMed] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DistMed] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DistMed] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DistMed] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DistMed] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DistMed] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DistMed] SET  MULTI_USER 
GO
ALTER DATABASE [DistMed] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DistMed] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DistMed] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DistMed] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DistMed] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DistMed] SET QUERY_STORE = OFF
GO
USE [DistMed]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 28/05/2021 10:05:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[DescripcionCorta] [varchar](30) NOT NULL,
	[CodigoBarras] [varchar](20) NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bodegas]    Script Date: 28/05/2021 10:05:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodegas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Bodegas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 28/05/2021 10:05:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[idUbicacion] [int] NOT NULL,
	[Piezas] [int] NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[idUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicaciones]    Script Date: 28/05/2021 10:05:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBodega] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[idArticulo] [int] NOT NULL,
	[PiezasMax] [int] NOT NULL,
 CONSTRAINT [PK_Ubicaciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulos] ON 
GO
INSERT [dbo].[Articulos] ([id], [Descripcion], [DescripcionCorta], [CodigoBarras]) VALUES (1, N'Paracetamol 500mg Caja c/10', N'Paracetamol 500', N'121212121212121212')
GO
INSERT [dbo].[Articulos] ([id], [Descripcion], [DescripcionCorta], [CodigoBarras]) VALUES (2, N'Ibuprofeno 500mg Caja c/10', N'Ibuprofeno 500', N'131313131313131313')
GO
INSERT [dbo].[Articulos] ([id], [Descripcion], [DescripcionCorta], [CodigoBarras]) VALUES (3, N'Vitamina C Frasco c/30 pastillas', N'Vitamina C Frasco c/30', N'161616161616161617')
GO
INSERT [dbo].[Articulos] ([id], [Descripcion], [DescripcionCorta], [CodigoBarras]) VALUES (1007, N'Aspirina', N'Aspirina', N'161616161616161617')
GO
SET IDENTITY_INSERT [dbo].[Articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[Bodegas] ON 
GO
INSERT [dbo].[Bodegas] ([id], [Nombre]) VALUES (1, N'Culiacán')
GO
INSERT [dbo].[Bodegas] ([id], [Nombre]) VALUES (2, N'Tijuana')
GO
INSERT [dbo].[Bodegas] ([id], [Nombre]) VALUES (3, N'Juárez')
GO
SET IDENTITY_INSERT [dbo].[Bodegas] OFF
GO
INSERT [dbo].[Inventario] ([idUbicacion], [Piezas]) VALUES (1, 50)
GO
SET IDENTITY_INSERT [dbo].[Ubicaciones] ON 
GO
INSERT [dbo].[Ubicaciones] ([id], [idBodega], [Nombre], [idArticulo], [PiezasMax]) VALUES (1, 1, N'Tarima 1', 1, 200)
GO
INSERT [dbo].[Ubicaciones] ([id], [idBodega], [Nombre], [idArticulo], [PiezasMax]) VALUES (2, 1, N'Tarima 2', 2, 100)
GO
INSERT [dbo].[Ubicaciones] ([id], [idBodega], [Nombre], [idArticulo], [PiezasMax]) VALUES (3, 2, N'Tarima 1', 1, 200)
GO
INSERT [dbo].[Ubicaciones] ([id], [idBodega], [Nombre], [idArticulo], [PiezasMax]) VALUES (4, 2, N'Tarima 2', 1, 200)
GO
SET IDENTITY_INSERT [dbo].[Ubicaciones] OFF
GO
ALTER TABLE [dbo].[Ubicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Ubicaciones_Articulos] FOREIGN KEY([idArticulo])
REFERENCES [dbo].[Articulos] ([id])
GO
ALTER TABLE [dbo].[Ubicaciones] CHECK CONSTRAINT [FK_Ubicaciones_Articulos]
GO
ALTER TABLE [dbo].[Ubicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Ubicaciones_Bodegas] FOREIGN KEY([idBodega])
REFERENCES [dbo].[Bodegas] ([id])
GO
ALTER TABLE [dbo].[Ubicaciones] CHECK CONSTRAINT [FK_Ubicaciones_Bodegas]
GO
/****** Object:  StoredProcedure [dbo].[P_Articulos_CRUD]    Script Date: 28/05/2021 10:05:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Felipe Gonzalez
-- Create date: 2021-05-21
-- Description:	Procedimiento para operaciones crud en los articulos
-- =============================================
CREATE PROCEDURE [dbo].[P_Articulos_CRUD]
(
	@id int,
	@Descripcion varchar(100),
	@DescripcionCorta varchar(30),
	@CodigoBarras varchar(20),
	@Op char(1)
)
AS
BEGIN

	IF @Op = 'R'
	BEGIN
		SET NOCOUNT ON;

		SELECT id, Descripcion, DescripcionCorta, CodigoBarras
		FROM Articulos (NOLOCK)
		WHERE id = @id OR @id = 0

		RETURN
	END

	SET NOCOUNT OFF;

	IF @Op IN ('C','U')
	BEGIN
		IF @id > 0
		BEGIN
			UPDATE Articulos
			SET Descripcion = @Descripcion, DescripcionCorta = @DescripcionCorta, CodigoBarras = @CodigoBarras
			WHERE id = @id
		END
		ELSE
		BEGIN		
			INSERT INTO Articulos(Descripcion, DescripcionCorta, CodigoBarras)
			VALUES(@Descripcion, @DescripcionCorta, @CodigoBarras)
		END
	END

	IF @Op = 'D'
	BEGIN
		DELETE
		FROM Articulos
		WHERE id = @id
	END

END
GO
/****** Object:  StoredProcedure [dbo].[P_ArticulosXUbicacion_Search]    Script Date: 28/05/2021 10:05:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Felipe Gonzalez
-- Create date: 2021-05-21
-- Description:	Procedimiento para hacer una busqueda de los articulos por ubicación
-- =============================================
CREATE PROCEDURE [dbo].[P_ArticulosXUbicacion_Search]
(
	@Articulo varchar(50) = ''
)
AS
BEGIN
	SET NOCOUNT ON;

	SET @Articulo = RTRIM(LTRIM(ISNULL(@Articulo, '')))

	IF @Articulo <> ''
	BEGIN
		SELECT IdUbicacion = U.id, Bodega = B.Nombre, Ubicacion = U.Nombre, Articulo = A.DescripcionCorta, Piezas = I.Piezas
		FROM Inventario AS I (NOLOCK)
		INNER JOIN Ubicaciones AS U (NOLOCK) ON U.id = I.idUbicacion
		INNER JOIN Bodegas AS B (NOLOCK) ON B.id = U.idBodega
		INNER JOIN Articulos AS A(NOLOCK) ON A.id = U.idArticulo
		WHERE A.DescripcionCorta LIKE '%' + @Articulo + '%'
		ORDER BY B.Nombre, U.Nombre, A.DescripcionCorta
	END
	ELSE
	BEGIN
		SELECT IdUbicacion = U.id, Bodega = B.Nombre, Ubicacion = U.Nombre, Articulo = A.DescripcionCorta, Piezas = I.Piezas
		FROM Inventario AS I (NOLOCK)
		INNER JOIN Ubicaciones AS U (NOLOCK) ON U.id = I.idUbicacion
		INNER JOIN Bodegas AS B (NOLOCK) ON B.id = U.idBodega
		INNER JOIN Articulos AS A(NOLOCK) ON A.id = U.idArticulo
		ORDER BY B.Nombre, U.Nombre, A.DescripcionCorta
	END

END
GO
/****** Object:  StoredProcedure [dbo].[P_Bodegas_CRUD]    Script Date: 28/05/2021 10:05:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Felipe Gonzalez
-- Create date: 2021-05-21
-- Description:	Procedimiento para operaciones crud en las bodegas
-- =============================================
CREATE PROCEDURE [dbo].[P_Bodegas_CRUD]
(
	@id int,
	@Nombre varchar(50),
	@Op char(1)
)
AS
BEGIN

	IF @Op = 'R'
	BEGIN
		SET NOCOUNT ON;

		SELECT id, Nombre
		FROM Bodegas (NOLOCK)
		WHERE id = @id OR @id = 0

		RETURN
	END

	SET NOCOUNT OFF;

	IF @Op IN ('C','U')
	BEGIN
		IF @id > 0
		BEGIN
			UPDATE Bodegas
			SET Nombre = @Nombre
			WHERE id = @id
		END
		ELSE
		BEGIN		
			INSERT INTO Bodegas(Nombre)
			VALUES(@Nombre)
		END
	END

	IF @Op = 'D'
	BEGIN
		DELETE
		FROM Bodegas
		WHERE id = @id
	END

END
GO
/****** Object:  StoredProcedure [dbo].[P_Inventario_CRUD]    Script Date: 28/05/2021 10:05:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Felipe Gonzalez
-- Create date: 2021-05-21
-- Description:	Procedimiento para operaciones crud en las ubicaciones
-- =============================================
CREATE PROCEDURE [dbo].[P_Inventario_CRUD]
(
	@idUbicacion int,
	@Piezas int,
	@Op char(1)
)
AS
BEGIN

	IF @Op = 'R'
	BEGIN
		SET NOCOUNT ON;

		SELECT idUbicacion, Piezas
		FROM Inventario (NOLOCK)
		WHERE idUbicacion = @idUbicacion OR @idUbicacion = 0

		RETURN
	END

	SET NOCOUNT OFF;

	IF @Op IN ('C','U')
	BEGIN
		--Se valida que el maximo de piezas no se sobrepase
		IF EXISTS(SELECT id FROM Ubicaciones WHERE id = @idUbicacion AND @Piezas > PiezasMax)
		BEGIN
			RAISERROR ('La cantdad de piezas sobrepasa lo permitido', 16, 1)
			RETURN 1
		END

		IF EXISTS(SELECT idUbicacion FROM Inventario WHERE idUbicacion = @idUbicacion)
		BEGIN
			UPDATE Inventario
			SET Piezas = @Piezas
			WHERE idUbicacion = @idUbicacion
		END
		ELSE
		BEGIN		
			INSERT INTO Inventario(idUbicacion, Piezas)
			VALUES(@idUbicacion, @Piezas)
		END
	END

	IF @Op = 'D'
	BEGIN
		DELETE
		FROM Inventario
		WHERE idUbicacion = @idUbicacion
	END

END
GO
/****** Object:  StoredProcedure [dbo].[P_InventarioDTO]    Script Date: 28/05/2021 10:05:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Felipe Gonzalez
-- Create date: 2021-05-21
-- Description:	Procedimiento para hacer recuperar los datos del inventario en un objeto DTO
-- =============================================
CREATE PROCEDURE [dbo].[P_InventarioDTO]
(
	@id int = 0,
	@SinRegistrar bit = 0
)
AS
BEGIN
	SET NOCOUNT ON;

	IF @SinRegistrar = 0
	BEGIN
		SELECT IdUbicacion = U.id, Bodega = B.Nombre, Ubicacion = U.Nombre, Articulo = A.DescripcionCorta, Piezas = I.Piezas, U.PiezasMax
		FROM Inventario AS I (NOLOCK)
		INNER JOIN Ubicaciones AS U (NOLOCK) ON U.id = I.idUbicacion
		INNER JOIN Bodegas AS B (NOLOCK) ON B.id = U.idBodega
		INNER JOIN Articulos AS A(NOLOCK) ON A.id = U.idArticulo
		WHERE I.idUbicacion = @id OR @id = 0
		ORDER BY B.Nombre, U.Nombre, A.DescripcionCorta
	END
	ELSE
	BEGIN
		SELECT IdUbicacion = U.id, Bodega = B.Nombre, Ubicacion = U.Nombre, Articulo = A.DescripcionCorta, Piezas = 0, U.PiezasMax
		FROM Ubicaciones AS U (NOLOCK)
		LEFT JOIN Inventario AS I (NOLOCK) ON I.idUbicacion = U.id
		INNER JOIN Bodegas AS B (NOLOCK) ON B.id = U.idBodega
		INNER JOIN Articulos AS A(NOLOCK) ON A.id = U.idArticulo
		WHERE U.id = @id AND I.idUbicacion IS NULL
	END
END
GO
/****** Object:  StoredProcedure [dbo].[P_Ubicaciones_CRUD]    Script Date: 28/05/2021 10:05:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Felipe Gonzalez
-- Create date: 2021-05-21
-- Description:	Procedimiento para operaciones crud en las ubicaciones
-- =============================================
CREATE PROCEDURE [dbo].[P_Ubicaciones_CRUD]
(
	@id int,
	@idBodega int,
	@Nombre varchar(50),
	@idArticulo int,
	@PiezasMax int,
	@Op char(1)
)
AS
BEGIN

	IF @Op = 'R'
	BEGIN
		SET NOCOUNT ON;

		SELECT id, idBodega, Nombre, idArticulo, PiezasMax
		FROM Ubicaciones (NOLOCK)
		WHERE id = @id OR @id = 0

		RETURN
	END

	SET NOCOUNT OFF;

	IF @Op IN ('C','U')
	BEGIN
		IF @id > 0
		BEGIN
			UPDATE Ubicaciones
			SET idBodega = @idBodega, Nombre = @Nombre, idArticulo = @idArticulo, PiezasMax = @PiezasMax
			WHERE id = @id
		END
		ELSE
		BEGIN		
			INSERT INTO Ubicaciones(idBodega, Nombre, idArticulo, PiezasMax)
			VALUES(@idBodega, @Nombre, @idArticulo, @PiezasMax)
		END
	END

	IF @Op = 'D'
	BEGIN
		DELETE
		FROM Ubicaciones
		WHERE id = @id
	END

END
GO
/****** Object:  StoredProcedure [dbo].[P_UbicacionesDTO_ArticuloSearch]    Script Date: 28/05/2021 10:05:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Felipe Gonzalez
-- Create date: 2021-05-24
-- Description:	Procedimiento para busqueda de ubicaciones por articulo
-- =============================================
CREATE PROCEDURE [dbo].[P_UbicacionesDTO_ArticuloSearch]
(
	@Articulo varchar(20),
	@SinInventario bit
)
AS
BEGIN

	SET NOCOUNT ON;

	SET @Articulo = RTRIM(LTRIM(ISNULL(@Articulo, '')))

	IF @SinInventario = 1
	BEGIN
		SELECT U.id, Bodega = B.Nombre, U.Nombre, Articulo = A.DescripcionCorta, U.PiezasMax
		FROM Ubicaciones AS U (NOLOCK)
		LEFT JOIN Inventario AS I(NOLOCK) ON I.idUbicacion = U.id
		INNER JOIN Bodegas AS B (NOLOCK) ON B.id = U.idBodega
		INNER JOIN Articulos AS A (NOLOCK) ON A.id = U.idArticulo
		WHERE 
			((A.Descripcion LIKE '%' + @Articulo + '%') OR (A.DescripcionCorta LIKE '%' + @Articulo + '%'))
			AND I.idUbicacion IS NULL
	END
	ELSE
	BEGIN
		SELECT U.id, Bodega = B.Nombre, U.Nombre, Articulo = A.DescripcionCorta, U.PiezasMax
		FROM Ubicaciones AS U (NOLOCK)
		INNER JOIN Bodegas AS B (NOLOCK) ON B.id = U.idBodega
		INNER JOIN Articulos AS A (NOLOCK) ON A.id = U.idArticulo
		WHERE (A.Descripcion LIKE '%' + @Articulo + '%') OR (A.DescripcionCorta LIKE '%' + @Articulo + '%')
	END

	RETURN

END
GO
USE [master]
GO
ALTER DATABASE [DistMed] SET  READ_WRITE 
GO
