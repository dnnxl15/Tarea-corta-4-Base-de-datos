/*
Description: Create Material Table
Creation date: 24/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 24/05/2018
*/
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Material](
	[idMaterial] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[idMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*
Description: Create Product Table
Creation date: 24/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 24/05/2018
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Product](
	[idProduct] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*
Description: Create Provider Table
Creation date: 24/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 24/05/2018
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Provider](
	[idProvider] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[country] [varchar](50) NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[idProvider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*
Description: Create Restaurant Table
Creation date: 24/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 24/05/2018
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Restaurant](
	[idRestaurant] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[location] [varchar](50) NULL,
	[code] [varchar](50) NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[idRestaurant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*
Description: Create MaterialByProvider Table
Creation date: 24/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 24/05/2018
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MaterialByProvider](
	[idProvider] [int] NULL,
	[idMaterial] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MaterialByProvider]  WITH CHECK ADD  CONSTRAINT [FK_MaterialByProvider_Material] FOREIGN KEY([idMaterial])
REFERENCES [dbo].[Material] ([idMaterial])
GO

ALTER TABLE [dbo].[MaterialByProvider] CHECK CONSTRAINT [FK_MaterialByProvider_Material]
GO

ALTER TABLE [dbo].[MaterialByProvider]  WITH CHECK ADD  CONSTRAINT [FK_MaterialByProvider_Provider] FOREIGN KEY([idProvider])
REFERENCES [dbo].[Provider] ([idProvider])
GO

ALTER TABLE [dbo].[MaterialByProvider] CHECK CONSTRAINT [FK_MaterialByProvider_Provider]
GO

/*
Description: Create ProductByRestaurant Table
Creation date: 24/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 24/05/2018
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductByRestaurant](
	[idProduct] [int] NULL,
	[idRestaurant] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductByRestaurant]  WITH CHECK ADD  CONSTRAINT [FK_ProductByRestaurant_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
GO

ALTER TABLE [dbo].[ProductByRestaurant] CHECK CONSTRAINT [FK_ProductByRestaurant_Product]
GO

ALTER TABLE [dbo].[ProductByRestaurant]  WITH CHECK ADD  CONSTRAINT [FK_ProductByRestaurant_Restaurant] FOREIGN KEY([idRestaurant])
REFERENCES [dbo].[Restaurant] ([idRestaurant])
GO

ALTER TABLE [dbo].[ProductByRestaurant] CHECK CONSTRAINT [FK_ProductByRestaurant_Restaurant]
GO

/*
Description: Create ProductNeedMaterial Table
Creation date: 24/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 24/05/2018
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductNeedMaterial](
	[idProduct] [int] NULL,
	[idMaterial] [int] NULL,
	[measure] [varchar](50) NULL,
	[mountUse] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductNeedMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductNeedMaterial_Material] FOREIGN KEY([idMaterial])
REFERENCES [dbo].[Material] ([idMaterial])
GO

ALTER TABLE [dbo].[ProductNeedMaterial] CHECK CONSTRAINT [FK_ProductNeedMaterial_Material]
GO

ALTER TABLE [dbo].[ProductNeedMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductNeedMaterial_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
GO

ALTER TABLE [dbo].[ProductNeedMaterial] CHECK CONSTRAINT [FK_ProductNeedMaterial_Product]
GO

/*
Description: Create ProductUsedMaterial Table
Creation date: 24/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 24/05/2018
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductUsedMaterial](
	[idProductNeedMaterial] [int] IDENTITY(1,1) NOT NULL,
	[idProduct] [int] NULL,
	[idMaterial] [int] NULL,
	[dateUsed] [datetime] NULL
) ON [PRIMARY]
GO

/*
Description: Create ProviderByRest Table
Creation date: 24/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 24/05/2018
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProviderByRest](
	[idProvider] [int] NULL,
	[idRestaurant] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProviderByRest]  WITH CHECK ADD  CONSTRAINT [FK_ProviderByRest_Provider] FOREIGN KEY([idProvider])
REFERENCES [dbo].[Provider] ([idProvider])
GO

ALTER TABLE [dbo].[ProviderByRest] CHECK CONSTRAINT [FK_ProviderByRest_Provider]
GO

ALTER TABLE [dbo].[ProviderByRest]  WITH CHECK ADD  CONSTRAINT [FK_ProviderByRest_Restaurant] FOREIGN KEY([idRestaurant])
REFERENCES [dbo].[Restaurant] ([idRestaurant])
GO

ALTER TABLE [dbo].[ProviderByRest] CHECK CONSTRAINT [FK_ProviderByRest_Restaurant]
GO

/*
Description: Create RestBuyMaterial Table
Creation date: 24/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 24/05/2018
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RestBuyMaterial](
	[idRestaurant] [int] NULL,
	[idMaterial] [int] NULL,
	[measure] [varchar](50) NULL,
	[mount] [int] NULL,
	[price] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RestBuyMaterial]  WITH CHECK ADD  CONSTRAINT [FK_RestBuyMaterial_Material] FOREIGN KEY([idMaterial])
REFERENCES [dbo].[Material] ([idMaterial])
GO

ALTER TABLE [dbo].[RestBuyMaterial] CHECK CONSTRAINT [FK_RestBuyMaterial_Material]
GO

ALTER TABLE [dbo].[RestBuyMaterial]  WITH CHECK ADD  CONSTRAINT [FK_RestBuyMaterial_Restaurant] FOREIGN KEY([idRestaurant])
REFERENCES [dbo].[Restaurant] ([idRestaurant])
GO

ALTER TABLE [dbo].[RestBuyMaterial] CHECK CONSTRAINT [FK_RestBuyMaterial_Restaurant]
GO

/*
Description: Create RestStorageMaterial Table
Creation date: 24/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 24/05/2018
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RestStorageMaterial](
	[idRestaurant] [int] NULL,
	[idMaterial] [int] NULL,
	[mount] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RestStorageMaterial]  WITH CHECK ADD  CONSTRAINT [FK_RestStorageMaterial_Material] FOREIGN KEY([idMaterial])
REFERENCES [dbo].[Material] ([idMaterial])
GO

ALTER TABLE [dbo].[RestStorageMaterial] CHECK CONSTRAINT [FK_RestStorageMaterial_Material]
GO

ALTER TABLE [dbo].[RestStorageMaterial]  WITH CHECK ADD  CONSTRAINT [FK_RestStorageMaterial_Restaurant] FOREIGN KEY([idRestaurant])
REFERENCES [dbo].[Restaurant] ([idRestaurant])
GO

ALTER TABLE [dbo].[RestStorageMaterial] CHECK CONSTRAINT [FK_RestStorageMaterial_Restaurant]
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- PROCEDURES
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/****** Object:  StoredProcedure [dbo].[deleteMaterial]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to delete a material
-- Author: Esteban Coto Alfaro
-- Creation Date: 21/05/2018
-- Last Modification: 21/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[deleteMaterial]
(
	@pName VARCHAR(50)
)
AS
BEGIN
	DELETE FROM [dbo].[Material]
	WHERE [dbo].[Material].name = @pName
END
GO

/****** Object:  StoredProcedure [dbo].[deleteMaterialByProvider]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to delete a MaterialByProvider
-- Author: Esteban Coto Alfaro
-- Creation Date: 24/05/2018
-- Last Modification: 24/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[deleteMaterialByProvider]
(
	@pMaterialName VARCHAR(50),
	@pProviderName VARCHAR(50),
	@pCountry VARCHAR(50)
)
AS
BEGIN
	DECLARE @pMaterialID int
	DECLARE @pProviderID int
	SELECT @pProviderID = [dbo].[getProviderID](@pProviderName, @pCountry),
	@pMaterialID = [dbo].[getMaterialID](@pMaterialName)
	DELETE FROM [dbo].[MaterialByProvider]
	WHERE @pProviderID = [dbo].[MaterialByProvider].[idProvider] AND
	@pMaterialID = [dbo].[MaterialByProvider].[idMaterial]
END
GO

/****** Object:  StoredProcedure [dbo].[deleteProduct]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to delete a product
-- Author: Esteban Coto Alfaro
-- Creation Date: 22/05/2018
-- Last Modification: 22/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[deleteProduct]
(
	@pName VARCHAR(50)
)
AS
BEGIN
	DELETE FROM Product
	WHERE Product.name = @pName
END
GO

/****** Object:  StoredProcedure [dbo].[deleteProductByRest]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to delete a ProductByRest
-- Author: Esteban Coto Alfaro
-- Creation Date: 25/05/2018
-- Last Modification: 25/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[deleteProductByRest]
(
	@pCode VARCHAR(50),
	@pName VARCHAR(50)
)
AS
BEGIN
	DECLARE @pRestID int
	DECLARE @pProductID int

	SELECT @pRestID = [dbo].[getRestaurantID](@pCode),
	@pProductID = [dbo].[getProductID](@pName)
	DELETE FROM [dbo].[ProductByRestaurant]
	WHERE @pProductID = [dbo].[ProductByRestaurant].[idProduct] AND
	@pRestID = [dbo].[ProductByRestaurant].[idRestaurant]
END
GO

/****** Object:  StoredProcedure [dbo].[deleteProductNeedMaterial]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to delete a RestBuyMaterial
-- Author: Esteban Coto Alfaro
-- Creation Date: 25/05/2018
-- Last Modification: 25/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[deleteProductNeedMaterial]
(
	@pProductName VARCHAR(50),
	@pMaterialName VARCHAR(50)
)
AS
BEGIN
	DECLARE @pMaterialID int
	DECLARE @pProductID int

	SELECT @pMaterialID = [dbo].[getMaterialId](@pMaterialName),
	@pProductID = [dbo].[getProductID](@pProductName)
	DELETE FROM [dbo].[ProductNeedMaterial]
	WHERE @pProductID = [dbo].[ProductNeedMaterial].[idProduct] AND
	@pMaterialID = [dbo].[ProductNeedMaterial].[idMaterial]
END
GO

/****** Object:  StoredProcedure [dbo].[deleteProvider]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to delete a provider
-- Author: Esteban Coto Alfaro
-- Creation Date: 22/05/2018
-- Last Modification: 22/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[deleteProvider]
(
	@pName VARCHAR(50),
	@pCountry VARCHAR(50)
)
AS
BEGIN
	DELETE FROM Provider
	WHERE Provider.name = @pName AND Provider.country = @pCountry
END
GO

/****** Object:  StoredProcedure [dbo].[deleteProvidorByRest]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to delete a ProviderByRest
-- Author: Esteban Coto Alfaro
-- Creation Date: 24/05/2018
-- Last Modification: 24/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[deleteProvidorByRest]
(
	@pName VARCHAR(50),
	@pCountry VARCHAR(50),
	@pCode VARCHAR(50)
)
AS
BEGIN
	DECLARE @pProviderID int
	DECLARE @pRestID int
	SELECT @pProviderID = [dbo].[getProviderID](@pName, @pCountry),
	@pRestID = [dbo].[getRestaurantID](@pCode)
	DELETE FROM [dbo].[ProviderByRest]
	WHERE @pProviderID = [dbo].[ProviderByRest].[idProvider] AND
	@pRestID = [dbo].[ProviderByRest].[idRestaurant]
END
GO

/****** Object:  StoredProcedure [dbo].[getAllMaterial]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to get all the materials
-- Author: Esteban Coto Alfaro
-- Creation Date: 21/05/2018
-- Last Modification: 21/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[getAllMaterial]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Material
END
GO

/****** Object:  StoredProcedure [dbo].[getAllProducts]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to get all the products
-- Author: Esteban Coto Alfaro
-- Creation Date: 21/05/2018
-- Last Modification: 21/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[getAllProducts]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Product
END
GO

/****** Object:  StoredProcedure [dbo].[getAllProvider]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to get all the providers
-- Author: Esteban Coto Alfaro
-- Creation Date: 22/05/2018
-- Last Modification: 22/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[getAllProvider]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Provider
END
GO

/****** Object:  StoredProcedure [dbo].[getMaterial]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to get a material
-- Author: Esteban Coto Alfaro
-- Creation Date: 21/05/2018
-- Last Modification: 21/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[getMaterial]
(
	@pName VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Material
	WHERE Material.name = @pName
END
GO

/****** Object:  StoredProcedure [dbo].[getProduct]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to get a product
-- Author: Esteban Coto Alfaro
-- Creation Date: 21/05/2018
-- Last Modification: 21/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[getProduct]
(
	@pName VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Product
	WHERE Product.name = @pName
END
GO

/****** Object:  StoredProcedure [dbo].[getProvider]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to get a provider
-- Author: Esteban Coto Alfaro
-- Creation Date: 22/05/2018
-- Last Modification: 22/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[getProvider]
(
	@pName VARCHAR(50),
	@pCountry VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Provider
	WHERE Provider.name = @pName AND Provider.country = @pCountry
END
GO

/****** Object:  StoredProcedure [dbo].[getRestAllBuyMaterial]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to get all RestBuyMaterial
-- Author: Esteban Coto Alfaro
-- Creation Date: 25/05/2018
-- Last Modification: 25/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[getRestAllBuyMaterial]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM [dbo].[RestBuyMaterial]
END
GO

/****** Object:  StoredProcedure [dbo].[getRestBuyMaterial]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to get a RestBuyMaterial
-- Author: Esteban Coto Alfaro
-- Creation Date: 25/05/2018
-- Last Modification: 25/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[getRestBuyMaterial]
(
	@pCode VARCHAR(50)
)
AS
BEGIN
	DECLARE @pRestID int
	SELECT @pRestID = [dbo].[getRestaurantID](@pCode)
	SELECT * FROM [dbo].[RestBuyMaterial] 
	WHERE [dbo].[RestBuyMaterial].idRestaurant = @pRestID
END
GO

/****** Object:  StoredProcedure [dbo].[insertMaterial]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to insert a new material
-- Author: Esteban Coto Alfaro
-- Creation Date: 22/05/2018
-- Last Modification: 24/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[insertMaterial]
(
	@pName VARCHAR(50)
)
AS
BEGIN
	INSERT INTO [dbo].[Material] ([name])
	VALUES(@pName)
END
GO

/****** Object:  StoredProcedure [dbo].[insertMaterialByProvider]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to insert a MaterialByProvider
-- Author: Esteban Coto Alfaro
-- Creation Date: 24/05/2018
-- Last Modification: 24/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[insertMaterialByProvider]
(
	@pMaterialName VARCHAR(50),
	@pProviderName VARCHAR(50),
	@pCountry VARCHAR(50)
)
AS
BEGIN
	DECLARE @pMaterialID int
	DECLARE @pProviderID int
	SELECT @pMaterialID = [dbo].[getMaterialId](@pMaterialName),
	@pProviderID = [dbo].[getProviderID](@pProviderName, @pCountry)
	INSERT INTO [dbo].[MaterialByProvider]([idProvider], [idMaterial])
	VALUES(@pProviderID, @pMaterialID)
END
GO

/****** Object:  StoredProcedure [dbo].[insertProduct]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to insert a new product
-- Author: Esteban Coto Alfaro
-- Creation Date: 21/05/2018
-- Last Modification: 24/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[insertProduct]
(
	@pName VARCHAR(50),
	@pPrice int
)
AS
BEGIN
	INSERT INTO [Product] ([name], [price])
	VALUES(@pName, @pPrice)
END
GO

/****** Object:  StoredProcedure [dbo].[insertProductByRestaurant]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to insert a ProductByRestaurant
-- Author: Esteban Coto Alfaro
-- Creation Date: 25/05/2018
-- Last Modification: 25/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[insertProductByRestaurant]
(
	@pProductName VARCHAR(50),
	@pCode VARCHAR(50)
)
AS
BEGIN
	DECLARE @pRestID int
	DECLARE @pProductID int
	SELECT @pRestID = [dbo].[getRestaurantID](@pCode),
	@pProductID = [dbo].[getProductID](@pProductName)
	INSERT INTO [dbo].[ProductByRestaurant]([idProduct], [idRestaurant])
	VALUES(@pProductID, @pRestID)
END
GO

/****** Object:  StoredProcedure [dbo].[insertProductNeedMaterial]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to insert a ProductNeedMaterial
-- Author: Esteban Coto Alfaro
-- Creation Date: 25/05/2018
-- Last Modification: 25/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[insertProductNeedMaterial]
(
	@pProductName VARCHAR(50),
	@pMaterialName VARCHAR(50),
	@pMeasure VARCHAR(50),
	@pMount int
)
AS
BEGIN
	DECLARE @pMaterialID int
	DECLARE @pProductID int

	SELECT @pMaterialID = [dbo].[getMaterialId](@pMaterialName),
	@pProductID = [dbo].[getProductID](@pProductName)
	INSERT INTO [dbo].[ProductNeedMaterial]([idProduct], [idMaterial], [measure], [mountUse])
	VALUES(@pProductID, @pMaterialID, @pMeasure, @pMount)
END
GO

/****** Object:  StoredProcedure [dbo].[insertProvider]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to insert a new provider
-- Author: Esteban Coto Alfaro
-- Creation Date: 22/05/2018
-- Last Modification: 22/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[insertProvider]
(
	@pName VARCHAR(50),
	@pCountry VARCHAR(50)
)
AS
BEGIN
	INSERT INTO [Provider] ([name], [country])
	VALUES(@pName, @pCountry)
END
GO

/****** Object:  StoredProcedure [dbo].[insertProviderByRest]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to insert a ProviderByRest
-- Author: Esteban Coto Alfaro
-- Creation Date: 24/05/2018
-- Last Modification: 24/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[insertProviderByRest]
(
	@pName VARCHAR(50),
	@pCountry VARCHAR(50),
	@pCode VARCHAR(50)
)
AS
BEGIN
	DECLARE @pProviderID int
	DECLARE @pRestID int
	SELECT @pProviderID = dbo.getProviderID(@pName, @pCountry),
	@pRestID = dbo.getRestaurantID(@pCode)
	INSERT INTO [dbo].[ProviderByRest] ([idProvider], [idRestaurant])
	VALUES(@pProviderID, @pRestID)
END
GO

/****** Object:  StoredProcedure [dbo].[insertRestaurant]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to insert a new Restaruant
-- Author: Esteban Coto Alfaro
-- Creation Date: 24/05/2018
-- Last Modification: 24/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[insertRestaurant] 
(
	@pName VARCHAR(50),
	@pLocation VARCHAR(50),
	@pCode VARCHAR(50)
)
AS
BEGIN
	INSERT INTO [Restaurant] ([name], [location], [code])
	VALUES (@pName, @pLocation, @pCode)
END
GO

/****** Object:  StoredProcedure [dbo].[insertRestBuyMaterial]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to insert a RestBuyMaterial
-- Author: Esteban Coto Alfaro
-- Creation Date: 25/05/2018
-- Last Modification: 25/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[insertRestBuyMaterial]
(
	@pRestCode VARCHAR(50),
	@pMaterialName VARCHAR(50),
	@pMeasure VARCHAR(50),
	@pMount int,
	@pPrice int
)
AS
BEGIN
	DECLARE @pMaterialID int
	DECLARE @pRestID int
	SELECT @pMaterialID = [dbo].[getMaterialId](@pMaterialName),
	@pRestID = [dbo].[getRestaurantID](@pRestCode)
	INSERT INTO [dbo].[RestBuyMaterial]([idRestaurant], [idMaterial], [measure], [mount], [price])
	VALUES(@pRestID, @pMaterialID, @pMeasure, @pMount, @pPrice)
END
GO

/****** Object:  StoredProcedure [dbo].[updateMaterial]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to update a material
-- Author: Esteban Coto Alfaro
-- Creation Date: 22/05/2018
-- Last Modification: 24/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[updateMaterial]
(
	@pOldName VARCHAR(50),
	@pNewName VARCHAR(50)
)
AS
BEGIN
	UPDATE [dbo].[Material]
	SET [dbo].[Material].name = @pNewName
	WHERE [dbo].[Material].name = @pOldName
END
GO

/****** Object:  StoredProcedure [dbo].[updateProduct]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to update a product
-- Author: Esteban Coto Alfaro
-- Creation Date: 21/05/2018
-- Last Modification: 21/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[updateProduct]
(
	@pOldName VARCHAR(50),
	@pNewName VARCHAR(100),
	@pPrice int
)
AS
BEGIN
	UPDATE Product 
	SET Product.name = @pNewName,
	Product.price = @pPrice
	WHERE Product.name = @pOldName
END
GO

/****** Object:  StoredProcedure [dbo].[updateProductNeedMaterial]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to update a RestBuyMaterial
-- Author: Esteban Coto Alfaro
-- Creation Date: 25/05/2018
-- Last Modification: 25/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[updateProductNeedMaterial]
(
	@pMaterialName VARCHAR(50),
	@pProductName VARCHAR(50),
	@pMeasure VARCHAR(50),
	@pMount int
)
AS
BEGIN
	DECLARE @pProductID int
	DECLARE @pMaterialID int
	
	SELECT @pProductID = [dbo].[getProductID](@pProductName),
	@pMaterialID = [dbo].[getMaterialId](@pMaterialName)

	UPDATE [dbo].[ProductNeedMaterial]
	SET [dbo].[ProductNeedMaterial].measure = @pMeasure,
	[dbo].[ProductNeedMaterial].mountUse = @pMount

	WHERE [dbo].[ProductNeedMaterial].idMaterial = @pMaterialID AND
	[dbo].[ProductNeedMaterial].idProduct = @pProductID
END
GO

/****** Object:  StoredProcedure [dbo].[updateProvider]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to update a provider
-- Author: Esteban Coto Alfaro
-- Creation Date: 22/05/2018
-- Last Modification: 22/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[updateProvider]
(
	@pOldName VARCHAR(50),
	@pNewName VARCHAR(50),
	@pCountry VARCHAR(50)
)
AS
BEGIN
	UPDATE Provider 
	SET Provider.name = @pNewName,
	Provider.country = @pCountry
	WHERE Provider.name = @pOldName
END
GO

/****** Object:  StoredProcedure [dbo].[updateRestaurant]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Procedure to update a Restaurant
-- Author: Esteban Coto Alfaro
-- Creation Date: 24/05/2018
-- Last Modification: 24/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[updateRestaurant]
(
	@pOldCode VARCHAR(50),
	@pName VARCHAR(50),
	@pLocation VARCHAR(50),
	@pNewCode VARCHAR(50)
)
AS
BEGIN
	UPDATE Restaurant
	SET Restaurant.name = @pName,
	Restaurant.location = @pLocation,
	Restaurant.code = @pNewCode
	WHERE Restaurant.code = @pOldCode
END
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- FUNCTIONS
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/****** Object:  UserDefinedFunction [dbo].[getMaterialId]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Function to return the idMaterial
-- Author: Esteban Coto Alfaro
-- Creation Date: 24/05/2018
-- Last Modification: 24/05/2018
-- =============================================
CREATE FUNCTION [dbo].[getMaterialId]
(
	@pName VARCHAR(50)
)
RETURNS int
AS
BEGIN
	DECLARE @pIdMaterial int

	SELECT @pIdMaterial = [dbo].[Material].idMaterial
	FROM [dbo].[Material]
	WHERE [dbo].[Material].name = @pName;
	
	RETURN @pIdMaterial
END
GO

/****** Object:  UserDefinedFunction [dbo].[getProductID]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Function to return the idProduct
-- Author: Esteban Coto Alfaro
-- Creation Date: 25/05/2018
-- Last Modification: 25/05/2018
-- =============================================
CREATE FUNCTION [dbo].[getProductID]
(
	@pName VARCHAR(50)
)
RETURNS int
AS
BEGIN
	DECLARE @pIdProduct int
	
	SELECT @pIdProduct = [dbo].[Product].idProduct
	FROM [dbo].[Product]
	WHERE [dbo].[Product].name = @pName

	RETURN @pIdProduct
END
GO

/****** Object:  UserDefinedFunction [dbo].[getProviderID]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Function to return the idProvider
-- Author: Esteban Coto Alfaro
-- Creation Date: 22/05/2018
-- Last Modification: 22/05/2018
-- =============================================
CREATE FUNCTION [dbo].[getProviderID] 
(
	@pName VARCHAR(50),
	@pCountry VARCHAR(50)
)
RETURNS int
AS
BEGIN
	DECLARE @pIdProvider int

	SELECT @pIdProvider = Provider.idProvider FROM Provider
	WHERE Provider.name = @pName AND Provider.country = @pCountry

	RETURN @pIdProvider

END
GO

/****** Object:  UserDefinedFunction [dbo].[getRestaurantID]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description: Function to return the idRestaurant
-- Author: Esteban Coto Alfaro
-- Creation Date: 24/05/2018
-- Last Modification: 24/05/2018
-- =============================================
CREATE FUNCTION [dbo].[getRestaurantID] 
(
	@pCode VARCHAR(50)
)
RETURNS int
AS
BEGIN
	DECLARE @pIdRestaurant int

	SELECT @pIdRestaurant = Restaurant.idRestaurant FROM Restaurant
	WHERE Restaurant.code = @pCode

	RETURN @pIdRestaurant
END
GO