

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[USP_GetVendors]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GetVendors]
GO
 
CREATE PROCEDURE [dbo].[USP_GetVendors]   
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
	RowNum int identity,
	[id] [int] NOT NULL,
	[id_vendors_generator] [nvarchar](255) NULL,
	[alias_daerah] [nvarchar](100) NULL,
	[alias_kota] [nvarchar](100) NULL,
	[alias_vendors] [nvarchar](255) NULL,
	[nama_vendors] [nvarchar](255) NULL,
	[alamat_vendors] [nvarchar](max) NULL,
	[tlp_vendors] [nvarchar](15) NULL,
	[email_vendors] [nvarchar](255) NULL,
	[logo_vendors] [nvarchar](255) NULL,
	[banner_vendors] [nvarchar](255) NULL,
	[is_verified] [int] NULL,
	[last_updated] [datetime] NULL,
	)
	
	insert into #temp(id,id_vendors_generator,alias_daerah,alias_kota,alias_vendors,nama_vendors,alamat_vendors,tlp_vendors,email_vendors,logo_vendors,banner_vendors,is_verified,last_updated)
	select [id]
      ,[id_vendors_generator]
      ,[alias_daerah]
      ,[alias_kota]
      ,[nama_vendors]
      ,[nama_vendors]
      ,[alamat_vendors]
      ,[tlp_vendors]
      ,[email_vendors]
      ,[logo_vendors]
      ,[banner_vendors]
      ,[is_verified]
      ,[last_updated] from ledb_vendors with(nolock)	
	where alias_vendors like ('%' + @piSearchFilter + '%')
	ORDER BY 
					CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 1 THEN id END ASC,
					CASE WHEN @piSortedBy = 'id' AND @piSortDirection = 0 THEN id END DESC,
					CASE WHEN @piSortedBy = 'nama_vendors' AND @piSortDirection = 1 THEN alias_vendors END ASC,
					CASE WHEN @piSortedBy = 'nama_vendors' AND @piSortDirection = 0 THEN alias_vendors END DESC
					

	Select @TotalCount=COUNT(*) from #temp				
	SELECT @TotalCount as TotalCount,* FROM #temp where RowNum between @vFirstId and @vLastId
	
	drop table #temp
				 
	
	   
END  