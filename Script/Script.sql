/**
 * DDL Command
 * Description: The next command create the table administrator with those attributes.
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/

CREATE TABLE Administrator (
    idAdministrator int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    username varchar(255),
    passwordAdmin varchar(255),
	firstname varchar(255),
	lastname varchar(255),
	identification int UNIQUE,
	dateOfBirth DATE
);

/**
 * DDL Command
 * Description: The next command create the table Seller with those attributes.
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/

CREATE TABLE Seller (
    idSeller int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    username varchar(255),
    passwordSeller varchar(255),
	firstname varchar(255),
	lastname varchar(255),
	identification int UNIQUE,
	dateOfBirth DATE
);

/**
 * DDL Command
 * Description: The next command create the table Client with those attributes.
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/

CREATE TABLE Client (
    idClient int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    bonus int,
	firstname varchar(255),
	lastname varchar(255),
	identification int UNIQUE,
	dateOfBirth DATE
);

/**
 * DDL Command
 * Description: The next command create the table ClientRecomendClient with those attributes.
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/

CREATE TABLE ClientRecomendClient (
    idClientRecomendClient int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    idRecomend int FOREIGN KEY REFERENCES dbo.Client(idClient),
    idClient int FOREIGN KEY REFERENCES dbo.Client(idClient)
);

/**
 * DDL Command
 * Description: The next command create the procedure get the data from ClientRecomendClient.
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE getClientRecomendClient AS
BEGIN
SELECT * FROM ClientRecomendClient;
END;

/**
 * DDL Command
 * Description: The next command insert a new Client friend.
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE insertClientRecomendClient(@pIdRecomend INT, @pIdClient INT)
AS BEGIN
INSERT INTO dbo.ClientRecomendClient(idRecomend, idClient)
VALUES(@pIdRecomend, @pIdClient);
END;

/**
 * DDL Command
 * Description: The next command delete a Client friend.
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE deleteClientRecomendClient(@pIdClientRecomendClient INT) AS
BEGIN
DELETE FROM ClientRecomendClient  
WHERE idClientRecomendClient  = @pIdClientRecomendClient
END;

/**
 * DDL Command
 * Description: The next command create the procedure insertAdministrator insert into administrator.
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE insertAdministrator(@pUsername VARCHAR(100), @pPassword VARCHAR(100), @pFirstname VARCHAR(100),
@pLastname VARCHAR(100), @pIdentification INT, @pDate DATE)
AS BEGIN
INSERT INTO dbo.Administrator(username, passwordAdmin, firstname,
lastname, identification, dateOfBirth)
VALUES(@pUsername, @pPassword, @pFirstname, @pLastname, @pIdentification, @pDate);
END;

EXEC dbo.insertAdministrator 'Charlie', 'Charlie', 'Carlos', 'Gonzalez', 1236547,'2008-01-08'; 

/**
 * DDL Command
 * Description: The next command create the procedure getAdministrator get data from administrator.
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE getAdministrator AS
BEGIN
SELECT * FROM Administrator;
END;

/**
 * DDL Command
 * Description: The next command create the procedure updateAdministrator update data in administrator.
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE updateAdministrator(@pId INT, @pUsername VARCHAR(100), @pPassword VARCHAR(100), @pFirstname VARCHAR(100),
@pLastname VARCHAR(100), @pIdentification INT, @pDate DATE)
AS BEGIN 
UPDATE dbo.Administrator
SET username = @pUsername,
 passwordAdmin  = @pPassword,
 firstname = @pFirstname,
 lastname = @pLastname,
 identification = @pIdentification,
 dateOfBirth = @pDate
WHERE Administrator.idAdministrator  = @pId
END;

/**
 * DDL Command
 * Description: The next command create the procedure deleteAdministrator delete data in administrator by id.
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE deleteAdministrator(@pId INT) AS
BEGIN
DELETE FROM Administrator  
WHERE idAdministrator  = @pId
END;

/**
 * DDL Command
 * Description: The next command create the procedure insertSeller insert data in seller
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE insertSeller(@pUsername VARCHAR(100), @pPassword VARCHAR(100), @pFirstname VARCHAR(100),
@pLastname VARCHAR(100), @pIdentification INT, @pDate DATE)
AS BEGIN
INSERT INTO dbo.Administrator(username , passwordSeller , firstname,
lastname, identification, dateOfBirth)
VALUES(@pUsername, @pPassword, @pFirstname, @pLastname, @pIdentification, @pDate);
END;

EXEC dbo.insertSeller'Charlie', 'Charlie', 'Carlos', 'Gonzalez', 1236547,'2008-01-08'; 

/**
 * DDL Command
 * Description: The next command create the procedure updateSeller update data in seller
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE updateSeller(@pId INT, @pUsername VARCHAR(100), @pPassword VARCHAR(100), @pFirstname VARCHAR(100),
@pLastname VARCHAR(100), @pIdentification INT, @pDate DATE)
AS BEGIN 
UPDATE dbo.Administrator
SET username = @pUsername,
 passwordSeller  = @pPassword,
 firstname = @pFirstname,
 lastname = @pLastname,
 identification = @pIdentification,
 dateOfBirth = @pDate
WHERE Administrator.idSeller  = @pId
END;

/**
 * DDL Command
 * Description: The next command create the procedure deleteSeller delete data in seller
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE deleteSeller(@pId INT) AS
BEGIN
DELETE FROM Seller  
WHERE idSeller  = @pId
END;

/**
 * DDL Command
 * Description: The next command create the procedure getSeller get data in seller
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE getSeller AS
BEGIN
SELECT * FROM Seller;
END;

/**
 * DDL Command
 * Description: The next command create the procedure insertClient insert data in client
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE insertClient(@pFirstname VARCHAR(100),
@pLastname VARCHAR(100), @pIdentification INT, @pDate DATE, @pBonus INT)
AS BEGIN
INSERT INTO dbo.Client(bonus, firstname,
lastname, identification, dateOfBirth)
VALUES(@pBonus, @pFirstname, @pLastname, @pIdentification, @pDate);
END;

/**
 * DDL Command
 * Description: The next command create the procedure deleteClient delete data in client
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE deleteClient(@pId INT) AS
BEGIN
DELETE FROM Client  
WHERE idClient  = @pId
END;

/**
 * DDL Command
 * Description: The next command create the procedure getClient get data in client
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE getClient AS
BEGIN
SELECT * FROM Client;
END;

/**
 * DDL Command
 * Description: The next command create the procedure updateClient update data in client
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE updateClient(@pBonus INT, @pId INT, @pFirstname VARCHAR(100),
@pLastname VARCHAR(100), @pIdentification INT, @pDate DATE)
AS BEGIN 
UPDATE dbo.Client
SET 
 bonus = @pBonus,
 firstname = @pFirstname,
 lastname = @pLastname,
 identification = @pIdentification,
 dateOfBirth = @pDate
WHERE Client.idClient  = @pId
END;

/**
 * DDL Command
 * Description: The next command create the procedure insertClientRecomendClient insert data in ClientRecomendClient
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE insertClientRecomendClient(@pNewClient INT, @pRecommend INT)
AS BEGIN
INSERT INTO dbo.ClientRecomendClient(idRecomend, idClient)
VALUES(@pNewClient, @pNewClient);
END;

/**
 * DDL Command
 * Description: The next command create the procedure updateClient update data in ClientRecomendClient
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE updateClient(@pNewClient INT, @pRecommend INT, @pIdRecomendClient INT)
AS BEGIN 
UPDATE dbo.ClientRecomendClient
SET 
 idClient = @pNewClient,
 idRecomend = @pRecommend
WHERE ClientRecomendClient.idClientRecomendClient  = @pIdRecomendClient
END;

/**
 * DDL Command
 * Description: The next command create the procedure deleteClientRecomendClient delete data in ClientRecomendClient
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE deleteClientRecomendClient(@pId INT) AS
BEGIN
DELETE FROM ClientRecomendClient  
WHERE idClientRecomendClient  = @pId
END;

/**
 * DDL Command
 * Description: The next command create the procedure getClientRecomendClient get data in ClientRecomendClient
 * Author: Danny Xie Li
 * Created: 21/05/18
 * Last modification: 21/05/18
*/
CREATE PROCEDURE getClientRecomendClient AS
BEGIN
SELECT * FROM ClientRecomendClient;
END;
