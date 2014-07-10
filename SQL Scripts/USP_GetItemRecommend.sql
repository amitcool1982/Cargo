

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_GetItemRecommend]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetItemRecommend
GO
 
CREATE PROCEDURE [dbo].USP_GetItemRecommend   
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
	RowNum		int identity,
	ID			int,
	[menu_id_generator] [nvarchar](100) NULL,
	[id_vendors] [nvarchar](255) NULL,
	[alias_menu] [nvarchar](255) NULL,
	[nama_menu] [nvarchar](255) NULL,
	[deskripsi_menu] [nvarchar](max) NULL,
	[media_photo] [nvarchar](255) NULL,
	[harga_menu] [int] NULL,
	[kategori_menu] [nvarchar](100) NULL,
	[tags] [nvarchar](max) NULL,
	[is_recommended] [int] NULL,
	[last_update] [datetime] NULL,
	nama_vendors [nvarchar](255) NULL,
	Category [nvarchar](100) NULL
	)
	
	 
	 
	insert into #temp(	[id],		menu_id_generator,		id_vendors,			alias_menu,			nama_menu,		deskripsi_menu,		media_photo,		harga_menu,		kategori_menu,		tags,		is_recommended,		last_update,	nama_vendors,			Category)
		select			Item.[id], Item.menu_id_generator,	Item.id_vendors,	Item.alias_menu,	Item.nama_menu, Item.deskripsi_menu, Item.media_photo, Item.harga_menu, Item.kategori_menu, Item.tags, Item.is_recommended, Item.last_update, Vendors.nama_vendors, ItemCat.nama_kategori
		from 
		ledb_menu			Item	With(nolock)	Inner Join
		ledb_vendors		Vendors	With(nolock)	On Item.id_vendors = Vendors.id_vendors_generator	Inner Join
		ledb_kategorimenu	ItemCat With(nolock)	On Item.kategori_menu = ItemCat.alias
		Where	is_recommended = 1
					And
				(
				Item.id			like ('%' + @piSearchFilter + '%') OR 
				alias_menu	like ('%' + @piSearchFilter + '%') OR 
				Nama_Menu	like ('%' + @piSearchFilter + '%')
				)
		ORDER BY 
		CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 1 THEN Item.id END ASC,
		CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 0 THEN Item.id END DESC,
		
		CASE WHEN @piSortedBy = 'alias_menu' AND @piSortDirection = 1 THEN alias_menu END ASC,
		CASE WHEN @piSortedBy = 'alias_menu' AND @piSortDirection = 0 THEN alias_menu END DESC,
		
		CASE WHEN @piSortedBy = 'Nama_Menu' AND @piSortDirection = 1 THEN Nama_Menu END ASC,
		CASE WHEN @piSortedBy = 'Nama_Menu' AND @piSortDirection = 0 THEN Nama_Menu END DESC
	 
	
	--insert into #temp(	[id],		menu_id_generator,		id_vendors,			alias_menu,			nama_menu,		deskripsi_menu,		media_photo,		harga_menu,		kategori_menu,		tags,		is_recommended,		last_update,	nama_vendors,			Category)
	--	select			Item.[id], Item.menu_id_generator,	Item.id_vendors,	Item.alias_menu,	Item.nama_menu, Item.deskripsi_menu, Item.media_photo, Item.harga_menu, Item.kategori_menu, Item.tags, Item.is_recommended, Item.last_update, Vendors.nama_vendors, ItemCat.nama_kategori		
	--	Where	is_recommended = 1
	--				And
	--			(
	--			id			like ('%' + @piSearchFilter + '%') OR 
	--			alias_menu	like ('%' + @piSearchFilter + '%') OR 
	--			Nama_Menu	like ('%' + @piSearchFilter + '%')
	--			)
	--	ORDER BY 
	--					CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 1 THEN id END ASC,
	--					CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 0 THEN id END DESC,
						
	--					CASE WHEN @piSortedBy = 'alias_menu' AND @piSortDirection = 1 THEN alias_menu END ASC,
	--					CASE WHEN @piSortedBy = 'alias_menu' AND @piSortDirection = 0 THEN alias_menu END DESC,
						
	--					CASE WHEN @piSortedBy = 'Nama_Menu' AND @piSortDirection = 1 THEN Nama_Menu END ASC,
	--					CASE WHEN @piSortedBy = 'Nama_Menu' AND @piSortDirection = 0 THEN Nama_Menu END DESC
						

	Select @TotalCount=COUNT(*) from #temp				
	SELECT @TotalCount as TotalCount,* FROM #temp where RowNum between @vFirstId and @vLastId
	
	drop table #temp
				 
	
	   
END  