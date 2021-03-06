

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetItemTags') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetItemTags
GO
 
CREATE PROCEDURE [dbo].USP_GetItemTags   
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
	alias				varchar(100),
	nama_tag			varchar(100)
	)
	
	insert into		#temp(	id, alias, nama_tag)
		select				id, alias, nama_tag
		from 
		ledb_menutags With (NoLock)
		where	id			like ('%' + @piSearchFilter + '%') OR 				
				alias		like ('%' + @piSearchFilter + '%') OR
				nama_tag	like ('%' + @piSearchFilter + '%') 
		ORDER BY 
			CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 1 THEN id END ASC,
			CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 0 THEN id END DESC,
			
			CASE WHEN @piSortedBy = 'alias' AND @piSortDirection = 1 THEN alias END ASC,
			CASE WHEN @piSortedBy = 'alias' AND @piSortDirection = 0 THEN alias END DESC,
			
			CASE WHEN @piSortedBy = 'nama_tag' AND @piSortDirection = 1 THEN nama_tag END ASC,
			CASE WHEN @piSortedBy = 'nama_tag' AND @piSortDirection = 0 THEN nama_tag END DESC
						

	Select @TotalCount=COUNT(*) from #temp				
	SELECT @TotalCount as TotalCount,* FROM #temp where RowNum between @vFirstId and @vLastId
	
	drop table #temp
				 
	
	   
END  