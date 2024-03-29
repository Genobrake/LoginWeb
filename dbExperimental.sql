USE [dbExperimental]
GO
/****** Object:  Table [dbo].[tbUsuario]    Script Date: 14/12/2022 16:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbUsuario](
	[Codigo] [int] NOT NULL,
	[DNI] [char](8) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[ApePaterno] [nvarchar](50) NULL,
	[ApeMaterno] [nvarchar](50) NULL,
	[Usuario] [nchar](10) NULL,
	[Password] [nvarchar](50) NULL,
	[Estado] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearUsuario]    Script Date: 14/12/2022 16:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CrearUsuario]
	@intCodigo		int,
	@chrDNI			char(8),
	@nvcNombre		nvarchar(25),
	@nvcApePaterno	nvarchar(25),
	@nvcApeMaterno	nvarchar(25),
	@nvcUsuario		nchar(10),
	@nvcPassword	nvarchar(25)
AS
BEGIN
	Declare
	
	@intMaxCodigo	int

	Select @intMaxCodigo = IsNull(MAX([Codigo]),0) + 1 From tbUsuario

	INSERT INTO [dbo].[tbUsuario]
           ([Codigo]
           ,[DNI]
           ,[Nombre]
           ,[ApePaterno]
           ,[ApeMaterno]
           ,[Usuario]
           ,[Password]
           ,[Estado])
     VALUES           
		   (@intMaxCodigo,
			@chrDNI,
			@nvcNombre,
			@nvcApePaterno,
			@nvcApeMaterno,
			@nvcUsuario,
			PWDENCRYPT(@nvcPassword),
			1)
END

GO
