USE [master]
GO
/****** Object:  Database [InternetShopMSasha]    Script Date: 31.01.2018 16:10:12 ******/
CREATE DATABASE [InternetShopMSasha]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InternetShopMSasha', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\InternetShopMSasha.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InternetShopMSasha_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\InternetShopMSasha_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InternetShopMSasha] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InternetShopMSasha].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InternetShopMSasha] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET ARITHABORT OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InternetShopMSasha] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InternetShopMSasha] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InternetShopMSasha] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InternetShopMSasha] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET RECOVERY FULL 
GO
ALTER DATABASE [InternetShopMSasha] SET  MULTI_USER 
GO
ALTER DATABASE [InternetShopMSasha] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InternetShopMSasha] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InternetShopMSasha] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InternetShopMSasha] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [InternetShopMSasha] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'InternetShopMSasha', N'ON'
GO
USE [InternetShopMSasha]
GO
/****** Object:  UserDefinedTableType [dbo].[BasketProdRecordType]    Script Date: 31.01.2018 16:10:14 ******/
CREATE TYPE [dbo].[BasketProdRecordType] AS TABLE(
	[BasketProdId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[DateCreate] [datetime] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UserProfilesType]    Script Date: 31.01.2018 16:10:15 ******/
CREATE TYPE [dbo].[UserProfilesType] AS TABLE(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](128) NULL,
	[Telephone] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[BasketProducts]    Script Date: 31.01.2018 16:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketProducts](
	[UserProfilesId] [int] NOT NULL,
	[DateCreate] [datetime] NOT NULL,
 CONSTRAINT [PK_BasketProducts] PRIMARY KEY CLUSTERED 
(
	[UserProfilesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BasketProductsRecords]    Script Date: 31.01.2018 16:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketProductsRecords](
	[BasketProductId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[DateCreate] [datetime] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_BasketProductsRecords] PRIMARY KEY CLUSTERED 
(
	[BasketProductId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 31.01.2018 16:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](128) NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 31.01.2018 16:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrentQuantity] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[DateCreate] [datetime] NOT NULL,
	[ProductCaregoryId] [int] NOT NULL,
	[Image] [nvarchar](128) NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserOrderRecords]    Script Date: 31.01.2018 16:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOrderRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreate] [datetime] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UserOrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_UserOrderRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserOrders]    Script Date: 31.01.2018 16:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserProfileId] [int] NULL,
	[UserOrderStatusId] [int] NULL,
	[DateCreate] [datetime] NULL,
 CONSTRAINT [PK_UserOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserOrderStatuses]    Script Date: 31.01.2018 16:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOrderStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserOrderStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfiles]    Script Date: 31.01.2018 16:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](128) NULL,
	[Telephone] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserProfiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[BasketProducts]  WITH CHECK ADD  CONSTRAINT [FK_BasketProducts_UserProfiles] FOREIGN KEY([UserProfilesId])
REFERENCES [dbo].[UserProfiles] ([Id])
GO
ALTER TABLE [dbo].[BasketProducts] CHECK CONSTRAINT [FK_BasketProducts_UserProfiles]
GO
ALTER TABLE [dbo].[BasketProductsRecords]  WITH CHECK ADD  CONSTRAINT [FK_BasketProductsRecords_BasketProducts] FOREIGN KEY([BasketProductId])
REFERENCES [dbo].[BasketProducts] ([UserProfilesId])
GO
ALTER TABLE [dbo].[BasketProductsRecords] CHECK CONSTRAINT [FK_BasketProductsRecords_BasketProducts]
GO
ALTER TABLE [dbo].[BasketProductsRecords]  WITH CHECK ADD  CONSTRAINT [FK_BasketProductsRecords_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[BasketProductsRecords] CHECK CONSTRAINT [FK_BasketProductsRecords_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([ProductCaregoryId])
REFERENCES [dbo].[ProductCategories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[UserOrderRecords]  WITH CHECK ADD  CONSTRAINT [FK_UserOrderRecords_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[UserOrderRecords] CHECK CONSTRAINT [FK_UserOrderRecords_Products]
GO
ALTER TABLE [dbo].[UserOrderRecords]  WITH CHECK ADD  CONSTRAINT [FK_UserOrderRecords_UserOrders] FOREIGN KEY([UserOrderId])
REFERENCES [dbo].[UserOrders] ([Id])
GO
ALTER TABLE [dbo].[UserOrderRecords] CHECK CONSTRAINT [FK_UserOrderRecords_UserOrders]
GO
ALTER TABLE [dbo].[UserOrders]  WITH CHECK ADD  CONSTRAINT [FK_UserOrders_UserOrderStatuses] FOREIGN KEY([UserOrderStatusId])
REFERENCES [dbo].[UserOrderStatuses] ([Id])
GO
ALTER TABLE [dbo].[UserOrders] CHECK CONSTRAINT [FK_UserOrders_UserOrderStatuses]
GO
/****** Object:  StoredProcedure [dbo].[InsertUserOrder]    Script Date: 31.01.2018 16:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsertUserOrder]
(@userId int)
as
begin
   declare @baskProdRec  BasketProdRecordType; 

   insert into @baskProdRec(BasketProdId, ProductId,Quantity,DateCreate)
   select BasketProductId, ProductId,Quantity,DateCreate
   from BasketProductsRecords
   where BasketProductId = @userId

   if(select count(*) from @baskProdRec)<1
   begin
     return
   end

   begin transaction 

   begin try
	   insert UserOrders(UserProfileId,UserOrderStatusId,DateCreate)
	   values (@userId,1,GETDATE())

	   declare @userOrdId int = IDENT_CURRENT('UserOrders')

	   insert into UserOrderRecords
	   (
	     DateCreate,
		 ProductId,
		 UserOrderId,
		 Quantity
	   )
	   select GETDATE(),bpr.ProductId,@userOrdId,bpr.Quantity 
	   from @baskProdRec bpr

	   delete 
	   from BasketProductsRecords
	   where BasketProductId = @userId

	   delete 
	   from BasketProducts
	   where UserProfilesId = @userId
	    
	   commit transaction 
    end try
	begin catch
	   rollback transaction
	   print 'Unknown Error'
	end catch

end


GO
USE [master]
GO
ALTER DATABASE [InternetShopMSasha] SET  READ_WRITE 
GO
