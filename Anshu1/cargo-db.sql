/*
File name: D:\PB\Freelancer\DotNet Admin Screen Shot\For Amit\cargo-db.sql
Creation date: 07/04/2014
Created by MySQL to MS SQL 6.5 [
--------------------------------------------------
More conversion tools at http://www.convert-in.com
*/

DROP DATABASE [cargo-db];
CREATE DATABASE [cargo-db];
GO
USE [cargo-db];
GO
SET QUOTED_IDENTIFIER ON;
GO

/*
Table structure for table 'ledb_admin'
*/

IF OBJECT_ID ('[dbo].[ledb_admin]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_admin];
GO
CREATE TABLE [dbo].[ledb_admin] (
	[id] INT IDENTITY,
	[nama_lengkap] NVARCHAR(255) ,
	[username] NVARCHAR(255) ,
	[password] NVARCHAR(255) ,
	[last_login] DATETIME,
	[is_super] INT,
	CONSTRAINT [PK_ledb_admin] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [username] ON [dbo].[ledb_admin]([username]) WHERE [username] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_admin'
*/

SET IDENTITY_INSERT [dbo].[ledb_admin] ON;
GO
INSERT INTO [dbo].[ledb_admin] ([id], [nama_lengkap], [username], [password], [last_login], [is_super]) VALUES (1, N'Extraordinary Admin', N'super_admin', N'$P$BBJkHhI81JXupsUC8JvTgUdn8lOi/L0', '20140609 23:51:28', 1);
GO

INSERT INTO [dbo].[ledb_admin] ([id], [nama_lengkap], [username], [password], [last_login], [is_super]) VALUES (2, N'Sahal Fahmi', N'admin', N'$P$BVh0X8rPs7/7kZoWeMytti/2xgdMq60', '20140528 05:34:18', 0);
GO

SET IDENTITY_INSERT [dbo].[ledb_admin] OFF;
GO

/*
Table structure for table 'ledb_agen'
*/

IF OBJECT_ID ('[dbo].[ledb_agen]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_agen];
GO
CREATE TABLE [dbo].[ledb_agen] (
	[id] INT IDENTITY,
	[id_agen_generator] NVARCHAR(255) ,
	[pos_status] NVARCHAR(48) ,
	[daerah] NVARCHAR(255) ,
	[kota] NVARCHAR(255) ,
	[tipe_lokasi] NVARCHAR(100) ,
	[alamat_lokasi] NVARCHAR(MAX),
	[tlp_lokasi] NVARCHAR(15) ,
	[handphone_lokasi] NVARCHAR(15) ,
	[fax_lokasi] NVARCHAR(15) ,
	[zipcode_lokasi] NVARCHAR(10) ,
	[luas_lokasi] INT,
	[ktp_p] NVARCHAR(50) ,
	[name] NVARCHAR(255) ,
	[gender_p] NVARCHAR(10) ,
	[tempat_lahir_p] NVARCHAR(255) ,
	[tgl_lahir_p] DATE,
	[kewarganegaraan_bio] NVARCHAR(255) ,
	[pernikahan_p] NVARCHAR(10) ,
	[agama_p] NVARCHAR(15) ,
	[address_bio] NVARCHAR(MAX),
	[province_bio] NVARCHAR(255) ,
	[city_bio] NVARCHAR(255) ,
	[zipcode_bio] NVARCHAR(15) ,
	[email_bio] NVARCHAR(100) ,
	[phone_bio] NVARCHAR(15) ,
	[handphone_p] NVARCHAR(15) ,
	[fax_bio] NVARCHAR(15) ,
	[company_sector] NVARCHAR(100) ,
	[tahun_bediri_c] INT,
	[owner_c] NVARCHAR(100) ,
	[referensi_nama] NVARCHAR(225) ,
	[referensi_email] NVARCHAR(225) ,
	[referensi_tlp] NVARCHAR(15) ,
	[referensi_status] NVARCHAR(50) ,
	[akta_perusahaan] NVARCHAR(255) ,
	[npwp] NVARCHAR(255) ,
	[siup] NVARCHAR(255) ,
	[ktp] NVARCHAR(255) ,
	[kk] NVARCHAR(255) ,
	[coordinate] NVARCHAR(255) ,
	[is_approved] INT,
	[approved_by] NVARCHAR(255) ,
	CONSTRAINT [PK_ledb_agen] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [id_agen_generator] ON [dbo].[ledb_agen]([id_agen_generator]) WHERE [id_agen_generator] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_agen'
*/

SET IDENTITY_INSERT [dbo].[ledb_agen] ON;
GO
INSERT INTO [dbo].[ledb_agen] ([id], [id_agen_generator], [pos_status], [daerah], [kota], [tipe_lokasi], [alamat_lokasi], [tlp_lokasi], [handphone_lokasi], [fax_lokasi], [zipcode_lokasi], [luas_lokasi], [ktp_p], [name], [gender_p], [tempat_lahir_p], [tgl_lahir_p], [kewarganegaraan_bio], [pernikahan_p], [agama_p], [address_bio], [province_bio], [city_bio], [zipcode_bio], [email_bio], [phone_bio], [handphone_p], [fax_bio], [company_sector], [tahun_bediri_c], [owner_c], [referensi_nama], [referensi_email], [referensi_tlp], [referensi_status], [akta_perusahaan], [npwp], [siup], [ktp], [kk], [coordinate], [is_approved], [approved_by]) VALUES (10, N'744775103996', N'company', N'dki_jakarta', N'jakarta_utara', N'Ruko', N'Jalan persemakmuran no.23 ruko no.12', N'021255601', NULL, NULL, N'42114', 100, '', N'CV Indah Mulia', '', '', '18991230 00:00:00', N'WNI', '', '', N'Jalan Kakilima no.12', N'dki_jakarta', N'jakarta_selatan', N'21144', N'contact@indahmulia.com', N'0213554600', '', '', N'Jual Beli Perhiasan', 2000, N'Jajang Drajat', '', NULL, NULL, '', '', '', '', N'files/pos_archive/744775103996_direktur_1399973233.jpg', NULL, N'-6.275061801871094, 106.79537412109381', 1, NULL);
GO

INSERT INTO [dbo].[ledb_agen] ([id], [id_agen_generator], [pos_status], [daerah], [kota], [tipe_lokasi], [alamat_lokasi], [tlp_lokasi], [handphone_lokasi], [fax_lokasi], [zipcode_lokasi], [luas_lokasi], [ktp_p], [name], [gender_p], [tempat_lahir_p], [tgl_lahir_p], [kewarganegaraan_bio], [pernikahan_p], [agama_p], [address_bio], [province_bio], [city_bio], [zipcode_bio], [email_bio], [phone_bio], [handphone_p], [fax_bio], [company_sector], [tahun_bediri_c], [owner_c], [referensi_nama], [referensi_email], [referensi_tlp], [referensi_status], [akta_perusahaan], [npwp], [siup], [ktp], [kk], [coordinate], [is_approved], [approved_by]) VALUES (11, N'153358004209668', N'personal', N'dki_jakarta', N'jakarta_selatan', N'Ruko', N'Jalan Mawar 5 Ruko Griya Merdeka no.21 Kebayoran Baru', N'0212201134', N'085774314938', NULL, N'322141', 100, N'1355219890517001', N'Ryan Gemilang', N'Pria', N'Jakarta', '18991230 00:00:00', N'WNI', N'Menikah', N'Islam', N'Jalan Ikan Pari Blok E2/12 RT.01/08 Perumahan PJMI Bintaro', N'dki_jakarta', N'jakarta_selatan', N'112445', N'ryan89@gmail.com', N'0212998214', N'085774314938', '', '', 0, '', NULL, NULL, NULL, NULL, '', '', '', N'files/pos_archive/153358004209668_ktp_1400061609.jpg', N'files/pos_archive/153358004209668_kartukeluarga_1400061609.jpg', N'-6.2426222394138415, 106.79631935472415', 1, NULL);
GO

INSERT INTO [dbo].[ledb_agen] ([id], [id_agen_generator], [pos_status], [daerah], [kota], [tipe_lokasi], [alamat_lokasi], [tlp_lokasi], [handphone_lokasi], [fax_lokasi], [zipcode_lokasi], [luas_lokasi], [ktp_p], [name], [gender_p], [tempat_lahir_p], [tgl_lahir_p], [kewarganegaraan_bio], [pernikahan_p], [agama_p], [address_bio], [province_bio], [city_bio], [zipcode_bio], [email_bio], [phone_bio], [handphone_p], [fax_bio], [company_sector], [tahun_bediri_c], [owner_c], [referensi_nama], [referensi_email], [referensi_tlp], [referensi_status], [akta_perusahaan], [npwp], [siup], [ktp], [kk], [coordinate], [is_approved], [approved_by]) VALUES (12, N'118697220998962', N'company', N'dki_jakarta', N'jakarta_selatan', N'Mall', N'fatmawati', N'021298391', NULL, NULL, N'21134', 50, '', N'totalit', '', '', '18991230 00:00:00', N'WNI', '', '', N'dutamas', N'dki_jakarta', N'jakarta_selatan', N'23311', N'hello@totalit.co.id', N'0213324234', '', '', N'it consultant', 2008, N'Ary', NULL, NULL, NULL, NULL, N'files/pos_archive/118697220998962_sertifikat_1400235035.jpg', '', '', N'118697220998962_direktur_1400235035.jpg', NULL, N'-6.248707011099456, 106.80050722729494', 0, NULL);
GO

SET IDENTITY_INSERT [dbo].[ledb_agen] OFF;
GO

/*
Table structure for table 'ledb_banner_assets'
*/

IF OBJECT_ID ('[dbo].[ledb_banner_assets]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_banner_assets];
GO
CREATE TABLE [dbo].[ledb_banner_assets] (
	[id] INT IDENTITY,
	[full_path] NVARCHAR(255) ,
	[is_active] INT,
	CONSTRAINT [PK_ledb_banner_assets] PRIMARY KEY ([id])
);
GO

/*
Dumping data for table 'ledb_banner_assets'
*/

SET IDENTITY_INSERT [dbo].[ledb_banner_assets] ON;
GO
INSERT INTO [dbo].[ledb_banner_assets] ([id], [full_path], [is_active]) VALUES (5, N'files/banner/Goin_Postal_Shipping_Service_Wesley_Chapel.jpg', 1);
GO

INSERT INTO [dbo].[ledb_banner_assets] ([id], [full_path], [is_active]) VALUES (8, N'files/banner/flydubai-has-launched-its-new-Cargo-division2.jpg', 1);
GO

INSERT INTO [dbo].[ledb_banner_assets] ([id], [full_path], [is_active]) VALUES (9, N'files/banner/02J25117.jpg', 0);
GO

INSERT INTO [dbo].[ledb_banner_assets] ([id], [full_path], [is_active]) VALUES (10, N'files/banner/business-customer-service.jpg', 1);
GO

SET IDENTITY_INSERT [dbo].[ledb_banner_assets] OFF;
GO

/*
Table structure for table 'ledb_berita'
*/

IF OBJECT_ID ('[dbo].[ledb_berita]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_berita];
GO
CREATE TABLE [dbo].[ledb_berita] (
	[id] INT IDENTITY,
	[alias] NVARCHAR(255) ,
	[alias_encrypt] NVARCHAR(255) ,
	[judul] NVARCHAR(255) ,
	[isi] NVARCHAR(MAX),
	[en_alias] NVARCHAR(255) ,
	[en_judul] NVARCHAR(255) ,
	[en_isi] NVARCHAR(MAX),
	[post_date] DATETIME,
	[gambar] NVARCHAR(255) ,
	[author] NVARCHAR(255) ,
	[is_online] INT,
	[is_schedule] INT,
	[count] INT,
	CONSTRAINT [PK_ledb_berita] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [alias_encrypt] ON [dbo].[ledb_berita]([alias_encrypt]) WHERE [alias_encrypt] IS NOT NULL;
GO
CREATE INDEX [alias] ON [dbo].[ledb_berita]([alias]) WHERE [alias] IS NOT NULL;
GO
CREATE INDEX [author] ON [dbo].[ledb_berita]([author]) WHERE [author] IS NOT NULL;
GO
CREATE INDEX [en_alias] ON [dbo].[ledb_berita]([en_alias]) WHERE [en_alias] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_berita'
*/

SET IDENTITY_INSERT [dbo].[ledb_berita] ON;
GO
INSERT INTO [dbo].[ledb_berita] ([id], [alias], [alias_encrypt], [judul], [isi], [en_alias], [en_judul], [en_isi], [post_date], [gambar], [author], [is_online], [is_schedule], [count]) VALUES (1, N'our-services-accross-nations-fast-and-secure', N'bz2dnsoufqghw548l9x7t1ikacm3e0vy6prj', N'Our services accross nations, fast and secure.', N'<p>Overflowing content Since Bootstrap doesn&#39;t know how much space the content in your navbar needs, you might run into issues with content wrapping into a second row. To resolve this, you can: Reduce the amount or width of navbar items. Hide certain navbar items at certain screen sizes using responsive utility classes. Change the point at which your navbar switches between collapsed and horizontal mode. Customize the @grid-float-breakpoint variable or add your own media query. Requires JavaScript If JavaScript is disabled and the viewport is narrow enough that the navbar collapses, it will be impossible to expand the navbar and view the content within the .navbar-collapse.</p>
', N'our-services-accross-nations-fast-and-secure', N'Our services accross nations, fast and secure.', N'<p>Overflowing content Since Bootstrap doesn&#39;t know how much space the content in your navbar needs, you might run into issues with content wrapping into a second row. To resolve this, you can: Reduce the amount or width of navbar items. Hide certain navbar items at certain screen sizes using responsive utility classes. Change the point at which your navbar switches between collapsed and horizontal mode. Customize the @grid-float-breakpoint variable or add your own media query. Requires JavaScript If JavaScript is disabled and the viewport is narrow enough that the navbar collapses, it will be impossible to expand the navbar and view the content within the .navbar-collapse.</p>
', '20140520 04:03:43', N'files/news/Creative-Wallpaper-Boat-in-a-Bottle-Wallpaper-HD-Wallpapers.jpg', N'super_admin', 1, 0, 0);
GO

INSERT INTO [dbo].[ledb_berita] ([id], [alias], [alias_encrypt], [judul], [isi], [en_alias], [en_judul], [en_isi], [post_date], [gambar], [author], [is_online], [is_schedule], [count]) VALUES (2, N'our-services-accross-nations-fast-and-secure-version-2', N'y7jnqud9csg30wrp45olmktzi6fxa8b1v2he', N'Our services accross nations, fast and secure (version 2).', N'<p>Of course the two submit buttons accomplish different things. Is there a way to find out in onSubmit which button was pressed, so later I could submit by doing thatButton.click()? Ideally I would like to not modify the code for the buttons, just have a pure-javascript addon that has this behavior. I know that FF has evnt.explicitOriginalTarget but I can&#39;t find anything for other browsers.</p>
', N'our-services-accross-nations-fast-and-secure-version-2', N'Our services accross nations, fast and secure (version 2).', N'<p>Of course the two submit buttons accomplish different things. Is there a way to find out in onSubmit which button was pressed, so later I could submit by doing thatButton.click()? Ideally I would like to not modify the code for the buttons, just have a pure-javascript addon that has this behavior. I know that FF has evnt.explicitOriginalTarget but I can&#39;t find anything for other browsers.</p>
', '20140520 04:04:20', N'files/news/Kandura2.jpg', N'super_admin', 1, 0, 0);
GO

INSERT INTO [dbo].[ledb_berita] ([id], [alias], [alias_encrypt], [judul], [isi], [en_alias], [en_judul], [en_isi], [post_date], [gambar], [author], [is_online], [is_schedule], [count]) VALUES (3, N'cargoexpress-views-every-client-as-a-vip-customer', N'xl6pwabhjt3gq40e5s8fy9znmk7uri1dc2ov', N'CargoExpress views every client as a VIP customer.', N'<p>CargoExpress is a Charter Bus Company that was established in 1990. Our main office is located in West Covina, California. We provide services for such groups as inbound tour groups from Asia and Europe, Large Corporate Events, local High Schools and Colleges, Senior Groups, and local tour companies. We currently have 18 newer model charter buses in our fleet. All of our vehicles are fitted with state of the art audio/video equipment. Our larger vehicles are also equipped with onboard lavatories. Currently, we have 3 mini-buses which seat between 21 to 23 passengers, 1 mini-bus which can seat up to 30 passengers, and 14 Luxury European style Tour buses that seat between 50 to 58 passengers. All of our vehicles are two-way radio dispatched and our Operations Department can be reached 24 hours a day, 7 days a week. All of our vehicles are also equipped with GPS locaters which allow us to determine exactly where any of them are with a couple clicks of a mouse.</p>
', N'cargoexpress-views-every-client-as-a-vip-customer', N'CargoExpress views every client as a VIP customer.', N'<p>CargoExpress is a Charter Bus Company that was established in 1990. Our main office is located in West Covina, California. We provide services for such groups as inbound tour groups from Asia and Europe, Large Corporate Events, local High Schools and Colleges, Senior Groups, and local tour companies. We currently have 18 newer model charter buses in our fleet. All of our vehicles are fitted with state of the art audio/video equipment. Our larger vehicles are also equipped with onboard lavatories. Currently, we have 3 mini-buses which seat between 21 to 23 passengers, 1 mini-bus which can seat up to 30 passengers, and 14 Luxury European style Tour buses that seat between 50 to 58 passengers. All of our vehicles are two-way radio dispatched and our Operations Department can be reached 24 hours a day, 7 days a week. All of our vehicles are also equipped with GPS locaters which allow us to determine exactly where any of them are with a couple clicks of a mouse.</p>
', '20140605 00:00:27', N'files/news/76.jpg', N'super_admin', 1, 0, 0);
GO

SET IDENTITY_INSERT [dbo].[ledb_berita] OFF;
GO

/*
Table structure for table 'ledb_contactus'
*/

IF OBJECT_ID ('[dbo].[ledb_contactus]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_contactus];
GO
CREATE TABLE [dbo].[ledb_contactus] (
	[id] INT IDENTITY,
	[tujuan] NVARCHAR(255) ,
	[nama] NVARCHAR(255) ,
	[email] NVARCHAR(100) ,
	[telepon] NVARCHAR(15) ,
	[pesan] NVARCHAR(MAX),
	[read] INT,
	CONSTRAINT [PK_ledb_contactus] PRIMARY KEY ([id])
);
GO
CREATE INDEX [tujuan] ON [dbo].[ledb_contactus]([tujuan]) WHERE [tujuan] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_contactus'
*/

SET IDENTITY_INSERT [dbo].[ledb_contactus] ON;
GO
INSERT INTO [dbo].[ledb_contactus] ([id], [tujuan], [nama], [email], [telepon], [pesan], [read]) VALUES (2, NULL, N'Sahal Fahmi', N'imaginer.me@gmail.com', N'085774314938', N'Testing Message Contact Us', 0);
GO

SET IDENTITY_INSERT [dbo].[ledb_contactus] OFF;
GO

/*
Table structure for table 'ledb_customer'
*/

IF OBJECT_ID ('[dbo].[ledb_customer]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_customer];
GO
CREATE TABLE [dbo].[ledb_customer] (
	[id] INT IDENTITY,
	[id_generator] NVARCHAR(50) ,
	[email] NVARCHAR(255) ,
	[password] NVARCHAR(255) ,
	[nama_lengkap] NVARCHAR(255) ,
	[tempat_lahir] NVARCHAR(100) ,
	[tanggal_lahir] DATE,
	[jenis_kelamin] NVARCHAR(10) ,
	[telepon] NVARCHAR(15) ,
	[handphone] NVARCHAR(15) ,
	[alamat] NVARCHAR(MAX),
	[provinsi] NVARCHAR(255) ,
	[kota] NVARCHAR(255) ,
	[kode_pos] NVARCHAR(10) ,
	[join_datetime] DATETIME,
	[last_login] DATETIME,
	CONSTRAINT [PK_ledb_customer] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [email] ON [dbo].[ledb_customer]([email]) WHERE [email] IS NOT NULL;
GO
CREATE UNIQUE INDEX [id_generator] ON [dbo].[ledb_customer]([id_generator]) WHERE [id_generator] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_customer'
*/

SET IDENTITY_INSERT [dbo].[ledb_customer] ON;
GO
INSERT INTO [dbo].[ledb_customer] ([id], [id_generator], [email], [password], [nama_lengkap], [tempat_lahir], [tanggal_lahir], [jenis_kelamin], [telepon], [handphone], [alamat], [provinsi], [kota], [kode_pos], [join_datetime], [last_login]) VALUES (1, N'3196367450280073', N'imaginer.me@gmail.com', N'$P$BBJkHhI81JXupsUC8JvTgUdn8lOi/L0', N'Sahal Fahmi', N'Serang', '19900524', N'Pria', N'0217442113', N'085691167995', N'Rempoa Indah Blok M7/12 RT.02/01', N'jakarta', N'jakarta_selatan', N'431324', '20140423 13:53:00', '20140507 23:23:49');
GO

INSERT INTO [dbo].[ledb_customer] ([id], [id_generator], [email], [password], [nama_lengkap], [tempat_lahir], [tanggal_lahir], [jenis_kelamin], [telepon], [handphone], [alamat], [provinsi], [kota], [kode_pos], [join_datetime], [last_login]) VALUES (2, N'72561508673743346', N'sahal_skl@yahoo.co.id', N'$P$BoNAwXeMsbOiucRry1LbmKUDw.LmuH0', N'Sahal', N'Serang', '18991230 00:00:00', N'Pria', N'0212354652', N'08565784444', N'sdasdasd RT.02/01', N'dki_jakarta', N'jakarta_utara', N'42114', '20140429 00:00:24', '18991230 00:00:00');
GO

INSERT INTO [dbo].[ledb_customer] ([id], [id_generator], [email], [password], [nama_lengkap], [tempat_lahir], [tanggal_lahir], [jenis_kelamin], [telepon], [handphone], [alamat], [provinsi], [kota], [kode_pos], [join_datetime], [last_login]) VALUES (3, N'15382340634378877', N'sahal@totalit.co.id', N'$P$Ban.PjjV4wv1Xn2PktNO6PLT0lSM.4.', N'Sahal Fahmi', N'Serang', '18991230 00:00:00', N'Pria', N'0212354652', N'08599955222', N'Jalan Samun bakrie no.16 Bintaro RT.02/08', N'dki_jakarta', N'jakarta_selatan', N'32114', '20140429 00:06:19', '18991230 00:00:00');
GO

SET IDENTITY_INSERT [dbo].[ledb_customer] OFF;
GO

/*
Table structure for table 'ledb_custompages'
*/

IF OBJECT_ID ('[dbo].[ledb_custompages]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_custompages];
GO
CREATE TABLE [dbo].[ledb_custompages] (
	[id] INT,
	[alias_dari_menu] NVARCHAR(255) ,
	[judul] NVARCHAR(255) ,
	[ringkasan] NVARCHAR(MAX),
	[isi_konten] NVARCHAR(MAX),
	[alias_banner_assets] NVARCHAR(255) ,
	[alias_template] NVARCHAR(255) ,
	CONSTRAINT [PK_ledb_custompages] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [alias_dari_menu] ON [dbo].[ledb_custompages]([alias_dari_menu]) WHERE [alias_dari_menu] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_custompages'
*/

INSERT INTO [dbo].[ledb_custompages] ([id], [alias_dari_menu], [judul], [ringkasan], [isi_konten], [alias_banner_assets], [alias_template]) VALUES (0, N'about', N'Profile', N'Makanan Kesukaan Anda Kamu Antar Langsung ke Rumah Anda, dari dan ke Seluruh Indonesia.', N'<h1>Mobil</h1>
Ini adalah contoh saja', N'man_n_woman', N'three_column');
GO


/*
Table structure for table 'ledb_daerah'
*/

IF OBJECT_ID ('[dbo].[ledb_daerah]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_daerah];
GO
CREATE TABLE [dbo].[ledb_daerah] (
	[id] INT IDENTITY,
	[alias] NVARCHAR(100) ,
	[nama_daerah] NVARCHAR(100) ,
	CONSTRAINT [PK_ledb_daerah] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [alias] ON [dbo].[ledb_daerah]([alias]) WHERE [alias] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_daerah'
*/

SET IDENTITY_INSERT [dbo].[ledb_daerah] ON;
GO
INSERT INTO [dbo].[ledb_daerah] ([id], [alias], [nama_daerah]) VALUES (1, N'dki_jakarta', N'DKI Jakarta');
GO

INSERT INTO [dbo].[ledb_daerah] ([id], [alias], [nama_daerah]) VALUES (2, N'sumatra_utara', N'Sumatra Utara');
GO

INSERT INTO [dbo].[ledb_daerah] ([id], [alias], [nama_daerah]) VALUES (3, N'sumatra_barat', N'Sumatra Barat');
GO

INSERT INTO [dbo].[ledb_daerah] ([id], [alias], [nama_daerah]) VALUES (4, N'sumatera_selatan', N'Sumatera Selatan');
GO

INSERT INTO [dbo].[ledb_daerah] ([id], [alias], [nama_daerah]) VALUES (5, N'nangroe_aceh_darussalam', N'Nangroe Aceh Darussalam');
GO

SET IDENTITY_INSERT [dbo].[ledb_daerah] OFF;
GO

/*
Table structure for table 'ledb_email_subscribe'
*/

IF OBJECT_ID ('[dbo].[ledb_email_subscribe]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_email_subscribe];
GO
CREATE TABLE [dbo].[ledb_email_subscribe] (
	[id] INT IDENTITY,
	[email] NVARCHAR(255) ,
	CONSTRAINT [PK_ledb_email_subscribe] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [email] ON [dbo].[ledb_email_subscribe]([email]) WHERE [email] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_email_subscribe'
*/

SET IDENTITY_INSERT [dbo].[ledb_email_subscribe] ON;
GO
INSERT INTO [dbo].[ledb_email_subscribe] ([id], [email]) VALUES (7, N'agrivo.cargo@lionair.co.id');
GO

INSERT INTO [dbo].[ledb_email_subscribe] ([id], [email]) VALUES (3, N'imaginer.me@gmail.com');
GO

INSERT INTO [dbo].[ledb_email_subscribe] ([id], [email]) VALUES (9, N'info@fitrah-wisata.com');
GO

INSERT INTO [dbo].[ledb_email_subscribe] ([id], [email]) VALUES (6, N'iwandisurga@gmail.com');
GO

INSERT INTO [dbo].[ledb_email_subscribe] ([id], [email]) VALUES (4, N'lbjkk@lionair.co.id');
GO

SET IDENTITY_INSERT [dbo].[ledb_email_subscribe] OFF;
GO

/*
Table structure for table 'ledb_faq'
*/

IF OBJECT_ID ('[dbo].[ledb_faq]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_faq];
GO
CREATE TABLE [dbo].[ledb_faq] (
	[id] INT IDENTITY,
	[tanya] NVARCHAR(MAX),
	[jawab] NVARCHAR(MAX),
	[en_tanya] NVARCHAR(MAX),
	[en_jawab] NVARCHAR(MAX),
	[icon] NVARCHAR(100) ,
	[urutan] INT,
	[is_primary] INT,
	[count] INT,
	CONSTRAINT [PK_ledb_faq] PRIMARY KEY ([id])
);
GO

/*
Dumping data for table 'ledb_faq'
*/

SET IDENTITY_INSERT [dbo].[ledb_faq] ON;
GO
INSERT INTO [dbo].[ledb_faq] ([id], [tanya], [jawab], [en_tanya], [en_jawab], [icon], [urutan], [is_primary], [count]) VALUES (1, N'Bagaimana cara menjadi vendor?', N'<p>Persyaratan untuk menjadi vendor CargoExpress adalah sebagai berikut :&nbsp;<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp; 1. &nbsp;Memberikan data lengkap tentang perusahaanya (nama, status, alamat, dst.).&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; 2. &nbsp;Memiliki Surat Ijin Usaha Perdagangan dan Surat wajib pajak.&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; 3. &nbsp;Memiliki landasan hukum mendirikan usaha.&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; 4. &nbsp;Memiliki divisi pengelola vendor.&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; 5.&nbsp;&nbsp;Memiliki data keuangan &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; 6. &nbsp;Bersedia mematuhi tata terbit/aturan terkait yang diberikan CargoExpress</p>
', N'How to Become a Vendor?', N'<p>CargoExpress open area of opportunity - the extent to which companies have the competence to follow the cargo business field procurement system through CargoExpress.<br />
<br />
The requirements to become a vendor at the CargoExpress as follows:&nbsp;<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp; 1.&nbsp;&nbsp;The company has data (name, status, address, etc.).&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; 2.&nbsp;&nbsp;Having a business license and tax ID.&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; 3.&nbsp;&nbsp;Have a Legal Basis for Establishing Company.&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; 4.&nbsp;&nbsp;Having Vendor Management.&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; 5.&nbsp;&nbsp;Having Financial Data&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; 6.&nbsp;&nbsp;Willing to obey the rules of the CargoExpress and legislation related</p>
', N'vendor.png', 1, 1, 0);
GO

INSERT INTO [dbo].[ledb_faq] ([id], [tanya], [jawab], [en_tanya], [en_jawab], [icon], [urutan], [is_primary], [count]) VALUES (2, N'Apakah transaksi yang saya lakukan aman?', N'<p>Kebanyakan orang masih khawatir untuk melakukan transaksi keuangan melalui internet karena pemilik situs atau penjual di internet masih belum bisa di identifikasi keasliannya. Tapi anda tidak perlu khawatir jika ingin melakukan transaksi di situs ini. CargoExpress memiliki sistem yang sangat ketat, mulai dari proses pendaftaran sebuah merchant atau vendor. CargoExpress akan mensurvey secara langsung ke lokasi untuk memastikan bahwa merchant/vendor benar-benar memiliki kualitas yang baik sesuai standar CargoExpress.</p>
', N'Is my transaction safe?', N'<p>Transacting&nbsp;online&nbsp;is still a&nbsp;worrying&nbsp;thing&nbsp;for you?&nbsp;Surely&nbsp;yes,&nbsp;you&nbsp;do not&nbsp;have to worry&nbsp;for&nbsp;the safety&nbsp;of&nbsp;transaction&nbsp;system&nbsp;CargoExpress&nbsp;is very&nbsp;strict,starting&nbsp;the registration&nbsp;process, which requires&nbsp;the use&nbsp;handpone&nbsp;number&nbsp;and&nbsp;email verification,&nbsp;verified&nbsp;user&nbsp;to&nbsp;apply&nbsp;the&nbsp;process&nbsp;carefully&nbsp;and&nbsp;should bedone&nbsp;manually&nbsp;and&nbsp;our&nbsp;service system&nbsp;so&nbsp;complete&nbsp;and&nbsp;easy&nbsp;the user&nbsp;can&nbsp;choose&nbsp;various&nbsp;types of&nbsp;services&nbsp;that&nbsp;we&nbsp;provide in accordance&nbsp;with therequirements</p>
', N'dollar.png', 1, 1, 0);
GO

INSERT INTO [dbo].[ledb_faq] ([id], [tanya], [jawab], [en_tanya], [en_jawab], [icon], [urutan], [is_primary], [count]) VALUES (3, N'Barang yang saya terima tidak sesuai dengan pesanan?', N'<p>CargoExpress menjamin semua pelayanan yang diberikan tidak akan membuat anda kecewa, karena kenyamanan anda adalah prioritas utama kami. Jika memang terjadi ketidaknyamanan terhadap pelayanan kami, anda bisa menghubungi layanan Customer Care Hotline di&nbsp;+62 81809026684.</p>
', N'My orders isn''t same?', N'<p>All&nbsp;services&nbsp;at CargoExpress we&nbsp;guarantee it will not&nbsp;disappoint&nbsp;because&nbsp;your comfort&nbsp;is&nbsp;our&nbsp;priority&nbsp;in the event of&nbsp;an error in&nbsp;your ministry. Please contact&nbsp;our&nbsp;customer care&nbsp;hotline at&nbsp;+62 81809026684.</p>
', N'letter.png', 1, 1, 0);
GO

SET IDENTITY_INSERT [dbo].[ledb_faq] OFF;
GO

/*
Table structure for table 'ledb_galerimenu'
*/

IF OBJECT_ID ('[dbo].[ledb_galerimenu]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_galerimenu];
GO
CREATE TABLE [dbo].[ledb_galerimenu] (
	[id] INT IDENTITY,
	[id_menu] NVARCHAR(100) ,
	[full_path_big_image] NVARCHAR(MAX),
	[full_path_thumbnail] NVARCHAR(MAX),
	[caprion] NVARCHAR(MAX),
	CONSTRAINT [PK_ledb_galerimenu] PRIMARY KEY ([id])
);
GO

/*
Dumping data for table 'ledb_galerimenu'
*/


/*
Table structure for table 'ledb_kategorimenu'
*/

IF OBJECT_ID ('[dbo].[ledb_kategorimenu]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_kategorimenu];
GO
CREATE TABLE [dbo].[ledb_kategorimenu] (
	[id] INT IDENTITY,
	[alias] NVARCHAR(100) ,
	[nama_kategori] NVARCHAR(100) ,
	CONSTRAINT [PK_ledb_kategorimenu] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [alias] ON [dbo].[ledb_kategorimenu]([alias]) WHERE [alias] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_kategorimenu'
*/

SET IDENTITY_INSERT [dbo].[ledb_kategorimenu] ON;
GO
INSERT INTO [dbo].[ledb_kategorimenu] ([id], [alias], [nama_kategori]) VALUES (1, N'minuman', N'Minuman');
GO

INSERT INTO [dbo].[ledb_kategorimenu] ([id], [alias], [nama_kategori]) VALUES (2, N'makanan-cepat-saji', N'Makanan Cepat Saji');
GO

INSERT INTO [dbo].[ledb_kategorimenu] ([id], [alias], [nama_kategori]) VALUES (3, N'makanan-tradisional', N'Makanan Tradisional');
GO

INSERT INTO [dbo].[ledb_kategorimenu] ([id], [alias], [nama_kategori]) VALUES (4, N'minuman-spesial', N'Minuman spesial');
GO

INSERT INTO [dbo].[ledb_kategorimenu] ([id], [alias], [nama_kategori]) VALUES (5, N'makanan-special-', N'Makanan Special ');
GO

SET IDENTITY_INSERT [dbo].[ledb_kategorimenu] OFF;
GO

/*
Table structure for table 'ledb_kota'
*/

IF OBJECT_ID ('[dbo].[ledb_kota]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_kota];
GO
CREATE TABLE [dbo].[ledb_kota] (
	[id] INT IDENTITY,
	[alias_daerah] NVARCHAR(255) ,
	[alias] NVARCHAR(255) ,
	[nama_kota] NVARCHAR(255) ,
	CONSTRAINT [PK_ledb_kota] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [alias] ON [dbo].[ledb_kota]([alias]) WHERE [alias] IS NOT NULL;
GO
CREATE INDEX [alias_daerah] ON [dbo].[ledb_kota]([alias_daerah]) WHERE [alias_daerah] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_kota'
*/

SET IDENTITY_INSERT [dbo].[ledb_kota] ON;
GO
INSERT INTO [dbo].[ledb_kota] ([id], [alias_daerah], [alias], [nama_kota]) VALUES (1, N'dki_jakarta', N'jakarta_utara', N'Jakarta Utara');
GO

INSERT INTO [dbo].[ledb_kota] ([id], [alias_daerah], [alias], [nama_kota]) VALUES (2, N'dki_jakarta', N'jakarta_selatan', N'Jakarta Selatan');
GO

INSERT INTO [dbo].[ledb_kota] ([id], [alias_daerah], [alias], [nama_kota]) VALUES (3, N'dki_jakarta', N'jakarta_pusat', N'Jakarta Pusat');
GO

INSERT INTO [dbo].[ledb_kota] ([id], [alias_daerah], [alias], [nama_kota]) VALUES (4, N'dki_jakarta', N'jakarta_barat', N'Jakarta Barat');
GO

INSERT INTO [dbo].[ledb_kota] ([id], [alias_daerah], [alias], [nama_kota]) VALUES (5, N'sumatra_utara', N'medan', N'Medan');
GO

SET IDENTITY_INSERT [dbo].[ledb_kota] OFF;
GO

/*
Table structure for table 'ledb_mainmenu'
*/

IF OBJECT_ID ('[dbo].[ledb_mainmenu]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_mainmenu];
GO
CREATE TABLE [dbo].[ledb_mainmenu] (
	[id] INT IDENTITY,
	[alias] NVARCHAR(255) ,
	[nama_menu] NVARCHAR(255) ,
	[is_have_tree] INT,
	[is_editable] INT,
	CONSTRAINT [PK_ledb_mainmenu] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [alias] ON [dbo].[ledb_mainmenu]([alias]) WHERE [alias] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_mainmenu'
*/

SET IDENTITY_INSERT [dbo].[ledb_mainmenu] ON;
GO
INSERT INTO [dbo].[ledb_mainmenu] ([id], [alias], [nama_menu], [is_have_tree], [is_editable]) VALUES (1, N'home', N'Home', 0, 0);
GO

INSERT INTO [dbo].[ledb_mainmenu] ([id], [alias], [nama_menu], [is_have_tree], [is_editable]) VALUES (2, N'About', N'About', 1, 1);
GO

SET IDENTITY_INSERT [dbo].[ledb_mainmenu] OFF;
GO

/*
Table structure for table 'ledb_menu'
*/

IF OBJECT_ID ('[dbo].[ledb_menu]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_menu];
GO
CREATE TABLE [dbo].[ledb_menu] (
	[id] INT IDENTITY,
	[menu_id_generator] NVARCHAR(100) ,
	[id_vendors] NVARCHAR(255) ,
	[alias_menu] NVARCHAR(255) ,
	[nama_menu] NVARCHAR(255) ,
	[deskripsi_menu] NVARCHAR(MAX),
	[media_photo] NVARCHAR(255) ,
	[harga_menu] INT,
	[kategori_menu] NVARCHAR(100) ,
	[tags] NVARCHAR(MAX),
	[is_recommended] INT,
	[last_update] DATETIME,
	CONSTRAINT [PK_ledb_menu] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [menu_id_generator] ON [dbo].[ledb_menu]([menu_id_generator]) WHERE [menu_id_generator] IS NOT NULL;
GO
CREATE INDEX [id_vendors] ON [dbo].[ledb_menu]([id_vendors]) WHERE [id_vendors] IS NOT NULL;
GO
CREATE INDEX [kategori_menu] ON [dbo].[ledb_menu]([kategori_menu]) WHERE [kategori_menu] IS NOT NULL;
GO
CREATE INDEX [id_vendors_2] ON [dbo].[ledb_menu]([id_vendors]) WHERE [id_vendors] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_menu'
*/

SET IDENTITY_INSERT [dbo].[ledb_menu] ON;
GO
INSERT INTO [dbo].[ledb_menu] ([id], [menu_id_generator], [id_vendors], [alias_menu], [nama_menu], [deskripsi_menu], [media_photo], [harga_menu], [kategori_menu], [tags], [is_recommended], [last_update]) VALUES (1, N'1604910146', N'669851645832649', N'blenger-chese', N'Blenger Chese', N'Burger dengan keju pilihan dijamin puas dengan rasa keju yang sangat lembut dimulut ', N'files/items/cheese-burger-1920x1200.jpg', 16000, N'makanan-cepat-saji', N'fast-food,gorengan,', 1, '20140502 02:22:22');
GO

INSERT INTO [dbo].[ledb_menu] ([id], [menu_id_generator], [id_vendors], [alias_menu], [nama_menu], [deskripsi_menu], [media_photo], [harga_menu], [kategori_menu], [tags], [is_recommended], [last_update]) VALUES (2, N'3089657242', N'669851645832649', N'hot-dog---chili', N'Hot Dog - Chili', N'Hot dog pedas ukuran besar dengan mayonnaise khas blenger burger   ', N'files/items/hot-dog.jpg', 14000, N'makanan-cepat-saji', N'fast-food,gorengan,makanan-pedas,', 1, '20140502 02:16:36');
GO

INSERT INTO [dbo].[ledb_menu] ([id], [menu_id_generator], [id_vendors], [alias_menu], [nama_menu], [deskripsi_menu], [media_photo], [harga_menu], [kategori_menu], [tags], [is_recommended], [last_update]) VALUES (3, N'1106131602', N'181170960666522', N'pizza-topping-hot', N'Pizza topping', N'Pizza Topping dilengkapi dengan aneka rasa yang sangat lezat dimulut...', N'files/items/o-PIZZA-HUT-facebook.jpg', 120000, N'makanan-cepat-saji', N'fast-food,makanan-pedas,makanan-berat,', 1, '20140502 04:23:28');
GO

INSERT INTO [dbo].[ledb_menu] ([id], [menu_id_generator], [id_vendors], [alias_menu], [nama_menu], [deskripsi_menu], [media_photo], [harga_menu], [kategori_menu], [tags], [is_recommended], [last_update]) VALUES (4, N'2147179593', N'130653389205997', N'ikan-bawal-bakar-madu', N'Ikan Bawal Bakar Madu', N'Ikan Bawal Bakar Madu
Salah Satu Menu Andalan Kami, Yang Di Masak Dengan Berbagai Macam Cabai Pilihan.
Siapa Berani Coba?', N'files/items/DSC03511.JPG', 70000, N'makanan-tradisional', N'makanan-pedas,', 0, '20140502 05:01:07');
GO

INSERT INTO [dbo].[ledb_menu] ([id], [menu_id_generator], [id_vendors], [alias_menu], [nama_menu], [deskripsi_menu], [media_photo], [harga_menu], [kategori_menu], [tags], [is_recommended], [last_update]) VALUES (5, N'2592116291', N'130653389205997', N'es-pocong-', N'Es Pocong ', N'Namanya Memang Seram, Namun “Es Pocong” Segarnya Luar Biasa….
Ayoo Dicoba…', N'files/items/Strawberry-Ice-Cream-ice-cream-34732718-1440-956.jpg', 15000, N'minuman-spesial', N'minuman-spesial,', 1, '20140502 02:07:15');
GO

SET IDENTITY_INSERT [dbo].[ledb_menu] OFF;
GO

/*
Table structure for table 'ledb_menutags'
*/

IF OBJECT_ID ('[dbo].[ledb_menutags]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_menutags];
GO
CREATE TABLE [dbo].[ledb_menutags] (
	[id] INT IDENTITY,
	[alias] NVARCHAR(255) ,
	[nama_tag] NVARCHAR(255) ,
	CONSTRAINT [PK_ledb_menutags] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [alias] ON [dbo].[ledb_menutags]([alias]) WHERE [alias] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_menutags'
*/

SET IDENTITY_INSERT [dbo].[ledb_menutags] ON;
GO
INSERT INTO [dbo].[ledb_menutags] ([id], [alias], [nama_tag]) VALUES (1, N'fast-food', N'Fast Food');
GO

INSERT INTO [dbo].[ledb_menutags] ([id], [alias], [nama_tag]) VALUES (2, N'gorengan', N'Gorengan');
GO

INSERT INTO [dbo].[ledb_menutags] ([id], [alias], [nama_tag]) VALUES (7, N'makanan-pedas', N'Makanan Pedas');
GO

INSERT INTO [dbo].[ledb_menutags] ([id], [alias], [nama_tag]) VALUES (8, N'makanan-berat', N'Makanan Berat');
GO

INSERT INTO [dbo].[ledb_menutags] ([id], [alias], [nama_tag]) VALUES (9, N'minuman-spesial', N'Minuman Spesial');
GO

SET IDENTITY_INSERT [dbo].[ledb_menutags] OFF;
GO

/*
Table structure for table 'ledb_order'
*/

IF OBJECT_ID ('[dbo].[ledb_order]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_order];
GO
CREATE TABLE [dbo].[ledb_order] (
	[id] INT IDENTITY,
	[id_transaksi] INT,
	[id_vendors] INT,
	[id_customer] INT,
	[id_menu] NVARCHAR(100) ,
	[total_item] INT,
	[harga_item] INT,
	[diskon] INT,
	[catatan_order] NVARCHAR(MAX),
	[total_harga] INT,
	[order_datetime] DATETIME,
	CONSTRAINT [PK_ledb_order] PRIMARY KEY ([id])
);
GO
CREATE INDEX [id_transaksi] ON [dbo].[ledb_order]([id_transaksi], [id_vendors], [id_customer], [id_menu]) WHERE [id_transaksi] IS NOT NULL AND [id_vendors] IS NOT NULL AND [id_customer] IS NOT NULL AND [id_menu] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_order'
*/


/*
Table structure for table 'ledb_promo_menu'
*/

IF OBJECT_ID ('[dbo].[ledb_promo_menu]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_promo_menu];
GO
CREATE TABLE [dbo].[ledb_promo_menu] (
	[id] INT IDENTITY,
	[id_menu] NVARCHAR(100) ,
	[tipe_promo] NVARCHAR(27) ,
	[diskon] INT,
	[deskripsi_promo] NVARCHAR(MAX),
	[mulai_promo] DATETIME,
	[akhir_promo] DATETIME,
	[is_active] INT,
	[is_banner] INT,
	CONSTRAINT [PK_ledb_promo_menu] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [id_menu_2] ON [dbo].[ledb_promo_menu]([id_menu]) WHERE [id_menu] IS NOT NULL;
GO
CREATE UNIQUE INDEX [id_menu_3] ON [dbo].[ledb_promo_menu]([id_menu]) WHERE [id_menu] IS NOT NULL;
GO
CREATE INDEX [id_menu] ON [dbo].[ledb_promo_menu]([id_menu]) WHERE [id_menu] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_promo_menu'
*/

SET IDENTITY_INSERT [dbo].[ledb_promo_menu] ON;
GO
INSERT INTO [dbo].[ledb_promo_menu] ([id], [id_menu], [tipe_promo], [diskon], [deskripsi_promo], [mulai_promo], [akhir_promo], [is_active], [is_banner]) VALUES (1, N'1604910146', N'od', 20, N'Get in sale with discount party', '20140402 15:00:00', '20140430 15:00:00', 0, 0);
GO

INSERT INTO [dbo].[ledb_promo_menu] ([id], [id_menu], [tipe_promo], [diskon], [deskripsi_promo], [mulai_promo], [akhir_promo], [is_active], [is_banner]) VALUES (2, N'3089657242', N'od', 5, N'Buy 1 get 1 frees', '20140403 13:00:00', '20140430 13:00:00', 0, 0);
GO

INSERT INTO [dbo].[ledb_promo_menu] ([id], [id_menu], [tipe_promo], [diskon], [deskripsi_promo], [mulai_promo], [akhir_promo], [is_active], [is_banner]) VALUES (5, N'2592116291', N'od', 10, N'Test Promo', '20140422 01:00:00', '20140522 02:00:00', 0, 0);
GO

INSERT INTO [dbo].[ledb_promo_menu] ([id], [id_menu], [tipe_promo], [diskon], [deskripsi_promo], [mulai_promo], [akhir_promo], [is_active], [is_banner]) VALUES (6, N'1106131602', N'od', 20, N'Segera dapatkan diskonnya', '20140423 01:00:00', '20140601 01:00:00', 0, 0);
GO

SET IDENTITY_INSERT [dbo].[ledb_promo_menu] OFF;
GO

/*
Table structure for table 'ledb_reviewmenu'
*/

IF OBJECT_ID ('[dbo].[ledb_reviewmenu]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_reviewmenu];
GO
CREATE TABLE [dbo].[ledb_reviewmenu] (
	[id] INT IDENTITY,
	[id_customer] INT,
	[id_menu] NVARCHAR(100) ,
	[isi_review] NVARCHAR(MAX),
	[rating] INT,
	[posting_date] DATETIME,
	CONSTRAINT [PK_ledb_reviewmenu] PRIMARY KEY ([id])
);
GO
CREATE INDEX [id_menu] ON [dbo].[ledb_reviewmenu]([id_menu]) WHERE [id_menu] IS NOT NULL;
GO
CREATE INDEX [id_customer] ON [dbo].[ledb_reviewmenu]([id_customer]) WHERE [id_customer] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_reviewmenu'
*/


/*
Table structure for table 'ledb_template'
*/

IF OBJECT_ID ('[dbo].[ledb_template]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_template];
GO
CREATE TABLE [dbo].[ledb_template] (
	[id] INT IDENTITY,
	[alias] NVARCHAR(255) ,
	[name] NVARCHAR(255) ,
	[code] NVARCHAR(MAX),
	[is_banner] INT,
	CONSTRAINT [PK_ledb_template] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [alias] ON [dbo].[ledb_template]([alias]) WHERE [alias] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_template'
*/


/*
Table structure for table 'ledb_transaksi'
*/

IF OBJECT_ID ('[dbo].[ledb_transaksi]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_transaksi];
GO
CREATE TABLE [dbo].[ledb_transaksi] (
	[id] INT IDENTITY,
	[id_transaksi_generator] NVARCHAR(100) ,
	[id_customer] INT,
	[total_harga] INT,
	[total_bayar] INT,
	[alamat_utama] NVARCHAR(48) ,
	[alamat_alternatif] NVARCHAR(MAX),
	[transaksi_datetime] DATETIME,
	[id_agen] NVARCHAR(100) ,
	[kode_pengiriman] NVARCHAR(100) ,
	[status_pengiriman] NVARCHAR(108) ,
	[posisi_item] NVARCHAR(255) ,
	CONSTRAINT [PK_ledb_transaksi] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [id_transaksi_generator_2] ON [dbo].[ledb_transaksi]([id_transaksi_generator]) WHERE [id_transaksi_generator] IS NOT NULL;
GO
CREATE INDEX [id_transaksi_generator] ON [dbo].[ledb_transaksi]([id_transaksi_generator], [id_customer], [id_agen], [kode_pengiriman]) WHERE [id_transaksi_generator] IS NOT NULL AND [id_customer] IS NOT NULL AND [id_agen] IS NOT NULL AND [kode_pengiriman] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_transaksi'
*/


/*
Table structure for table 'ledb_vendors'
*/

IF OBJECT_ID ('[dbo].[ledb_vendors]', 'U') IS NOT NULL
DROP TABLE [dbo].[ledb_vendors];
GO
CREATE TABLE [dbo].[ledb_vendors] (
	[id] INT IDENTITY,
	[id_vendors_generator] NVARCHAR(255) ,
	[alias_daerah] NVARCHAR(100) ,
	[alias_kota] NVARCHAR(100) ,
	[alias_vendors] NVARCHAR(255) ,
	[nama_vendors] NVARCHAR(255) ,
	[alamat_vendors] NVARCHAR(MAX),
	[tlp_vendors] NVARCHAR(15) ,
	[email_vendors] NVARCHAR(255) ,
	[logo_vendors] NVARCHAR(255) ,
	[banner_vendors] NVARCHAR(255) ,
	[is_verified] INT,
	[last_updated] DATETIME,
	CONSTRAINT [PK_ledb_vendors] PRIMARY KEY ([id])
);
GO
CREATE UNIQUE INDEX [alias_vendors] ON [dbo].[ledb_vendors]([alias_vendors]) WHERE [alias_vendors] IS NOT NULL;
GO
CREATE UNIQUE INDEX [id_vendors_generator] ON [dbo].[ledb_vendors]([id_vendors_generator]) WHERE [id_vendors_generator] IS NOT NULL;
GO

/*
Dumping data for table 'ledb_vendors'
*/

SET IDENTITY_INSERT [dbo].[ledb_vendors] ON;
GO
INSERT INTO [dbo].[ledb_vendors] ([id], [id_vendors_generator], [alias_daerah], [alias_kota], [alias_vendors], [nama_vendors], [alamat_vendors], [tlp_vendors], [email_vendors], [logo_vendors], [banner_vendors], [is_verified], [last_updated]) VALUES (1, N'669851645832649', N'jakarta', N'jakarta_selatan', N'blenger-burger-barito', N'Blenger Burger Barito', N'Gria Astika Jl.Lamandau IV No. 16-18 Kebayoran Baru - Jakarta Selatan', N'08881611200', N'blenger_barito@blengerburger.com', N'files/logo_vendors/logototalit.jpg', N'files/banner_vendors/king-hd-wallpaper-hd-wallpaper-widescreen-king-hd-wallpaper.jpg', 0, '20140324 18:34:51');
GO

INSERT INTO [dbo].[ledb_vendors] ([id], [id_vendors_generator], [alias_daerah], [alias_kota], [alias_vendors], [nama_vendors], [alamat_vendors], [tlp_vendors], [email_vendors], [logo_vendors], [banner_vendors], [is_verified], [last_updated]) VALUES (2, N'181170960666522', N'jakarta', N'jakarta_utara', N'pizza-hut', N'Pizza Hut', N'Jakarta utara', N'0219303930', N'uyfgi@hgfis.com', N'files/logo_vendors/Pizza-hut-logo.jpg', N'files/banner_vendors/pizza-hut.jpg', 0, '20140417 05:10:40');
GO

INSERT INTO [dbo].[ledb_vendors] ([id], [id_vendors_generator], [alias_daerah], [alias_kota], [alias_vendors], [nama_vendors], [alamat_vendors], [tlp_vendors], [email_vendors], [logo_vendors], [banner_vendors], [is_verified], [last_updated]) VALUES (3, N'130653389205997', N'sumatera_selatan', N'palembang', N'mbah_jingkrak', N'Mbah Jingkrak', N'Jl. Setiabudi Tengah No. 11, Kuningan Palembang', N'0812988352276', N'mbah_jingkrak@gmail.com', N'files/logo_vendors/mbah_jin.jpg', N'files/banner_vendors/Ayam_Rambut_Setan.jpg', 0, '20140422 00:06:34');
GO

INSERT INTO [dbo].[ledb_vendors] ([id], [id_vendors_generator], [alias_daerah], [alias_kota], [alias_vendors], [nama_vendors], [alamat_vendors], [tlp_vendors], [email_vendors], [logo_vendors], [banner_vendors], [is_verified], [last_updated]) VALUES (4, N'218439360008383', N'dki_jakarta', N'jakarta_utara', N'bandar-djakarta', N'Bandar Djakarta', N'Bandar Djakarta Ancol Jakarta Utara', N'0216455472', N'ancol@bandar-djakarta.com', N'files/logo_vendors/BJ.jpg', N'files/banner_vendors/logo(1).jpg', 0, '20140429 23:00:28');
GO

INSERT INTO [dbo].[ledb_vendors] ([id], [id_vendors_generator], [alias_daerah], [alias_kota], [alias_vendors], [nama_vendors], [alamat_vendors], [tlp_vendors], [email_vendors], [logo_vendors], [banner_vendors], [is_verified], [last_updated]) VALUES (5, N'136113447315174', N'dki_jakarta', N'jakarta_utara', N'chopsticks', N'Chopsticks', N'Jakarta Selatan', N'0212354652', N'contact@copsticks.com', N'files/logo_vendors/201002261351480.logo_.jpg', N'files/banner_vendors/riri.jpg', 0, '20140429 23:23:37');
GO

SET IDENTITY_INSERT [dbo].[ledb_vendors] OFF;
GO
