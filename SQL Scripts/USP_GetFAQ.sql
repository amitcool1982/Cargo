

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetFAQ') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetFAQ
GO
 
CREATE PROCEDURE [dbo].USP_GetFAQ   
 (
	@piPageSize				INT = 20,
	@piPageNumber			INT = 1,
	@piSortedBy				varchar(50)='id',
	@piSearchFilter			varchar(100)='',
	@piSortDirection		int=1
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
	
	create table #temp(
	RowNum			int identity,
	ID				int,
	tanya			nvarchar(4000),
	count			int	
	)
	
	Insert into #temp(ID,	tanya, count)
		Select id, tanya, count  from ledb_faq with(nolock)	
		Where	id			like ('%' + @piSearchFilter + '%') OR 
				tanya		like ('%' + @piSearchFilter + '%') OR 
				count		like ('%' + @piSearchFilter + '%')
		ORDER BY 
					CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 1 THEN id END ASC,
					CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 0 THEN id END DESC,
					
					CASE WHEN @piSortedBy = 'tanya' AND @piSortDirection = 1 THEN tanya END ASC,
					CASE WHEN @piSortedBy = 'tanya' AND @piSortDirection = 0 THEN tanya END DESC,
					
					CASE WHEN @piSortedBy = 'count' AND @piSortDirection = 1 THEN count END ASC,
					CASE WHEN @piSortedBy = 'count' AND @piSortDirection = 0 THEN count END DESC
					
	Select @TotalCount=COUNT(*) from #temp				
	SELECT @TotalCount as TotalCount,* FROM #temp where RowNum between @vFirstId and @vLastId
	
	drop table #temp
				 
	
	   
END  