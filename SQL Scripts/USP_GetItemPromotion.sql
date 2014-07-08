

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetItemPromotion') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetItemPromotion
GO
 
CREATE PROCEDURE [dbo].USP_GetItemPromotion   
 (
	@piPageSize			INT = 20,
	@piPageNumber		INT = 1,
	@piSortedBy			varchar(50)='id',
	@piSearchFilter		varchar(100)='',
	@piSortDirection	int=1
 )     
AS   
BEGIN 	
	DECLARE @vFirstId INT, @vLastId INT
	declare @TotalCount int
	if(@piSearchFilter=null) 
	BEGIN
		Select @piSearchFilter=''
	END
 
	SELECT @vFirstId = @piPageNumber 
	SELECT @vLastId = (@vFirstId + @piPageSize) - 1
	
	create table #temp
	(
	RowNum				int identity,
	id					bigint,	
	id_menu             varchar(100),
	nama_menu			varchar(100),
	tipe_promo			varchar(100),
	deskripsi_promo     varchar(500),
	diskon				Int,
	mulai_promo			datetime,
	akhir_promo			datetime,
	IsRecommended       int
	)
	
	insert into		#temp(id,id_menu, nama_menu, tipe_promo,deskripsi_promo, diskon, mulai_promo, akhir_promo,IsRecommended)
		select ItemPromo.id,ItemPromo.id_menu, Item.nama_menu, Case When tipe_promo = 'od' then 'Only Discount' End,deskripsi_promo, diskon, mulai_promo, akhir_promo,is_recommended
		from 
		ledb_menu		Item		With(nolock)	Inner Join
		ledb_promo_menu	ItemPromo	With(nolock)	On Item.menu_id_generator = ItemPromo.id_menu
		where	ItemPromo.id	like ('%' + @piSearchFilter + '%') OR 				
				nama_menu		like ('%' + @piSearchFilter + '%') OR
				tipe_promo		like ('%' + @piSearchFilter + '%') OR 				
				diskon			like ('%' + @piSearchFilter + '%') OR
				mulai_promo		like ('%' + @piSearchFilter + '%') OR
				akhir_promo		like ('%' + @piSearchFilter + '%')
		ORDER BY 
						CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 1 THEN ItemPromo.id END ASC,
						CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 0 THEN ItemPromo.id END DESC,
						
						CASE WHEN @piSortedBy = 'nama_menu' AND @piSortDirection = 1 THEN nama_menu END ASC,
						CASE WHEN @piSortedBy = 'nama_menu' AND @piSortDirection = 0 THEN nama_menu END DESC,
						
						CASE WHEN @piSortedBy = 'tipe_promo' AND @piSortDirection = 1 THEN tipe_promo END ASC,
						CASE WHEN @piSortedBy = 'tipe_promo' AND @piSortDirection = 0 THEN tipe_promo END DESC,												
						
						CASE WHEN @piSortedBy = 'diskon' AND @piSortDirection = 1 THEN diskon END ASC,
						CASE WHEN @piSortedBy = 'diskon' AND @piSortDirection = 0 THEN diskon END DESC,
						
						CASE WHEN @piSortedBy = 'mulai_promo' AND @piSortDirection = 1 THEN mulai_promo END ASC,
						CASE WHEN @piSortedBy = 'mulai_promo' AND @piSortDirection = 0 THEN mulai_promo END DESC,												
						
						CASE WHEN @piSortedBy = 'akhir_promo' AND @piSortDirection = 1 THEN akhir_promo END ASC,
						CASE WHEN @piSortedBy = 'akhir_promo' AND @piSortDirection = 0 THEN akhir_promo END DESC
						

	Select @TotalCount=COUNT(*) from #temp				
	SELECT @TotalCount as TotalCount,* FROM #temp where RowNum between @vFirstId and @vLastId
	
	drop table #temp
				 
	
	   
END  