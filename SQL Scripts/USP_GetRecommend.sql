

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_GetRecommend]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GetRecommend]
GO
 
CREATE PROCEDURE [dbo].[USP_GetRecommend]   
 (
	@piPageSize INT = 20,
	@piPageNumber INT = 1,
	@piSortedBy varchar(50)='id',
	@piSearchFilter varchar(100)='',
	@piSortDirection int=1
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
	Alias_Menu	varchar(100),
	Nama_Menu	varchar(100),
	Category	varchar(100)
	)
	
	 
	
	insert into #temp(ID, Alias_Menu, Nama_Menu)
		Select [id], [alias_menu], [Nama_Menu] FROM [ledb_menu] with(nolock)
		where alias_menu like ('%' + @piSearchFilter + '%') OR Nama_Menu like ('%' + @piSearchFilter + '%')
		ORDER BY 
						CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 1 THEN id END ASC,
						CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 0 THEN id END DESC,
						CASE WHEN @piSortedBy = 'alias_menu' AND @piSortDirection = 1 THEN alias_menu END ASC,
						CASE WHEN @piSortedBy = 'alias_menu' AND @piSortDirection = 0 THEN alias_menu END DESC,
						CASE WHEN @piSortedBy = 'Nama_Menu' AND @piSortDirection = 1 THEN Nama_Menu END ASC,
						CASE WHEN @piSortedBy = 'Nama_Menu' AND @piSortDirection = 0 THEN Nama_Menu END DESC
						

	Select @TotalCount=COUNT(*) from #temp				
	SELECT @TotalCount as TotalCount,* FROM #temp where RowNum between @vFirstId and @vLastId
	
	drop table #temp
				 
	
	   
END  