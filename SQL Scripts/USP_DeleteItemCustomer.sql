

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_DeleteCustomer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_DeleteCustomer
GO
  SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
CREATE PROCEDURE [dbo].USP_DeleteCustomer   
(
	@Id BigInt=0
 )     
AS   
BEGIN
	if exists(Select * from ledb_customer with(nolock) where id_generator=@Id)
	Begin
		Delete from ledb_customer
		where id_generator=@Id	
	END
	   
END  