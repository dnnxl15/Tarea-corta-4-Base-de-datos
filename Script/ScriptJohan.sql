/**
 * DDL Command
 * Description: Creates the table Combo with its respective attributes
 * Author: Johan Torres Creed
 * Created: 22/05/18
 * Last modification: 27/05/18
*/

CREATE TABLE Combo (
	idCombo int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	comboCode int,
	productList VARCHAR(255),
	comboPrice money,
	isLimitedTime bit
);

/**
 * DDL Command
 * Description: Creates the table ComboByRestaurant with its respective attributes
 * Author: Johan Torres Creed
 * Created: 27/05/18
 * Last modification: 27/05/18
*/

CREATE TABLE ComboByRestaurant (
	idComboByRestaurant int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	idRestaurant int FOREIGN KEY REFERENCES dbo.Restaurant(idRestaurant),
	restaurant VARCHAR(255),
	comboList VARCHAR(255)
);

/**
 * DDL Command
 * Description: Creates the table Bill with its respective attributes
 * Author: Johan Torres Creed
 * Created: 22/05/18
 * Last modification: 27/05/18
*/

CREATE TABLE Bill (
	idBill int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	billCode int,
	idClient int FOREIGN KEY REFERENCES dbo.Client(idClient),
	idSeller int FOREIGN KEY REFERENCES dbo.Seller(idSeller),
	restaurant int FOREIGN KEY REFERENCES dbo.restaurant(idRestaurant),
	billDetails VARCHAR(255),
	totalToPay money
);

/**
 * DDL Command
 * Description: Procedure to insert a new combo into Combo table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 27/05/18
*/

CREATE PROCEDURE insertCombo(@pCode int, @pProductList VARCHAR(100), @pComboPrice money, @pLimitedTime bit) AS
BEGIN
INSERT INTO dbo.Combo(comboCode, productList, comboPrice, isLimitedTime)
VALUES(@pCode, @pProductList, @pComboPrice, @pLimitedTime);
END;

/**
 * DDL Command
 * Description: Procedure to get combo data from Combo table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 23/05/18
*/

CREATE PROCEDURE getAllCombo AS
BEGIN
SELECT * FROM Combo;
END;

/**
 * DDL Command
 * Description: Function to get combo code from a row in Combo table
 * Author: Johan Torres Creed
 * Created: 27/05/18
 * Last modification: 27/05/18
*/

CREATE FUNCTION getComboCode(@pId AS INT)
RETURNS INT
AS BEGIN
	DECLARE @code INT
	SET @code = (SELECT Combo.comboCode FROM Combo WHERE Combo.idCombo = @pId)
	RETURN @code
END;

/**
 * DDL Command
 * Description: Function to get combo ID from a row in Combo table
 * Author: Johan Torres Creed
 * Created: 27/05/18
 * Last modification: 27/05/18
*/

CREATE FUNCTION getComboId(@pCode AS INT)
RETURNS INT
AS BEGIN
	DECLARE @comboId INT
	SET @comboId = (SELECT Combo.idCombo FROM Combo WHERE Combo.comboCode = @pCode)
	RETURN @comboId
END;

/**
 * DDL Command
 * Description: Procedure to update an existing combo in Combo table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 27/05/18
*/

CREATE PROCEDURE updateCombo(@pOldCode int, @pNewCode int, @pProductList VARCHAR(100), @pComboPrice int, @pLimitedTime bit) AS
BEGIN
UPDATE dbo.Combo
SET comboCode = @pNewCode,
 productList = @pProductList,
 comboPrice = @pComboPrice,
 isLimitedTime = @pLimitedTime
WHERE Combo.comboCode = @pOldCode
END;

/**
 * DDL Command
 * Description: Procedure to delete an existing combo from Combo table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 23/05/18
*/

CREATE PROCEDURE deleteCombo(@pCode int) AS
BEGIN
DELETE FROM Combo
WHERE Combo.comboCode = @pCode
END;

/**
 * DDL Command
 * Description: Procedure to insert a new bill into Bill table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 27/05/18
*/

CREATE PROCEDURE insertBill(@pCode int, @pClientIdent int, @pSellerIdent int, @pRestaurant VARCHAR(20), @pBillDetails VARCHAR(100), @pTotal money) AS
BEGIN
INSERT INTO dbo.Bill(billCode, idClient, idSeller, restaurant, billDetails, totalToPay)
VALUES (@pCode, dbo.getClientId(@pClientIdent), dbo.getSellerId(@pSellerIdent), dbo.getRestaurantID(@pRestaurant), @pBillDetails, @pTotal);
END;

/**
 * DDL Command
 * Description: Procedure to get bill data from Bill table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 23/05/18
*/

CREATE PROCEDURE getAllBill AS
BEGIN
SELECT * FROM Bill;
END;

/**
 * DDL Command
 * Description: Procedure to update an existing bill in Bill table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 27/05/18
*/

CREATE PROCEDURE updateBill(@pOldCode int, @pNewCode int, @pClientIdent int, @pSellerIdent int, @pRestaurant VARCHAR(20), @pBillDetails VARCHAR(100), @pTotal money) AS
BEGIN
UPDATE dbo.Bill
SET billCode = @pNewCode,
 idClient = dbo.getClientId(@pClientIdent),
 idSeller = dbo.getSellerId(@pSellerIdent),
 restaurant = dbo.getRestaurantID(@pRestaurant),
 billDetails = @pBillDetails,
 totalToPay = @pTotal
WHERE Bill.billCode = @pOldCode
END;

/**
 * DDL Command
 * Description: Procedure to delete an existing bill from Bill table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 23/05/18
*/

CREATE PROCEDURE deleteBill(@pCode int) AS
BEGIN
DELETE FROM Bill
WHERE Bill.billCode = @pCode
END;
