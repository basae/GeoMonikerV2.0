-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edrei Javier Bastar
-- Create date: 04-07-2016
-- Description:	Insercion de una empresa
-- =============================================
--Sp_Api_IU_Company null,'test',null,null,null,null,null,null,null,null,null,null,10.123,174.28

ALTER PROCEDURE Sp_Api_IU_Company
	@CompanyId bigint = null output,
	@CompanyName varchar(100),
	@FoundationDate datetime = null,
	@ContactPhone varchar(10) = '',
	@Representative varchar(50) = '',

	@Street varchar(100) = '',
	@InStreetNumber varchar(20)='',
	@ExStreetNumber varchar(20)='',
	@Neighborhood varchar(50)='',
	@City varchar(20)='',
	@State varchar(50)='',
	@Country varchar(50)='',
	@Latitude decimal(10,8),
	@Longitude decimal(10,8)
AS
BEGIN
	
	SET NOCOUNT ON;
	BEGIN TRAN
		BEGIN TRY
			IF (@CompanyId IS NULL OR @CompanyId=0)
				BEGIN
					INSERT INTO tbl_Company(CompanyName, FoundationDate, ContactPhone, Representative, Active, CreatedDate)
					VALUES (@CompanyName,@FoundationDate,@ContactPhone,@Representative,1,GETDATE())
					
					set @CompanyId=scope_identity()
					
					INSERT INTO tbl_AddressCompany
					(Street, InStreetNumber, ExStreetNumber, Neighborhood, City, [State], Country, Latitude, Longitude, Active, CreatedDate,CompanyId)
					VALUES (@Street,@InStreetNumber,@ExStreetNumber,@Neighborhood,@City,@State,@Country,@Latitude,@Longitude,1,GETDATE(),@CompanyId)
				END
			ELSE
				BEGIN
					UPDATE tbl_Company SET
					CompanyName=@CompanyName, 
					FoundationDate=@FoundationDate, 
					ContactPhone=@ContactPhone, 
					Representative=@Representative, 
					UpdateDate=GETDATE()
					WHERE CompanyId=@CompanyId
					
					UPDATE tbl_AddressCompany SET
					Street=@Street, 
					InStreetNumber=@InStreetNumber, 
					ExStreetNumber=@ExStreetNumber, 
					Neighborhood=@Neighborhood, 
					City=@City, 
					[State]=@State, 
					Country=@Country, 
					Latitude=@Latitude, 
					Longitude=@Longitude, 
					UpdateDate=GETDATE()
					WHERE CompanyId=@CompanyId
				END
		COMMIT TRAN
		END TRY
		BEGIN CATCH
			DECLARE @msg varchar(300)
			ROLLBACK TRAN
			set @msg='Error:'+ERROR_MESSAGE()+'en la línea:'+CONVERT(nvarchar(50),ERROR_LINE())+'.'
			raiserror(@msg,16,1)
		END CATCH	
END
GO

--select *from tbl_company c inner join tbl_addresscompany ac
--on c.companyid=ac.companyid