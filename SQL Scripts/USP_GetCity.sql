

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetCity') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetCity
GO
 
CREATE PROCEDURE [dbo].USP_GetCity   
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
	RowNum			int identity,
	ID				int,
	nama_daerah		nvarchar(200),
	nama_kota		nvarchar(510)	
	)
	
	insert into #temp(ID,nama_daerah, nama_kota)
	select			City.id,nama_daerah, nama_kota  from 
	ledb_kota	City	with(nolock)	Inner Join
	ledb_daerah	Prov	with(nolock)	On	City.alias_daerah	=	prov.alias 
	where	City.id				like ('%' + @piSearchFilter + '%') OR 
			nama_daerah		like ('%' + @piSearchFilter + '%') OR 
			nama_kota		like ('%' + @piSearchFilter + '%')
	ORDER BY 
					CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 1 THEN City.id END ASC,
					CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 0 THEN City.id END DESC,
					
					CASE WHEN @piSortedBy = 'nama_daerah' AND @piSortDirection = 1 THEN nama_daerah END ASC,
					CASE WHEN @piSortedBy = 'nama_daerah' AND @piSortDirection = 0 THEN nama_daerah END DESC,
					
					CASE WHEN @piSortedBy = 'nama_kota' AND @piSortDirection = 1 THEN nama_kota END ASC,
					CASE WHEN @piSortedBy = 'nama_kota' AND @piSortDirection = 0 THEN nama_kota END DESC
					

	Select @TotalCount=COUNT(*) from #temp				
	SELECT @TotalCount as TotalCount,* FROM #temp where RowNum between @vFirstId and @vLastId
	
	drop table #temp
				 
	
	   
END  