

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].USP_GetItemRecommendDetails') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].USP_GetItemRecommendDetails
GO
 
CREATE PROCEDURE [dbo].USP_GetItemRecommendDetails   
 (
	@id					BigInt	=	0
 )     
AS   
BEGIN 	
	
		select			Item.[id], Item.menu_id_generator,	Item.id_vendors,	Item.alias_menu,	Item.nama_menu, Item.deskripsi_menu, 
		
		--Item.media_photo, -- right now image not uploaded in database
		
		'/Images/no_picture_wide.png' As media_photo,
		
		Item.harga_menu, Item.kategori_menu, Item.tags, Item.is_recommended, Item.last_update, Vendors.nama_vendors, ItemCat.nama_kategori As Category
		from 
		ledb_menu			Item	With(nolock)	Inner Join
		ledb_vendors		Vendors	With(nolock)	On Item.id_vendors = Vendors.id_vendors_generator	Inner Join
		ledb_kategorimenu	ItemCat With(nolock)	On Item.kategori_menu = ItemCat.alias
		Where	Item.id	= @id 	
	   
END  