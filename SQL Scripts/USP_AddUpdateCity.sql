

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_AddUpdateCity]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_AddUpdateCity
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
 
CREATE PROCEDURE [dbo].USP_AddUpdateCity   
 (	
	@Id				int,
    @Name			VarChar(100),
    @Alias			VarChar(100)='',
    @Province       Varchar(100)
 )     
AS   
BEGIN 	

	SET QUOTED_IDENTIFIER OFF

	IF (@Id='-1')
	Begin
		insert into ledb_kota(alias,nama_kota,alias_daerah)
		values(@Alias,@Name,@Province)
			
				
	END
	Else
	BEGIN 
	
		Update ledb_kota
		set nama_kota=@Name,alias_daerah=@Province where id=@Id															 
		
	END
	   
END
