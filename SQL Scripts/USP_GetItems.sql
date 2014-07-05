

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
	RowNum				int identity,
	menu_id_generator	bigint,
	nama_vendors		varchar(100),
	nama_menu			varchar(100),
	harga_menu			varchar(100)
	)
	
	insert into #temp(menu_id_generator, nama_vendors, nama_menu, harga_menu)
		select menu_id_generator, nama_vendors, nama_menu, harga_menu 
		from 
		ledb_menu		Item	With(nolock)	Inner Join
		ledb_vendors	Vendors	With(nolock)	On Item.id_vendors = Vendors.id_vendors_generator
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