
IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_RecommendItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RecommendItem]
GO
  SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
CREATE PROCEDURE [dbo].[USP_RecommendItem]   
(
	@Id int=0
 )     
AS   
BEGIN 	
	if exists(Select 1 from ledb_promo_menu with(nolock) where id=@Id)
	Begin
		update ledb_menu
		set is_recommended=1 where id=@id
			
	END
	   
END  