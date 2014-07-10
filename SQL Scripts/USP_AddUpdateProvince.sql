

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_AddUpdateProvince]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_AddUpdateProvince
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
 
CREATE PROCEDURE [dbo].USP_AddUpdateProvince   
 (	
	@Id				int,
    @Name			VarChar(100),
    @Alias			VarChar(100)=''
 )     
AS   
BEGIN 	

	IF (@Id='-1')
	Begin
		insert into ledb_daerah(nama_daerah,alias)
		values(@Name,@Alias)
			
				
	END
	Else
	BEGIN 
	
		Update ledb_daerah
		set nama_daerah=@Name where id=@Id															 
		
	END
	   
END
