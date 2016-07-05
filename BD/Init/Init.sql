
CREATE DATABASE GeoMonikerDB
GO
USE GeoMonikerDB
GO

CREATE TABLE tbl_Company
(
	CompanyId bigint primary key identity,
	CompanyName varchar(100) unique,
	FoundationDate datetime,
	ContactPhone varchar(10),
	Representative varchar(50),
	Active bit,
	CreatedDate datetime,
	UpdateDate datetime
)
GO

CREATE TABLE tbl_AddressCompany
(
	AddressId bigint primary key identity,
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
	UpdateDate datetime,
	CompanyId bigint,
	foreign key(CompanyId) references tbl_Company
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
	CompanyId bigint not null,
	Active bit,
	CreatedDate datetime,
	UpdateDate datetime,
	UserInsert bigint,
	UserUpdate bigint,
	UserType int,
	foreign key (CompanyId) references tbl_Company,
	foreign key (UserInsert) references tbl_User,
	foreign key (UserUpdate) references tbl_User,
	foreign key (UserType) references tbl_UserType
)
GO

CREATE TABLE tbl_AddressUser
(
	AddressId bigint primary key identity,
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
	UpdateDate datetime,
	CompanyId bigint,
	foreign key(UserId) references tbl_User
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
