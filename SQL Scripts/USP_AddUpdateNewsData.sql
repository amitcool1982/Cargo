

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_AddUpdateNewsData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_AddUpdateNewsData
GO
 SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
 
CREATE PROCEDURE [dbo].USP_AddUpdateNewsData   
 (
@Id							int=0,	

@IndTitleEncrypt			VarChar(255),

@EngTitle					VarChar(255),
@EngURLAlias				VarChar(255),
@EngContent					VarChar(4000),

@IndTitle					VarChar(255),
@IndURLAlias				VarChar(255),
@IndContent					VarChar(255),

@Author						VarChar(255),
@IsSchedule					Int,	
@PostDate					DateTime,
@ImageUrl					Varchar(255),
@IsOnline					Int,
@Count						Int
 )     
AS   
BEGIN 	

	SET QUOTED_IDENTIFIER OFF

	if (@Id<>0)
	Begin
		Update ledb_berita
		Set 
			en_alias			=	@EngTitle,
			alias_encrypt		=	@IndTitleEncrypt,
			en_judul			=	@EngURLAlias,
			en_isi				=	@EngContent,

			alias				=	@IndTitle,
			judul				=	@IndURLAlias,
			isi					=	@IndContent,

			author				=	@Author,
			is_schedule			=	@IsSchedule,	
			post_date			=	@PostDate,
			gambar				=	@ImageUrl,
			is_online			=	@IsOnline,
			[count]				=	@Count				
			Where id			=	@id	
		
	END
	Else
	BEGIN 
		Insert into ledb_berita(alias,			alias_encrypt,		judul,			isi,			en_alias,	en_judul,		en_isi,			post_date, gambar,	author,	is_online, is_schedule, [count])
						values(@IndTitle,		@IndTitleEncrypt,	@IndURLAlias,	@IndContent,	@EngTitle,	@EngURLAlias,	@EngContent,	@PostDate, @ImageUrl,	@Author,@IsOnline,	@IsSchedule, @Count)	 
	END
	   
END  