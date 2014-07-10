

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_DeleteNewsData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_DeleteNewsData
GO
  SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
CREATE PROCEDURE [dbo].USP_DeleteNewsData   
(
	@Id int=0
 )     
AS   
BEGIN 	
	if Exists(Select 1 from ledb_berita with(nolock) where id=@Id)
	Begin
		Delete from ledb_berita Where id=@Id	
	END
	   
END  