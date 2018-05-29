/******Object:  Table [dbo].[Combo]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/*
Description: Create Combo Table
Creation date: 29/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 29/05/2018
*/
CREATE TABLE [dbo].[Combo](
	[idCombo] [int] IDENTITY(1,1) NOT NULL,
	[comboCode] [varchar](50) NULL,
	[comboPrice] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ComboByRest]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/*
Description: Create ComboByRest Table
Creation date: 29/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 29/05/2018
*/
CREATE TABLE [dbo].[ComboByRest](
	[idCombo] [int] NULL,
	[idRestaurant] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ComboByRest]  WITH CHECK ADD  CONSTRAINT [FK_ComboByRest_Combo] FOREIGN KEY([idCombo])
REFERENCES [dbo].[Combo] ([idCombo])
GO

ALTER TABLE [dbo].[ComboByRest] CHECK CONSTRAINT [FK_ComboByRest_Combo]
GO

ALTER TABLE [dbo].[ComboByRest]  WITH CHECK ADD  CONSTRAINT [FK_ComboByRest_Restaurant] FOREIGN KEY([idRestaurant])
REFERENCES [dbo].[Restaurant] ([idRestaurant])
GO

ALTER TABLE [dbo].[ComboByRest] CHECK CONSTRAINT [FK_ComboByRest_Restaurant]
GO

/****** Object:  Table [dbo].[ProductByCombo]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/*
Description: Create ProductByCombo Table
Creation date: 29/05/2018
Created by: Esteban Coto Alfaro
Last Modification: 29/05/2018
*/
CREATE TABLE [dbo].[ProductByCombo](
	[idCombo] [int] NULL,
	[idProduct] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductByCombo]  WITH CHECK ADD  CONSTRAINT [FK_ProductByCombo_Combo] FOREIGN KEY([idCombo])
REFERENCES [dbo].[Combo] ([idCombo])
GO

ALTER TABLE [dbo].[ProductByCombo] CHECK CONSTRAINT [FK_ProductByCombo_Combo]
GO

