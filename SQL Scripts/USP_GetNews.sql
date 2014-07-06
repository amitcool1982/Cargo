

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetNews') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetNews
GO
 
CREATE PROCEDURE [dbo].USP_GetNews   
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
	id					bigint,
	en_judul			nvarchar(510),
	count				int
	)
	
	insert into #temp(id, en_judul, count )
		select id, en_judul, count 
		from 
		ledb_berita		With(nolock)
		where	id				like ('%' + @piSearchFilter + '%') OR 
				en_judul		like ('%' + @piSearchFilter + '%') OR
				count			like ('%' + @piSearchFilter + '%') 
		ORDER BY 
						CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 1 THEN id END ASC,
						CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 0 THEN id END DESC,
						
						CASE WHEN @piSortedBy = 'en_judul' AND @piSortDirection = 1 THEN en_judul END ASC,
						CASE WHEN @piSortedBy = 'en_judul' AND @piSortDirection = 0 THEN en_judul END DESC,
						
						CASE WHEN @piSortedBy = 'count' AND @piSortDirection = 1 THEN count END ASC,
						CASE WHEN @piSortedBy = 'count' AND @piSortDirection = 0 THEN count END DESC
						

	Select @TotalCount=COUNT(*) from #temp				
	SELECT @TotalCount as TotalCount,* FROM #temp where RowNum between @vFirstId and @vLastId
	
	drop table #temp
				 
	
	   
END  