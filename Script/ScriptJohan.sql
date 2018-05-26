/**
 * DDL Command
 * Description: Creates the table Combo with its respective attributes
 * Author: Johan Torres Creed
 * Created: 22/05/18
 * Last modification: 22/05/18
*/

CREATE TABLE Combo (
	idCombo int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	comboCode int,
	idRestaurant int FOREIGN KEY REFERENCES dbo.restaurant(idRestaurant),
	productList VARCHAR(255),
	comboPrice real,
	isLimitedTime boolean
);

/**
 * DDL Command
 * Description: Creates the table Bill with its respective attributes
 * Author: Johan Torres Creed
 * Created: 22/05/18
 * Last modification: 22/05/18
*/

CREATE TABLE Bill (
	idBill int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	billCode int,
	idClient int FOREIGN KEY REFERENCES dbo.Client(idClient),
	idSeller int FOREIGN KEY REFERENCES dbo.Seller(idSeller),
	restaurant int FOREIGN KEY REFERENCES dbo.restaurant(idRestaurant),
	billDetails VARCHAR(255),
	totalToPay real
);

/**
 * DDL Command
 * Description: Procedure to insert a new combo into Combo table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 23/05/18
*/

CREATE PROCEDURE insertCombo(@pCode int, @pRestaurant VARCHAR(100), @pProductList VARCHAR(100), @pComboPrice int, @pLimitedTime boolean) AS
BEGIN
DECLARE @pIdRestaurant int
SELECT @pIdRestaurant = [dbo].[getRestaurantID](@pRestaurant)
INSERT INTO dbo.Combo(comboCode, idRestaurant, productList, comboPrice, isLimitedTime)
VALUES(@pCode, @pIdRestaurant, @pProductList, @pComboPrice, @pLimitedTime);
END;

/**
 * DDL Command
 * Description: Procedure to get combo data from Combo table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 23/05/18
*/

CREATE PROCEDURE getCombo AS
BEGIN
SELECT * FROM Combo;
END;

/**
 * DDL Command
 * Description: Procedure to update an existing combo in Combo table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 23/05/18
*/

CREATE PROCEDURE updateCombo(@pId int, @pCode int, @pRestaurant VARCHAR(100), @pProductList VARCHAR(100), @pComboPrice int, @pLimitedTime boolean) AS
BEGIN
DECLARE @pIdRestaurant int
SELECT @pIdRestaurant = [dbo].[getRestaurantID](@pRestaurant)
UPDATE dbo.Combo
SET comboCode = @pCode,
 idRestaurant = @pIdRestaurant,
 productList = @pProductList,
 comboPrice = @pComboPrice,
 isLimitedTime = @pLimitedTime
WHERE Combo.idCombo = @pId
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
 * Last modification: 23/05/18
*/

CREATE PROCEDURE insertBill(@pCode int, @pClient VARCHAR(100), @pSeller VARCHAR(100), @pRestaurant VARCHAR(100), @pBillDetails VARCHAR(100), @pTotal real) AS
DECLARE @pIdClient int
DECLARE @pIdSeller int
DECLARE @pIdRestaurant int
SELECT @pIdClient = [dbo].[getClientID](@pClient),
@pIdSeller = [dbo].[getSellerID](@pSeller),
@pIdRestaurant = [dbo].[getRestaurantID](@pRestaurant)
BEGIN
INSERT INTO dbo.Bill(billCode, idClient, idSeller, idRestaurant, billDetails, totalToPay)
VALUES (@pCode, @pIdClient, @pIdSeller, @pIdRestaurant, @pBillDetails, @pTotal);
END;

/**
 * DDL Command
 * Description: Procedure to get bill data from Bill table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 23/05/18
*/

CREATE PROCEDURE getBill AS
BEGIN
SELECT * FROM Bill;
END;

/**
 * DDL Command
 * Description: Procedure to update an existing bill in Bill table
 * Author: Johan Torres Creed
 * Created: 23/05/18
 * Last modification: 23/05/18
*/

CREATE PROCEDURE updateBill(@pId int, @pCode int, @pClient VARCHAR(100), @pSeller VARCHAR(100), @pRestaurant VARCHAR(100), @pBillDetails VARCHAR(100), @pTotal real) AS
BEGIN
DECLARE @pIdClient int
DECLARE @pIdSeller int
DECLARE @pIdRestaurant int
SELECT @pIdClient = [dbo].[getClientID](@pClient),
@pIdSeller = [dbo].[getSellerID](@pSeller),
@pIdRestaurant = [dbo].[getRestaurantID](@pRestaurant)
UPDATE dbo.Bill
SET billCode = @pCode,
 idClient = @pIdClient,
 idSeller = @pIdSeller,
 idRestaurant = @pIdRestaurant,
 billDetails = @pBillDetails,
 totalToPay = @pTotal
WHERE Bill.idBill = @pId
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
