

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_DeleteItemTagData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_DeleteItemTagData
GO
  SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
CREATE PROCEDURE [dbo].USP_DeleteItemTagData   
(
	@Id int=0
 )     
AS   
BEGIN 	
	if exists(Select 1 from [ledb_menutags] with(nolock) where id=@Id)
	Begin
		Delete from [ledb_menutags]
		where id=@Id	
	END
	   
END  