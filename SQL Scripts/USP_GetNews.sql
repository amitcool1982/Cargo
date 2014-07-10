

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetNews') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetNews
GO
 
CREATE PROCEDURE [dbo].USP_GetNews   
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
	RowNum					int identity,
	id						int,
	alias_encrypt			NVarChar(255),

	en_alias				NVarChar(255),
	en_judul				NVarChar(255),
	en_isi					NVarChar(4000),

	alias					NVarChar(255),
	judul					NVarChar(255),
	isi						NVarChar(4000),

	author					NVarChar(255),
	is_schedule				Int,	
	post_date				DateTime,
	gambar					Varchar(255),
	is_online				Int,
	count					Int
	)
	

	
	insert into #temp(id, alias, alias_encrypt, judul, isi, en_alias, en_judul, en_isi, post_date, gambar, author, is_online, is_schedule, count )
		select id, alias, alias_encrypt, judul, isi, en_alias, en_judul, en_isi, post_date, gambar, author, is_online, is_schedule, count
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