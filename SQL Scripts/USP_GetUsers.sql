

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetUsers') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetUsers
GO
 
CREATE PROCEDURE [dbo].USP_GetUsers   
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
	
	create table #temp(
	RowNum			int identity,
	ID				int,
	nama_lengkap	varchar(100),
	last_login		DateTime	
	)
	
	insert into #temp(ID,nama_lengkap, last_login)
	select id,nama_lengkap, last_login  from ledb_admin with(nolock)	
	where nama_lengkap like ('%' + @piSearchFilter + '%') OR username like ('%' + @piSearchFilter + '%')
	ORDER BY 
					CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 1 THEN id END ASC,
					CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 0 THEN id END DESC,
					
					CASE WHEN @piSortedBy = 'nama_lengkap' AND @piSortDirection = 1 THEN nama_lengkap END ASC,
					CASE WHEN @piSortedBy = 'nama_lengkap' AND @piSortDirection = 0 THEN nama_lengkap END DESC,
					
					CASE WHEN @piSortedBy = 'last_login' AND @piSortDirection = 1 THEN last_login END ASC,
					CASE WHEN @piSortedBy = 'last_login' AND @piSortDirection = 0 THEN last_login END DESC
					

	Select @TotalCount=COUNT(*) from #temp				
	SELECT @TotalCount as TotalCount,* FROM #temp where RowNum between @vFirstId and @vLastId
	
	drop table #temp
				 
	
	   
END  