

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_DeleteItemRecommend]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_DeleteItemRecommend
GO
  SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
CREATE PROCEDURE [dbo].USP_DeleteItemRecommend   
(
	@Id BigInt=0
 )     
AS   
BEGIN
	if exists(Select * from [ledb_menu] with(nolock) where menu_id_generator=@Id)
	Begin
		update [ledb_menu] Set is_recommended =0 where menu_id_generator=@Id	
	END
	   
END  