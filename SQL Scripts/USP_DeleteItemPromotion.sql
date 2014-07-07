

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_DeleteItemPromotion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DeleteItemPromotion]
GO
  SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
CREATE PROCEDURE [dbo].[USP_DeleteItemPromotion]   
(
	@Id int=0
 )     
AS   
BEGIN 	
	if exists(Select 1 from ledb_promo_menu with(nolock) where id=@Id)
	Begin
		Delete from ledb_promo_menu
		where id=@Id	
	END
	   
END  