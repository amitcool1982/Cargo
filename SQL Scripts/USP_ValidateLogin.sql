

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_ValidateLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ValidateLogin]
GO
 SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
CREATE PROCEDURE [dbo].[USP_ValidateLogin]   
(  
 @UserName  VARCHAR(100),   
 @Password  VARCHAR(100)
)      
AS      
BEGIN 	

if exists(select 1 from ledb_admin with(nolock) where Username	=	@UserName and Password	=	@Password)
	Begin
		Update ledb_admin	
		Set last_login = GETDATE() Where 
		Username	=	@UserName	and 
		Password	=	@Password
	End
	
	Select nama_lengkap as Name, is_super as IsSuper,* from ledb_admin with(nolock) Where username	=	@UserName and password	=	@Password    
	
END  