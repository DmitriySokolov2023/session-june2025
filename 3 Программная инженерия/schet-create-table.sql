-- Создание таблицы организаций
CREATE TABLE Organizations (
    OrganizationID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    INN VARCHAR(12) NOT NULL,
    KPP VARCHAR(9)
);

-- Создание таблицы ответственных лиц
CREATE TABLE ResponsiblePersons (
    ResponsiblePersonID SERIAL PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Position VARCHAR(100)
);

-- Создание таблицы товаров/услуг
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Unit VARCHAR(50)
);

-- Создание таблицы счетов-фактур
CREATE TABLE Invoices (
    InvoiceID SERIAL PRIMARY KEY,
    InvoiceNumber VARCHAR(50) NOT NULL,
    InvoiceDate DATE NOT NULL,
    SellerID INT NOT NULL REFERENCES Organizations(OrganizationID) ON DELETE CASCADE,
    BuyerID INT NOT NULL REFERENCES Organizations(OrganizationID) ON DELETE CASCADE,
    ResponsiblePersonID INT REFERENCES ResponsiblePersons(ResponsiblePersonID) ON DELETE SET NULL
);

-- Создание таблицы позиций счета-фактуры
CREATE TABLE InvoiceItems (
    InvoiceItemID SERIAL PRIMARY KEY,
    InvoiceID INT NOT NULL REFERENCES Invoices(InvoiceID) ON DELETE CASCADE,
    ProductID INT NOT NULL REFERENCES Products(ProductID) ON DELETE CASCADE,
    Quantity NUMERIC(10,2) NOT NULL CHECK (Quantity >= 0),
    Price NUMERIC(14,2) NOT NULL CHECK (Price >= 0),
    AmountWithoutVAT NUMERIC(14,2) NOT NULL CHECK (AmountWithoutVAT >= 0),
    VATRate NUMERIC(5,2) NOT NULL CHECK (VATRate >= 0),
    VATAmount NUMERIC(14,2) NOT NULL CHECK (VATAmount >= 0),
    AmountWithVAT NUMERIC(14,2) NOT NULL CHECK (AmountWithVAT >= 0)
);