

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetItemRecommendDetails') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetItemRecommendDetails
GO
 
CREATE PROCEDURE [dbo].USP_GetItemRecommendDetails   
 (
	@id					BigInt	=	0
 )     
AS   
BEGIN 	
	
		Select	* from [ledb_menu] C With(nolock)	Where	menu_id_generator	= @id 	
	   
END  