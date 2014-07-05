

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_DeleteItemCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DeleteItemCategory]
GO
 
CREATE PROCEDURE [dbo].[USP_DeleteItemCategory]   
(
	@Id int=0
 )     
AS   
BEGIN 	
	if exists(Select 1 from ledb_kategorimenu with(nolock) where id=@Id)
	Begin
		Delete from ledb_kategorimenu
		where id=@Id	
	END
	   
END  