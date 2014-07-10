

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_DeleteFAQ]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_DeleteFAQ
GO
  SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
CREATE PROCEDURE [dbo].USP_DeleteFAQ   
(
	@Id int=0
 )     
AS   
BEGIN 	
	if Exists(Select 1 from ledb_faq with(nolock) where id=@Id)
	Begin
		Delete from ledb_faq Where id=@Id	
	END
	   
END