

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_AddUpdateItemTagData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_AddUpdateItemTagData
GO
 SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
 
CREATE PROCEDURE [dbo].USP_AddUpdateItemTagData   
 (
	@Name varchar(100),
	@Alias varchar(100),
	@Id int=0
 )     
AS   
BEGIN 	


	if (@Id<>0)
	Begin
		update [ledb_menutags]
		set alias=@Alias,nama_tag=@Name where id=@id	
	END
	else
	BEGIN 
		Insert into [ledb_menutags](alias,nama_tag)
		values(@Alias,@Name)	 
	END
	   
END  