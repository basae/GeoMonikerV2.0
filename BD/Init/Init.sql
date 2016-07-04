CREATE DATABASE GeoMonikerDB
GO
USE GeoMonikerDB
GO
CREATE TABLE tbl_AddressType
(
	AddressTypeId int primary key identity,
	Name varchar(50)
)

GO

CREATE TABLE tbl_Address
(
	AddressId bigint primary key identity,
	AddressTypeId int,
	Street varchar(100),
	InStreetNumber varchar(20),
	ExStreetNumber varchar(20),
	Neighborhood varchar(50),
	City varchar(20),
	[State] varchar(50),
	Country varchar(50),
	Latitude decimal(10,8),
	Longitude decimal(10,8),
	Active bit,
	CreatedDate datetime,
	UpdateDate datetime
	foreign key(AddressTypeId) references tbl_AddressType
)

GO

CREATE TABLE tbl_Company
(
	CompanyId bigint primary key identity,
	CompanyName varchar(100) unique,
	FoundationDate datetime,
	ContactPhone varchar(10),
	Representative varchar(50),
	AddressId bigint,
	Active bit,
	CreatedDate datetime,
	UpdateDate datetime,
	foreign key(AddressId) references tbl_address
)

GO

CREATE TABLE tbl_UserType
(
	UserTypeId int primary key identity,
	Name varchar(50)
)

GO

CREATE TABLE tbl_User
(
	UserId bigint primary key identity,
	FirstName varchar(50) not null,
	LastName varchar(50) not null,
	Email varchar(50),
	UserName varchar(50) not null,
	[Password] varchar(50) not null,
	AddressId bigint,
	CompanyId bigint not null,
	Active bit,
	CreatedDate datetime,
	UpdateDate datetime,
	UserInsert bigint,
	UserUpdate bigint,
	UserType int,
	foreign key (AddressId) references tbl_address,
	foreign key (CompanyId) references tbl_Company,
	foreign key (UserInsert) references tbl_User,
	foreign key (UserUpdate) references tbl_User,
	foreign key (UserType) references tbl_UserType
)

GO

CREATE TABLE tbl_Route
(
	RouteId bigint primary key identity,
	Name varchar(50) Unique not null,
	Active bit,
	CreatedDate datetime,
	UpdateDate datetime,
	UserInsert bigint,
	UserUpdate bigint,
	CompanyId bigint,
	foreign key (UserInsert) references tbl_User,
	foreign key (UserUpdate) references tbl_User,
	foreign key (CompanyId) references tbl_Company
)

GO

CREATE TABLE tbl_Waypoint
(
	WaypointID bigint primary key identity,
	Name varchar(50),
	Latitude decimal(10,8),
	Longitude decimal(10,8),
	Active bit,
	CreatedDate datetime,
	UpdateDate datetime,
	UserInsert bigint,
	UserUpdate bigint,
	RouteId bigint,
	foreign key (UserInsert) references tbl_User,
	foreign key (UserUpdate) references tbl_User,
	foreign key (RouteId) references tbl_Route
)

GO

CREATE TABLE tbl_Drive
(
	DriveId bigint primary key identity,
	DriveNumber varchar(10),
	CreatedDate datetime,
	UpdateDate datetime,
	UserInsert bigint,
	UserUpdate bigint,
	Active bit,
	CompanyId bigint,
	foreign key (UserInsert) references tbl_User,
	foreign key (UserUpdate) references tbl_User,
	foreign key (CompanyId) references tbl_Company
)
