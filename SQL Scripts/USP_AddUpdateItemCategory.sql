

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_AddUpdateItemCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_AddUpdateItemCategory]
GO
 
CREATE PROCEDURE [dbo].[USP_AddUpdateItemCategory]   
 (
	@Name varchar(100),
	@Alias varchar(100),
	@Id int=0
 )     
AS   
BEGIN 	
	if (@Id<>0)
	Begin
		update ledb_kategorimenu
		set alias=@Alias,nama_kategori=@Name where id=@id	
	END
	else
	BEGIN 
		Insert into ledb_kategorimenu(alias,nama_kategori)
		values(@Alias,@Name)	 
	END
	   
END  