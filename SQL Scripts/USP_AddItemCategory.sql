

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_AddItemCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_AddItemCategory]
GO
 
CREATE PROCEDURE [dbo].[USP_AddItemCategory]   
 (
	@Name varchar(100),
	@Alias varchar(100)
 )     
AS   
BEGIN 	
	Insert into ledb_kategorimenu(alias,nama_kategori)
	values(@Alias,@Name)	 
	
	   
END  