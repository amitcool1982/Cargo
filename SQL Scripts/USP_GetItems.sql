

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetItems') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetItems
GO
 
CREATE PROCEDURE [dbo].USP_GetItems   
 (
	@piPageSize			INT = 20,
	@piPageNumber		INT = 1,
	@piSortedBy			varchar(50)='menu_id_generator',
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
	RowNum	int identity,
	[id] [int] NOT NULL,
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
		where	menu_id_generator	like ('%' + @piSearchFilter + '%') OR 
				nama_vendors		like ('%' + @piSearchFilter + '%') OR
				nama_menu			like ('%' + @piSearchFilter + '%') OR
				harga_menu			like ('%' + @piSearchFilter + '%')
		ORDER BY 
						CASE WHEN @piSortedBy = 'menu_id_generator' AND @piSortDirection = 1 THEN menu_id_generator END ASC,
						CASE WHEN @piSortedBy = 'menu_id_generator' AND @piSortDirection = 0 THEN menu_id_generator END DESC,
						
						CASE WHEN @piSortedBy = 'nama_vendors' AND @piSortDirection = 1 THEN nama_vendors END ASC,
						CASE WHEN @piSortedBy = 'nama_vendors' AND @piSortDirection = 0 THEN nama_vendors END DESC,
						
						CASE WHEN @piSortedBy = 'nama_menu' AND @piSortDirection = 1 THEN nama_menu END ASC,
						CASE WHEN @piSortedBy = 'nama_menu' AND @piSortDirection = 0 THEN nama_menu END DESC,
						
						CASE WHEN @piSortedBy = 'harga_menu' AND @piSortDirection = 1 THEN harga_menu END ASC,
						CASE WHEN @piSortedBy = 'harga_menu' AND @piSortDirection = 0 THEN harga_menu END DESC
						

	Select @TotalCount=COUNT(*) from #temp				
	SELECT @TotalCount as TotalCount,* FROM #temp where RowNum between @vFirstId and @vLastId
	
	drop table #temp
				 
	
	   
END  