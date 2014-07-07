

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetCityForProvince') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetCityForProvince
GO
 
CREATE PROCEDURE [dbo].USP_GetCityForProvince   
 (
	@ProvinceAlias		varchar(100)='-1'
 )     
AS   
BEGIN 	
	if(@ProvinceAlias='-1')
	BEGIN
		SELECT [alias],[nama_kota] FROM [ledb_kota] with(nolock)
	END
	ELSE
	BEGIN
		SELECT [alias],[nama_kota] FROM [ledb_kota] with(nolock) where alias_daerah=@ProvinceAlias
	END   
END  