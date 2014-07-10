

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_AddUpdateFAQ]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_AddUpdateFAQ
GO
 SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
 
CREATE PROCEDURE [dbo].USP_AddUpdateFAQ   
 (
@Id				Int	=	0,

@EngQuestion	VarChar(4000),
@EngAnswer		VarChar(4000),

@IndQuestion	VarChar(4000),
@IndAnswer		VarChar(4000),

@Icon			VarChar(100)='',
@urutan			VarChar(100)=1,
@IsPrimary		Int=1,

@Count			Int=0
 )     
AS   
BEGIN 	

	if (@Id<>0)
	Begin
		Update ledb_faq
		Set 		
			tanya				=	@IndQuestion,
			jawab				=	@IndAnswer,
			en_tanya			=	@EngQuestion,
			en_jawab			=	@EngAnswer,
			icon				=	@Icon,
			urutan				=	@urutan,
			is_primary			=	@IsPrimary,
			count				=	@Count			
			Where id			=	@id	
		
	END
	Else
	BEGIN 
		Insert into ledb_faq(	tanya,			jawab,		en_tanya,		en_jawab,	icon,	urutan,		is_primary, count)
					values	(	@IndQuestion,	@IndAnswer,	@EngQuestion,	@EngAnswer,	@Icon,	@urutan,	@IsPrimary, @Count)	 
	END
	   
END  