ALTER TABLE [dbo].[ProductByCombo]  WITH CHECK ADD  CONSTRAINT [FK_ProductByCombo_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
GO

ALTER TABLE [dbo].[ProductByCombo] CHECK CONSTRAINT [FK_ProductByCombo_Product]
GO
----------------------------------------------------------------------------------
-- PROCEDURES
----------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description: Procedure to insert a combo
-- Author: Esteban Coto Alfaro
-- Creation Date: 29/05/2018
-- Last Modification: 29/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[insertCombo]
(
	@pComboCode VARCHAR(50),
	@pComboPrice int
)
AS
BEGIN
	INSERT INTO [dbo].[Combo]([comboCode], [comboPrice])
	VALUES(@pComboCode, @pComboPrice)
END
GO
/*
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description: Procedure to update a combo
-- Author: Esteban Coto Alfaro
-- Creation Date: 29/05/2018
-- Last Modification: 29/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[updateCombo]
(
	@pOldCode VARCHAR(50),
	@pNewCode VARCHAR(50),
	@pPrice VARCHAR(50)
)
AS
BEGIN
	UPDATE [dbo].[Combo]
	SET [dbo].[Combo].comboCode = @pNewCode,
	[dbo].[Combo].comboPrice = @pPrice
	WHERE [dbo].[Combo].comboCode = @pOldCode
END
GO
/*
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description: Procedure to delete a combo
-- Author: Esteban Coto Alfaro
-- Creation Date: 29/05/2018
-- Last Modification: 29/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[deleteCombo]
(
	@pCode VARCHAR(50)
)
AS
BEGIN
	DELETE FROM [dbo].[Combo]
	WHERE [dbo].[Combo].comboCode = @pCode
END
GO
/*
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description: Procedure to get all the combo
-- Author: Esteban Coto Alfaro
-- Creation Date: 29/05/2018
-- Last Modification: 29/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[getAllCombo]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM [dbo].[Combo]
END
GO
/*
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description: Procedure to get a combo
-- Author: Esteban Coto Alfaro
-- Creation Date: 29/05/2018
-- Last Modification: 29/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[getCombo]
(
	@pCode VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM [dbo].[Combo]
	WHERE [dbo].[Combo].comboCode = @pCode
END
GO
/*
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description: Procedure to insert a ComboByRest
-- Author: Esteban Coto Alfaro
-- Creation Date: 29/05/2018
-- Last Modification: 29/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[insertComboByRest]
(
	@pComboCode VARCHAR(50),
	@pRestCode VARCHAR(50)
)
AS
BEGIN
	DECLARE @pComboID int
	DECLARE @pRestID int
	SELECT @pComboID = [dbo].[getComboID](@pComboCode),
	@pRestID = [dbo].[getRestaurantID](@pRestCode)
	INSERT INTO [dbo].[ComboByRest]([idCombo], [idRestaurant])
	VALUES (@pComboID, @pRestID)
END
GO
/*
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description: Procedure to delete a ComboByRestaurant
-- Author: Esteban Coto Alfaro
-- Creation Date: 29/05/2018
-- Last Modification: 29/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[deleteComboByRest]
(
	@pComboCode VARCHAR(50),
	@pRestCode VARCHAR(50)
)
AS
BEGIN
	DECLARE @pComboID int
	DECLARE @pRestID int

	SELECT @pComboID = [dbo].[getComboID](@pComboCode),
	@pRestID = [dbo].[getRestaurantID](@pRestCode)
	DELETE FROM [dbo].[ComboByRest]
	WHERE @pComboID = [dbo].[ComboByRest].idCombo AND
	@pRestID = [dbo].[ComboByRest].idRestaurant
END
GO
/*
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description: Procedure to insert a ProductByCombo
-- Author: Esteban Coto Alfaro
-- Creation Date: 29/05/2018
-- Last Modification: 29/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[insertProductByRest]
(
	@pComboCode VARCHAR(50),
	@pProductName VARCHAR(50)
)
AS
BEGIN
	DECLARE @pComboID int
	DECLARE @pProductID int

	SELECT @pComboID = [dbo].[getComboID](@pComboCode),
	@pProductID = [dbo].[getProductID](@pProductName)
	INSERT INTO [dbo].[ProductByCombo]([idCombo], [idProduct])
	VALUES (@pComboID, @pProductID)
END
GO
/*
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description: Procedure to delete a ProductByCombo
-- Author: Esteban Coto Alfaro
-- Creation Date: 29/05/2018
-- Last Modification: 29/05/2018
-- =============================================
CREATE PROCEDURE [dbo].[deleteProductByCombo]
(
	@pProductName VARCHAR(50),
	@pComboCode VARCHAR(50)
)
AS
BEGIN
	DECLARE @pComboID int
	DECLARE @pProductID int

	SELECT @pComboID = [dbo].[getComboID](@pComboCode),
	@pProductID = [dbo].[getProductID](@pProductName)
	DELETE FROM [dbo].[ProductByCombo]
	WHERE @pComboID = [dbo].[ProductByCombo].idCombo AND
	@pProductID = [dbo].[ProductByCombo].idProduct
END
GO
----------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description: Function to return the idCombo
-- Author: Esteban Coto Alfaro
-- Creation Date: 29/05/2018
-- Last Modification: 29/05/2018
-- =============================================
CREATE FUNCTION [dbo].[getComboID] 
(
	@pCode VARCHAR(50)
)
RETURNS int
AS
BEGIN
	DECLARE @pIdCombo int

	SELECT @pIdCombo = [dbo].[Combo].idCombo FROM [dbo].[Combo]
	WHERE [dbo].[Combo].comboCode = @pCode

	RETURN @pIdCombo
END
GO