

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_AddUpdateUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_AddUpdateUser]
GO
 SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
 
CREATE PROCEDURE [dbo].[USP_AddUpdateUser]   
 (
	@Name varchar(100),
	@Password varchar(100),
	@Alias varchar(100),
	@IsSuper int,
	@Id int=0
 )     
AS   
BEGIN 	
		
	if (@Id<>0)
	Begin
		if(@Password='') 
		BEGIN
			Select @Password	=	password from ledb_admin with(nolock) where id=@Id
		END
		
		update ledb_admin
		set 
		username		=	@Alias,
		nama_lengkap	=	@Name,
		password		=	@password,
		is_super		=	@IsSuper
		 where id=@id	
	END
	else
	BEGIN 
	
		Insert into ledb_admin(username,	nama_lengkap,	is_super,	password)
						values(@Alias,		@Name,			@IsSuper,	@Password)	 
			
	END
	   
END  