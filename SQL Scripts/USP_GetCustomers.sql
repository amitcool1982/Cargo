

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetCustomers') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetCustomers
GO
 
CREATE PROCEDURE [dbo].USP_GetCustomers   
 (
	@piPageSize				INT = 20,
	@piPageNumber			INT = 1,
	@piSortedBy				varchar(50)='id_generator',
	@piSearchFilter			varchar(100)='',
	@piSortDirection		int=1
 )     
AS   
BEGIN 	
	Declare @vFirstId INT, @vLastId INT
	Declare @TotalCount int
	
	if(@piSearchFilter = null) 
	BEGIN
		Select @piSearchFilter = ''
	END
 
	SELECT @vFirstId	=	@piPageNumber 
	SELECT @vLastId		=	(@vFirstId + @piPageSize) - 1
	
	create table #temp
	(
	RowNum			int identity,
	ID				bigint,
	email			nvarchar(510),
	nama_lengkap	nvarchar(510),
	telepon			nvarchar(30),
	kota			nvarchar(510),
	join_datetime	datetime,
	last_login		datetime
	)
	
	Insert into #temp(	ID,				Email, nama_lengkap, telepon, kota, join_datetime, last_login)
		Select			id_generator,	Email, nama_lengkap, telepon, K.nama_kota kota, join_datetime, last_login from ledb_customer C With(nolock) inner join ledb_kota k with(nolock) on k.alias=C.kota 	
		Where	id_generator	like ('%' + @piSearchFilter + '%') OR 
				Email			like ('%' + @piSearchFilter + '%') OR 
				nama_lengkap	like ('%' + @piSearchFilter + '%') OR 
				telepon			like ('%' + @piSearchFilter + '%') OR 
				kota			like ('%' + @piSearchFilter + '%') OR 
				join_datetime	like ('%' + @piSearchFilter + '%') OR 
				last_login		like ('%' + @piSearchFilter + '%')
		ORDER BY 
					CASE WHEN @piSortedBy = 'id_generator' AND @piSortDirection = 1 THEN id_generator END ASC,
					CASE WHEN @piSortedBy = 'id_generator' AND @piSortDirection = 0 THEN id_generator END DESC,
					
					CASE WHEN @piSortedBy = 'Email' AND @piSortDirection = 1 THEN Email END ASC,
					CASE WHEN @piSortedBy = 'Email' AND @piSortDirection = 0 THEN Email END DESC,
					
					CASE WHEN @piSortedBy = 'nama_lengkap' AND @piSortDirection = 1 THEN nama_lengkap END ASC,
					CASE WHEN @piSortedBy = 'nama_lengkap' AND @piSortDirection = 0 THEN nama_lengkap END DESC,
					
					CASE WHEN @piSortedBy = 'telepon' AND @piSortDirection = 1 THEN telepon END ASC,
					CASE WHEN @piSortedBy = 'telepon' AND @piSortDirection = 0 THEN telepon END DESC,
					
					CASE WHEN @piSortedBy = 'kota' AND @piSortDirection = 1 THEN kota END ASC,
					CASE WHEN @piSortedBy = 'kota' AND @piSortDirection = 0 THEN kota END DESC,
					
					CASE WHEN @piSortedBy = 'join_datetime' AND @piSortDirection = 1 THEN join_datetime END ASC,
					CASE WHEN @piSortedBy = 'join_datetime' AND @piSortDirection = 0 THEN join_datetime END DESC,
					
					CASE WHEN @piSortedBy = 'last_login' AND @piSortDirection = 1 THEN last_login END ASC,
					CASE WHEN @piSortedBy = 'last_login' AND @piSortDirection = 0 THEN last_login END DESC
					
	Select @TotalCount=COUNT(*) from #temp				
	SELECT @TotalCount as TotalCount,* FROM #temp where RowNum between @vFirstId and @vLastId
	
	drop table #temp
	   
END  