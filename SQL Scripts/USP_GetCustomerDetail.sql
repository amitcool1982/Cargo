

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetCustomerDetail') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetCustomerDetail
GO
 
CREATE PROCEDURE [dbo].USP_GetCustomerDetail   
 (
	@id					BigInt	=	0
 )     
AS   
BEGIN 	
	
		Select	* from ledb_customer C With(nolock) inner join ledb_kota k with(nolock) on k.alias=C.kota 	
		Where	id_generator	= @id 	
	   
END  