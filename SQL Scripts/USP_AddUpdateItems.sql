

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_AddUpdateItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_AddUpdateItems]
GO
 SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
 
CREATE PROCEDURE [dbo].[USP_AddUpdateItems]   
 (
	@Id Bigint=0,
	@Vendors varchar(100),
	@ItemCategory varchar(100),
	@Name varchar(100),
	@Alias varchar(100),
	@Desc varchar(100),
	@Price BIGINT,
	@Tags varchar(500),
	@IsRecommended int,
	@ImageUrl varchar(500)	
 )     
AS   
BEGIN 	

	if (@Id<>0)
	Begin
		update ledb_menu
		set id_vendors=@Vendors,kategori_menu=@ItemCategory,nama_menu=@Name,alias_menu=@Alias,
		deskripsi_menu=@Desc,harga_menu=@Price,media_photo=@ImageUrl,tags=@Tags,is_recommended=@IsRecommended,last_update=GETDATE()	
	END
	else
	BEGIN 
		Insert into ledb_menu([menu_id_generator]
      ,[id_vendors]
      ,[alias_menu]
      ,[nama_menu]
      ,[deskripsi_menu]
      ,[media_photo]
      ,[harga_menu]
      ,[kategori_menu]
      ,[tags]
      ,[is_recommended]
      ,[last_update])
		values(CONVERT(BIGINT,CONVERT(BINARY(8), NEWID())),@Vendors,@Alias,@Name,@Desc,@ImageUrl,@Price,@ItemCategory,@Tags,@IsRecommended,GETDATE())	 
	END
	   
END  