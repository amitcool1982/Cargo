

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_AddUpdateItemPromotion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_AddUpdateItemPromotion
GO
 SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
 GO
CREATE PROCEDURE [dbo].USP_AddUpdateItemPromotion   
 (	
	@ItemId				nvarchar(200),
    @promoType			VarChar(54),
    @description		nVarChar(4000),
    @discount			Int,
    @startPromoAt		DateTime,
    @endPromoAt			DateTime,
    @Id					Int
 )     
AS   
BEGIN 	

	SET QUOTED_IDENTIFIER OFF

	IF (@Id<>0)
	Begin
		Update ledb_promo_menu
		Set 
		id_menu				=	@ItemId
	  ,	[tipe_promo]		=	@promoType
      ,	[diskon]			=	@discount
      ,	[deskripsi_promo]	=	@description
      ,	[mulai_promo]		=	@startPromoAt
      ,	[akhir_promo]		=	@endPromoAt
		Where id	=	@id	
				
	END
	Else
	BEGIN 
	
		Insert into ledb_promo_menu(id_menu,	[tipe_promo],	[diskon],	[deskripsi_promo],	[mulai_promo],	[akhir_promo])
							values(@ItemId,		@promoType,		@discount, @description,		@startPromoAt,	@endPromoAt)																 
		
	END
	   
END
