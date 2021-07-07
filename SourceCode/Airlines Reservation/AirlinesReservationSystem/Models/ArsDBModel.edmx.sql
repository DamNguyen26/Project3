
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/06/2020 13:08:17
-- Generated from EDMX file: C:\Users\vutra\Desktop\eproject3_airline reservation system_group1\Source code\AirlinesReservationSystem\Models\ArsDBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ARS_db];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Route_RAircraft_Aircraft_AircraftID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Route] DROP CONSTRAINT [FK_Route_RAircraft_Aircraft_AircraftID];
GO
IF OBJECT_ID(N'[dbo].[FK_Airline_AirlineCountry_Country_CountryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Airline] DROP CONSTRAINT [FK_Airline_AirlineCountry_Country_CountryID];
GO
IF OBJECT_ID(N'[dbo].[FK_Route_RAirline_Airline_AirlineID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Route] DROP CONSTRAINT [FK_Route_RAirline_Airline_AirlineID];
GO
IF OBJECT_ID(N'[dbo].[FK_Airport_CountryID_Country_CountryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Airport] DROP CONSTRAINT [FK_Airport_CountryID_Country_CountryID];
GO
IF OBJECT_ID(N'[dbo].[FK_FlightDistance_AirportID1_Airport_AirportID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FlightDistance] DROP CONSTRAINT [FK_FlightDistance_AirportID1_Airport_AirportID];
GO
IF OBJECT_ID(N'[dbo].[FK_FlightDistance_AirportID2_Airport_AirportID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FlightDistance] DROP CONSTRAINT [FK_FlightDistance_AirportID2_Airport_AirportID];
GO
IF OBJECT_ID(N'[dbo].[FK_Route_Departure_Airport_AirportID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Route] DROP CONSTRAINT [FK_Route_Departure_Airport_AirportID];
GO
IF OBJECT_ID(N'[dbo].[FK_Route_Destination_Airport_AirportID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Route] DROP CONSTRAINT [FK_Route_Destination_Airport_AirportID];
GO
IF OBJECT_ID(N'[dbo].[FK_Flight_Route_RNo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Flight] DROP CONSTRAINT [FK_Flight_Route_RNo];
GO
IF OBJECT_ID(N'[dbo].[FK_Ticket_FNo_Flight_FNo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT [FK_Ticket_FNo_Flight_FNo];
GO
IF OBJECT_ID(N'[dbo].[FK_Order_UserID_User_UserID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_UserID_User_UserID];
GO
IF OBJECT_ID(N'[dbo].[FK_Ticket_OrderID_Order_OrderID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT [FK_Ticket_OrderID_Order_OrderID];
GO
IF OBJECT_ID(N'[dbo].[FK_TicketService_ServiceID_Service_ServiceID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TicketService] DROP CONSTRAINT [FK_TicketService_ServiceID_Service_ServiceID];
GO
IF OBJECT_ID(N'[dbo].[FK_TicketService_TicketID_Ticket_TicketID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TicketService] DROP CONSTRAINT [FK_TicketService_TicketID_Ticket_TicketID];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Aircraft]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Aircraft];
GO
IF OBJECT_ID(N'[dbo].[Airline]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Airline];
GO
IF OBJECT_ID(N'[dbo].[Airport]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Airport];
GO
IF OBJECT_ID(N'[dbo].[Country]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Country];
GO
IF OBJECT_ID(N'[dbo].[CreditCard]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CreditCard];
GO
IF OBJECT_ID(N'[dbo].[Employee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employee];
GO
IF OBJECT_ID(N'[dbo].[Flight]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Flight];
GO
IF OBJECT_ID(N'[dbo].[FlightDistance]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FlightDistance];
GO
IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order];
GO
IF OBJECT_ID(N'[dbo].[Route]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Route];
GO
IF OBJECT_ID(N'[dbo].[Service]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Service];
GO
IF OBJECT_ID(N'[dbo].[Ticket]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ticket];
GO
IF OBJECT_ID(N'[dbo].[TicketService]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TicketService];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Aircraft'
CREATE TABLE [dbo].[Aircraft] (
    [AircraftID] varchar(50)  NOT NULL,
    [AircraftName] nvarchar(100)  NOT NULL,
    [FirstClassSeats] int  NULL,
    [BussinessSeats] int  NULL,
    [EconomySeats] int  NOT NULL,
    [Range] int  NOT NULL,
    [ServiceFee] float  NOT NULL
);
GO

-- Creating table 'Airline'
CREATE TABLE [dbo].[Airline] (
    [AirlineID] varchar(10)  NOT NULL,
    [AirlineCountry] varchar(10)  NOT NULL,
    [AirlineName] varchar(60)  NOT NULL,
    [AirlineIcon] varchar(100)  NULL
);
GO

-- Creating table 'Airport'
CREATE TABLE [dbo].[Airport] (
    [AirportID] varchar(10)  NOT NULL,
    [AirportName] varchar(60)  NOT NULL,
    [CityName] nvarchar(60)  NOT NULL,
    [CountryID] varchar(10)  NOT NULL,
    [GMT] float  NOT NULL
);
GO

-- Creating table 'Country'
CREATE TABLE [dbo].[Country] (
    [CountryID] varchar(10)  NOT NULL,
    [CountryName] nvarchar(100)  NOT NULL,
    [CountryFlag] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'CreditCard'
CREATE TABLE [dbo].[CreditCard] (
    [CCNo] varchar(12)  NOT NULL,
    [CVV] varchar(3)  NOT NULL,
    [OwnerName] varchar(100)  NOT NULL,
    [Balance] float  NOT NULL
);
GO

-- Creating table 'Employee'
CREATE TABLE [dbo].[Employee] (
    [EmpID] varchar(50)  NOT NULL,
    [Password] nvarchar(256)  NOT NULL,
    [Firstname] nvarchar(50)  NOT NULL,
    [Lastname] nvarchar(50)  NOT NULL,
    [Address] nvarchar(200)  NOT NULL,
    [Phone] varchar(12)  NOT NULL,
    [Email] varchar(256)  NOT NULL,
    [Sex] bit  NOT NULL,
    [DoB] datetime  NOT NULL,
    [IsActive] bit  NOT NULL,
    [Role] int  NOT NULL
);
GO

-- Creating table 'Flight'
CREATE TABLE [dbo].[Flight] (
    [FNo] varchar(10)  NOT NULL,
    [RNo] int  NOT NULL,
    [AvailSeatsF] int  NULL,
    [AvailSeatsB] int  NULL,
    [AvailSeatsE] int  NOT NULL,
    [DepartureTime] datetime  NOT NULL,
    [ArrivalTime] datetime  NOT NULL,
    [FlightTime] float  NOT NULL,
    [BasePrice] float  NOT NULL
);
GO

-- Creating table 'FlightDistance'
CREATE TABLE [dbo].[FlightDistance] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [AirportID1] varchar(10)  NOT NULL,
    [AirportID2] varchar(10)  NOT NULL,
    [Distance] int  NOT NULL
);
GO

-- Creating table 'Order'
CREATE TABLE [dbo].[Order] (
    [OrderID] bigint  NOT NULL,
    [UserID] varchar(50)  NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [Total] float  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- Creating table 'Route'
CREATE TABLE [dbo].[Route] (
    [RNo] int IDENTITY(1,1) NOT NULL,
    [RAirline] varchar(10)  NOT NULL,
    [RAircraft] varchar(50)  NOT NULL,
    [Departure] varchar(10)  NOT NULL,
    [Destination] varchar(10)  NOT NULL
);
GO

-- Creating table 'Service'
CREATE TABLE [dbo].[Service] (
    [ServiceID] varchar(10)  NOT NULL,
    [ServiceName] nvarchar(100)  NOT NULL,
    [ServiceDetails] nvarchar(max)  NULL,
    [ServiceFee] float  NOT NULL,
    [IsServing] bit  NOT NULL
);
GO

-- Creating table 'Ticket'
CREATE TABLE [dbo].[Ticket] (
    [TicketID] bigint  NOT NULL,
    [OrderID] bigint  NOT NULL,
    [FNo] varchar(10)  NOT NULL,
    [PassportNo] varchar(10)  NOT NULL,
    [Class] varchar(1)  NOT NULL,
    [Firstname] nvarchar(50)  NOT NULL,
    [Lastname] nvarchar(50)  NOT NULL,
    [Sex] bit  NOT NULL,
    [Age] int  NOT NULL,
    [IsReturn] bit  NOT NULL,
    [Price] float  NOT NULL
);
GO

-- Creating table 'TicketService'
CREATE TABLE [dbo].[TicketService] (
    [TSID] int IDENTITY(1,1) NOT NULL,
    [TicketID] bigint  NOT NULL,
    [ServiceID] varchar(10)  NOT NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [UserID] varchar(50)  NOT NULL,
    [Password] nvarchar(256)  NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Address] nvarchar(200)  NOT NULL,
    [Phone] varchar(12)  NOT NULL,
    [Email] varchar(256)  NOT NULL,
    [Sex] bit  NOT NULL,
    [Age] int  NOT NULL,
    [CCNo] varchar(12)  NOT NULL,
    [PassportNo_] varchar(10)  NULL,
    [Skymiles] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AircraftID] in table 'Aircraft'
ALTER TABLE [dbo].[Aircraft]
ADD CONSTRAINT [PK_Aircraft]
    PRIMARY KEY CLUSTERED ([AircraftID] ASC);
GO

-- Creating primary key on [AirlineID] in table 'Airline'
ALTER TABLE [dbo].[Airline]
ADD CONSTRAINT [PK_Airline]
    PRIMARY KEY CLUSTERED ([AirlineID] ASC);
GO

-- Creating primary key on [AirportID] in table 'Airport'
ALTER TABLE [dbo].[Airport]
ADD CONSTRAINT [PK_Airport]
    PRIMARY KEY CLUSTERED ([AirportID] ASC);
GO

-- Creating primary key on [CountryID] in table 'Country'
ALTER TABLE [dbo].[Country]
ADD CONSTRAINT [PK_Country]
    PRIMARY KEY CLUSTERED ([CountryID] ASC);
GO

-- Creating primary key on [CCNo] in table 'CreditCard'
ALTER TABLE [dbo].[CreditCard]
ADD CONSTRAINT [PK_CreditCard]
    PRIMARY KEY CLUSTERED ([CCNo] ASC);
GO

-- Creating primary key on [EmpID] in table 'Employee'
ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [PK_Employee]
    PRIMARY KEY CLUSTERED ([EmpID] ASC);
GO

-- Creating primary key on [FNo] in table 'Flight'
ALTER TABLE [dbo].[Flight]
ADD CONSTRAINT [PK_Flight]
    PRIMARY KEY CLUSTERED ([FNo] ASC);
GO

-- Creating primary key on [ID] in table 'FlightDistance'
ALTER TABLE [dbo].[FlightDistance]
ADD CONSTRAINT [PK_FlightDistance]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [OrderID] in table 'Order'
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT [PK_Order]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [RNo] in table 'Route'
ALTER TABLE [dbo].[Route]
ADD CONSTRAINT [PK_Route]
    PRIMARY KEY CLUSTERED ([RNo] ASC);
GO

-- Creating primary key on [ServiceID] in table 'Service'
ALTER TABLE [dbo].[Service]
ADD CONSTRAINT [PK_Service]
    PRIMARY KEY CLUSTERED ([ServiceID] ASC);
GO

-- Creating primary key on [TicketID] in table 'Ticket'
ALTER TABLE [dbo].[Ticket]
ADD CONSTRAINT [PK_Ticket]
    PRIMARY KEY CLUSTERED ([TicketID] ASC);
GO

-- Creating primary key on [TSID] in table 'TicketService'
ALTER TABLE [dbo].[TicketService]
ADD CONSTRAINT [PK_TicketService]
    PRIMARY KEY CLUSTERED ([TSID] ASC);
GO

-- Creating primary key on [UserID] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RAircraft] in table 'Route'
ALTER TABLE [dbo].[Route]
ADD CONSTRAINT [FK_Route_RAircraft_Aircraft_AircraftID]
    FOREIGN KEY ([RAircraft])
    REFERENCES [dbo].[Aircraft]
        ([AircraftID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Route_RAircraft_Aircraft_AircraftID'
CREATE INDEX [IX_FK_Route_RAircraft_Aircraft_AircraftID]
ON [dbo].[Route]
    ([RAircraft]);
GO

-- Creating foreign key on [AirlineCountry] in table 'Airline'
ALTER TABLE [dbo].[Airline]
ADD CONSTRAINT [FK_Airline_AirlineCountry_Country_CountryID]
    FOREIGN KEY ([AirlineCountry])
    REFERENCES [dbo].[Country]
        ([CountryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Airline_AirlineCountry_Country_CountryID'
CREATE INDEX [IX_FK_Airline_AirlineCountry_Country_CountryID]
ON [dbo].[Airline]
    ([AirlineCountry]);
GO

-- Creating foreign key on [RAirline] in table 'Route'
ALTER TABLE [dbo].[Route]
ADD CONSTRAINT [FK_Route_RAirline_Airline_AirlineID]
    FOREIGN KEY ([RAirline])
    REFERENCES [dbo].[Airline]
        ([AirlineID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Route_RAirline_Airline_AirlineID'
CREATE INDEX [IX_FK_Route_RAirline_Airline_AirlineID]
ON [dbo].[Route]
    ([RAirline]);
GO

-- Creating foreign key on [CountryID] in table 'Airport'
ALTER TABLE [dbo].[Airport]
ADD CONSTRAINT [FK_Airport_CountryID_Country_CountryID]
    FOREIGN KEY ([CountryID])
    REFERENCES [dbo].[Country]
        ([CountryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Airport_CountryID_Country_CountryID'
CREATE INDEX [IX_FK_Airport_CountryID_Country_CountryID]
ON [dbo].[Airport]
    ([CountryID]);
GO

-- Creating foreign key on [AirportID1] in table 'FlightDistance'
ALTER TABLE [dbo].[FlightDistance]
ADD CONSTRAINT [FK_FlightDistance_AirportID1_Airport_AirportID]
    FOREIGN KEY ([AirportID1])
    REFERENCES [dbo].[Airport]
        ([AirportID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FlightDistance_AirportID1_Airport_AirportID'
CREATE INDEX [IX_FK_FlightDistance_AirportID1_Airport_AirportID]
ON [dbo].[FlightDistance]
    ([AirportID1]);
GO

-- Creating foreign key on [AirportID2] in table 'FlightDistance'
ALTER TABLE [dbo].[FlightDistance]
ADD CONSTRAINT [FK_FlightDistance_AirportID2_Airport_AirportID]
    FOREIGN KEY ([AirportID2])
    REFERENCES [dbo].[Airport]
        ([AirportID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FlightDistance_AirportID2_Airport_AirportID'
CREATE INDEX [IX_FK_FlightDistance_AirportID2_Airport_AirportID]
ON [dbo].[FlightDistance]
    ([AirportID2]);
GO

-- Creating foreign key on [Departure] in table 'Route'
ALTER TABLE [dbo].[Route]
ADD CONSTRAINT [FK_Route_Departure_Airport_AirportID]
    FOREIGN KEY ([Departure])
    REFERENCES [dbo].[Airport]
        ([AirportID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Route_Departure_Airport_AirportID'
CREATE INDEX [IX_FK_Route_Departure_Airport_AirportID]
ON [dbo].[Route]
    ([Departure]);
GO

-- Creating foreign key on [Destination] in table 'Route'
ALTER TABLE [dbo].[Route]
ADD CONSTRAINT [FK_Route_Destination_Airport_AirportID]
    FOREIGN KEY ([Destination])
    REFERENCES [dbo].[Airport]
        ([AirportID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Route_Destination_Airport_AirportID'
CREATE INDEX [IX_FK_Route_Destination_Airport_AirportID]
ON [dbo].[Route]
    ([Destination]);
GO

-- Creating foreign key on [RNo] in table 'Flight'
ALTER TABLE [dbo].[Flight]
ADD CONSTRAINT [FK_Flight_Route_RNo]
    FOREIGN KEY ([RNo])
    REFERENCES [dbo].[Route]
        ([RNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Flight_Route_RNo'
CREATE INDEX [IX_FK_Flight_Route_RNo]
ON [dbo].[Flight]
    ([RNo]);
GO

-- Creating foreign key on [FNo] in table 'Ticket'
ALTER TABLE [dbo].[Ticket]
ADD CONSTRAINT [FK_Ticket_FNo_Flight_FNo]
    FOREIGN KEY ([FNo])
    REFERENCES [dbo].[Flight]
        ([FNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Ticket_FNo_Flight_FNo'
CREATE INDEX [IX_FK_Ticket_FNo_Flight_FNo]
ON [dbo].[Ticket]
    ([FNo]);
GO

-- Creating foreign key on [UserID] in table 'Order'
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT [FK_Order_UserID_User_UserID]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[User]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_UserID_User_UserID'
CREATE INDEX [IX_FK_Order_UserID_User_UserID]
ON [dbo].[Order]
    ([UserID]);
GO

-- Creating foreign key on [OrderID] in table 'Ticket'
ALTER TABLE [dbo].[Ticket]
ADD CONSTRAINT [FK_Ticket_OrderID_Order_OrderID]
    FOREIGN KEY ([OrderID])
    REFERENCES [dbo].[Order]
        ([OrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Ticket_OrderID_Order_OrderID'
CREATE INDEX [IX_FK_Ticket_OrderID_Order_OrderID]
ON [dbo].[Ticket]
    ([OrderID]);
GO

-- Creating foreign key on [ServiceID] in table 'TicketService'
ALTER TABLE [dbo].[TicketService]
ADD CONSTRAINT [FK_TicketService_ServiceID_Service_ServiceID]
    FOREIGN KEY ([ServiceID])
    REFERENCES [dbo].[Service]
        ([ServiceID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TicketService_ServiceID_Service_ServiceID'
CREATE INDEX [IX_FK_TicketService_ServiceID_Service_ServiceID]
ON [dbo].[TicketService]
    ([ServiceID]);
GO

-- Creating foreign key on [TicketID] in table 'TicketService'
ALTER TABLE [dbo].[TicketService]
ADD CONSTRAINT [FK_TicketService_TicketID_Ticket_TicketID]
    FOREIGN KEY ([TicketID])
    REFERENCES [dbo].[Ticket]
        ([TicketID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TicketService_TicketID_Ticket_TicketID'
CREATE INDEX [IX_FK_TicketService_TicketID_Ticket_TicketID]
ON [dbo].[TicketService]
    ([TicketID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------