

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_GetPOS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetPOS
GO
 
CREATE PROCEDURE [dbo].USP_GetPOS   
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
	RowNum				int identity,
	id_agen_generator	nvarchar(510),
	daerah				nvarchar(510),
	kota				nvarchar(510),
	name				nvarchar(510),
	tipe_lokasi			nvarchar(200),
	alamat_lokasi		nvarchar(4000),
	pos_status			nvarchar(96)
	)
	
	insert into #temp(id_agen_generator, daerah,kota, name, tipe_lokasi, alamat_lokasi, pos_status)
				select id_agen_generator, prov.nama_daerah,City.nama_kota, name, tipe_lokasi, alamat_lokasi, pos_status from 
				ledb_agen	Age		With(nolock)	Inner Join
				ledb_daerah	Prov	With(nolock)	On age.daerah	= prov.alias Inner Join
				ledb_kota	City	With(nolock)	On age.kota		= City.alias 
				Where 
				id_agen_generator	like ('%' + @piSearchFilter + '%') OR 
				prov.nama_daerah	like ('%' + @piSearchFilter + '%') OR 
				City.nama_kota		like ('%' + @piSearchFilter + '%') OR 
				name				like ('%' + @piSearchFilter + '%') OR 
				tipe_lokasi			like ('%' + @piSearchFilter + '%') OR 
				alamat_lokasi		like ('%' + @piSearchFilter + '%') OR 
				pos_status			like ('%' + @piSearchFilter + '%')
				ORDER BY 
				CASE WHEN @piSortedBy = 'id_agen_generator' AND @piSortDirection = 1 THEN id_agen_generator END ASC,
				CASE WHEN @piSortedBy = 'id_agen_generator' AND @piSortDirection = 0 THEN id_agen_generator END DESC,
				
				CASE WHEN @piSortedBy = 'daerah' AND @piSortDirection = 1 THEN prov.nama_daerah END ASC,
				CASE WHEN @piSortedBy = 'daerah' AND @piSortDirection = 0 THEN prov.nama_daerah END DESC,
				
				CASE WHEN @piSortedBy = 'kota' AND @piSortDirection = 1 THEN City.nama_kota END ASC,
				CASE WHEN @piSortedBy = 'kota' AND @piSortDirection = 0 THEN City.nama_kota END DESC,
				
				CASE WHEN @piSortedBy = 'name' AND @piSortDirection = 1 THEN name END ASC,
				CASE WHEN @piSortedBy = 'name' AND @piSortDirection = 0 THEN name END DESC,
				
				CASE WHEN @piSortedBy = 'tipe_lokasi' AND @piSortDirection = 1 THEN tipe_lokasi END ASC,
				CASE WHEN @piSortedBy = 'tipe_lokasi' AND @piSortDirection = 0 THEN tipe_lokasi END DESC,
				
				CASE WHEN @piSortedBy = 'alamat_lokasi' AND @piSortDirection = 1 THEN alamat_lokasi END ASC,
				CASE WHEN @piSortedBy = 'alamat_lokasi' AND @piSortDirection = 0 THEN alamat_lokasi END DESC,
				
				CASE WHEN @piSortedBy = 'pos_status' AND @piSortDirection = 1 THEN pos_status END ASC,
				CASE WHEN @piSortedBy = 'pos_status' AND @piSortDirection = 0 THEN pos_status END DESC
					

	Select @TotalCount=COUNT(*) from #temp				
	SELECT @TotalCount as TotalCount,* FROM #temp where RowNum between @vFirstId and @vLastId
	
	drop table #temp
				 
	
	   
END
