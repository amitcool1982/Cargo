

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_AddUpdateVendor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_AddUpdateVendor]
GO
 SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
 
CREATE PROCEDURE [dbo].[USP_AddUpdateVendor]   
 (
	@Id Bigint=0,
	@Name varchar(100),
	@Alias varchar(100),
	@AliasProvince varchar(100),
	@AliasCity varchar(100),
	@Phone varchar(100),
	@Email varchar(100),
	@Address varchar(500),
	@ImageUrl varchar(500),
	@BannerUrl varchar(500)	
 )     
AS   
BEGIN 	

	SET QUOTED_IDENTIFIER OFF

	if (@Id<>0)
	Begin
		update ledb_vendors
		set alias_vendors=@Alias,nama_vendors=@Name,alias_daerah=@AliasProvince,alias_kota=@AliasCity,
		tlp_vendors=@Phone,email_vendors=@Email,logo_vendors=@ImageUrl,banner_vendors=@BannerUrl,alamat_vendors=@Address,last_updated=GETDATE()	
	END
	else
	BEGIN 
		Insert into ledb_vendors(id_vendors_generator,[alias_daerah]
      ,[alias_kota]
      ,[alias_vendors]
      ,[nama_vendors]
      ,[alamat_vendors]
      ,[tlp_vendors]
      ,[email_vendors]
      ,[logo_vendors]
      ,[banner_vendors]
      ,[last_updated])
		values(CONVERT(BIGINT,CONVERT(BINARY(8), NEWID())),@AliasProvince,@AliasCity,@Name,@Alias,@Address,@Phone,@Email,@ImageUrl,@BannerUrl,GETDATE())	 
	END
	   
END  