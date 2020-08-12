USE [master]
GO
/****** Object:  Database [cadastro]    Script Date: 11/08/2020 17:38:49 ******/
CREATE DATABASE [cadastro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cadastro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\cadastro.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cadastro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\cadastro_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [cadastro] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cadastro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cadastro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cadastro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cadastro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cadastro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cadastro] SET ARITHABORT OFF 
GO
ALTER DATABASE [cadastro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cadastro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cadastro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cadastro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cadastro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cadastro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cadastro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cadastro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cadastro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cadastro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cadastro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cadastro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cadastro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cadastro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cadastro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cadastro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cadastro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cadastro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cadastro] SET  MULTI_USER 
GO
ALTER DATABASE [cadastro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cadastro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cadastro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cadastro] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [cadastro] SET DELAYED_DURABILITY = DISABLED 
GO
USE [cadastro]
GO
/****** Object:  Table [dbo].[aluno]    Script Date: 11/08/2020 17:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aluno](
	[alunoid] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](200) NULL,
	[rg] [varchar](7) NULL,
	[cpf] [varchar](11) NULL,
	[datanascimento] [datetime] NULL,
	[enderecoid] [int] NULL,
	[matricula] [varchar](20) NULL,
	[idade] [int] NULL,
	[sexo] [varchar](1) NULL,
	[email] [varchar](50) NULL,
	[datacadastro] [datetime] NULL,
	[dataalteracao] [datetime] NULL,
	[telefone] [varchar](15) NULL,
	[usuarioalteracao] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[alunoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cidade]    Script Date: 11/08/2020 17:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cidade](
	[cidadeid] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](200) NULL,
	[estado] [varchar](2) NULL,
	[cep] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[cidadeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[endereco]    Script Date: 11/08/2020 17:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[endereco](
	[enderecoid] [int] IDENTITY(1,1) NOT NULL,
	[logradouro] [varchar](200) NULL,
	[bairro] [varchar](100) NULL,
	[complemento] [varchar](200) NULL,
	[numero] [int] NULL,
	[cep] [varchar](8) NULL,
	[cidadeid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[enderecoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[responsavel]    Script Date: 11/08/2020 17:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[responsavel](
	[responsavelid] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](200) NULL,
	[rg] [varchar](7) NULL,
	[cpf] [varchar](11) NULL,
	[profissao] [varchar](100) NULL,
	[datacadastro] [datetime] NULL,
	[dataalteracao] [datetime] NULL,
	[alunoid] [int] NULL,
	[celular] [varchar](15) NULL,
 CONSTRAINT [Pk_responsavel] PRIMARY KEY CLUSTERED 
(
	[responsavelid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 11/08/2020 17:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[usuarioid] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](200) NULL,
	[cpf] [varchar](11) NULL,
	[sexo] [varchar](1) NULL,
	[datacadastro] [datetime] NULL,
	[email] [varchar](50) NULL,
	[senha] [varchar](20) NULL,
	[telefone] [varchar](15) NULL,
	[cidadeid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[usuarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[aluno]  WITH CHECK ADD  CONSTRAINT [Fk_aluno_endereco_enderecoid] FOREIGN KEY([enderecoid])
REFERENCES [dbo].[endereco] ([enderecoid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[aluno] CHECK CONSTRAINT [Fk_aluno_endereco_enderecoid]
GO
ALTER TABLE [dbo].[endereco]  WITH CHECK ADD  CONSTRAINT [Fk_endereco_cidade_cidadeid] FOREIGN KEY([cidadeid])
REFERENCES [dbo].[cidade] ([cidadeid])
GO
ALTER TABLE [dbo].[endereco] CHECK CONSTRAINT [Fk_endereco_cidade_cidadeid]
GO
ALTER TABLE [dbo].[responsavel]  WITH CHECK ADD  CONSTRAINT [Fk_responsavel_aluno_alunoid] FOREIGN KEY([alunoid])
REFERENCES [dbo].[aluno] ([alunoid])
GO
ALTER TABLE [dbo].[responsavel] CHECK CONSTRAINT [Fk_responsavel_aluno_alunoid]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [Fk_usuario_cidade_cidadeid] FOREIGN KEY([cidadeid])
REFERENCES [dbo].[cidade] ([cidadeid])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [Fk_usuario_cidade_cidadeid]
GO
USE [master]
GO
ALTER DATABASE [cadastro] SET  READ_WRITE 
GO
