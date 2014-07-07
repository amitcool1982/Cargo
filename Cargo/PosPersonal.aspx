<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="PosPersonal.aspx.cs" Inherits="Cargo.PosPersonal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="Content/bootstrap.css">
    <link rel="stylesheet" href="Content/sb-admin.css">
    <link rel="stylesheet" href="Content/font-awesome.min.css">

    <script src="Scripts/site.js"></script>
    <script type="text/javascript" src="Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="Scripts/DT_bootstrap.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <style type="text/css">
        .btncustom {
            height: 27px;
            line-height: 10px;
        }
    </style>
    <script type="text/javascript" src="Scripts/PosPersonal/PosPersonal.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">


        <div id="page-wrapper">

            <div class="row">
                <div class="col-lg-12">
                    <h1>Point of Saless <small>Personal Form</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li><a href="POS.aspx"><i class="icon-user"></i>Point of Sales</a></li>
                        <li class="active"><i class="icon-file-alt"></i>Personal Form</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <h3>Form Point of Sales</h3>
                </div>
                <input name="id" value="" type="hidden">
                <div class="col-lg-6">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>Registrant Biodata</h4>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="rb_ktp">Identity Card Number(No.KTP) :</label>
                                <input id="rb_ktp" required="" name="rb_ktp" placeholder="KTP" class="form-control input-sm" type="text">
                                <label for="rb_fullname">Fullname :</label>
                                <input id="rb_fullname" required="" name="rb_fullname" placeholder="Type name here.." class="form-control input-sm" type="text">
                                <label for="rb_email">Email :</label>
                                <input id="rb_email" required="" name="rb_email" placeholder="Type e-mail here.." class="form-control input-sm" type="email">
                                <label for="rb_gender">Gender :</label>
                                <select name="rb_gender" id="rb_gender" class="form-control input-sm" required="">
                                    <option selected="selected" value="">- Select Gender -</option>
                                    <option value="Pria">Male</option>
                                    <option value="Wanita">Female</option>
                                </select>
                                <label for="rb_hometown">Hometown :</label>
                                <input id="rb_hometown" required="" name="rb_hometown" placeholder="Type hometown here.." class="form-control input-sm" type="text">
                                <label for="rb_birthday">Birthday :</label>
                                <input id="rb_birthday" required="" name="rb_birthday" class="form-control input-sm" type="date">
                                <label for="rb_nationality">Nationality :</label>
                                <select name="rb_nationality" id="rb_nationality" class="show-field form-control input-sm" data-selector="rb_nationality_other" required="">
                                    <option selected="selected" value="">- Select Country -</option>
                                    <option value="WNI">Indonesia</option>
                                    <option value="">Others</option>
                                </select>
                                <input name="rb_nationality_other" placeholder="Type country here" class="form-control input-sm" type="text">
                                <label for="rb_marriage">Marriage :</label>
                                <select name="rb_marriage" id="rb_marriage" class="form-control input-sm" required="">
                                    <option selected="selected" value="">- Select Status -</option>
                                    <option value="Menikah">Marriage</option>
                                    <option value="Single">Single</option>
                                </select>
                                <label for="rb_religion">Religion :</label>
                                <select name="rb_religion" id="rb_religion" class="form-control input-sm" required="">
                                    <option selected="selected" value="">- Select Religion -</option>
                                    <option value="Islam">Islam</option>
                                    <option value="Katholik">Catholic</option>
                                    <option value="Protestan">Protestant</option>
                                    <option value="Hindu">Hindu</option>
                                    <option value="Budha">Budha</option>
                                    <option value="Konghucu">Konghucu</option>
                                </select>
                                <label for="rb_address">Address :</label>
                                <textarea id="rb_address" required="" name="rb_address" class="form-control input-sm" placeholder="Type address here.."></textarea>

                                <label for="rb_province">Province :</label>
                                <select name="rb_province" id="rb_province" class="province_change form-control input-sm" data-selector="rb_city" required="">
                                    <option selected="selected" value="">- Province -</option>
                                    <option value="dki_jakarta">DKI Jakarta</option>
                                    <option value="sumatra_utara">Sumatra Utara</option>
                                    <option value="sumatra_barat">Sumatra Barat</option>
                                    <option value="sumatera_selatan">Sumatera Selatan</option>
                                    <option value="nangroe_aceh_darussalam">Nangroe Aceh Darussalam</option>
                                    <option value="riau">Riau</option>
                                    <option value="jambi">Jambi</option>
                                    <option value="bangka_belitung">Bangka Belitung</option>
                                    <option value="bengkulu">Bengkulu</option>
                                    <option value="_lampung">Lampung</option>
                                    <option value="jawa_tengah">Jawa Tengah</option>
                                    <option value="jawa_barat">Jawa Barat</option>
                                    <option value="jawa_timur">Jawa Timur</option>

                                </select>
                                <label for="rb_city">City :</label>
                                <select name="rb_city" id="rb_city" class="form-control input-sm" required="">
                                    <option selected="selected" value="">- City -</option>
                                    <option value="jakarta_utara">Jakarta Utara</option>
                                    <option value="jakarta_selatan">Jakarta Selatan</option>
                                    <option value="jakarta_pusat">Jakarta Pusat</option>
                                    <option value="jakarta_barat">Jakarta Barat</option>
                                    <option value="medan">Medan</option>
                                    <option value="pematangsiantar___">Pematangsiantar   </option>
                                    <option value="binjai____">Binjai    </option>
                                    <option value="banda_aceh">Banda Aceh</option>
                                    <option value="lhokseumawe">Lhokseumawe</option>
                                    <option value="langsa">Langsa</option>
                                    <option value="palembang">Palembang</option>
                                    <option value="surabaya">Surabaya</option>
                                </select>
                                <label for="rb_zipcode">ZIP Code :</label>
                                <input id="rb_zipcode" required="" name="rb_zipcode" placeholder="Type Zip Code here.." class="form-control input-sm" type="text">
                                <label for="rb_phone">Phone :</label>
                                <input id="rb_phone" name="rb_phone" placeholder="Type phone here.." class="form-control input-sm" type="text">
                                <label for="rb_handphone">Handphone :</label>
                                <input id="rb_handphone" required="" name="rb_handphone" placeholder="Type handphone here.." class="form-control input-sm" type="text">
                                <label for="rb_fax">Fax :</label>
                                <input id="rb_fax" name="rb_fax" placeholder="Type FAX here.." class="form-control input-sm" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>Reference Data</h4>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="rd_fullname">Fullname :</label>
                                <input id="rd_fullname" name="rd_fullname" placeholder="Type name here.." class="form-control input-sm" type="text">
                                <label for="rd_phone">Phone :</label>
                                <input id="rd_phone" name="rd_phone" placeholder="Type valid phone here.." class="form-control input-sm" type="text">
                                <label for="rd_reference">Reference Giver :</label>
                                <select name="rd_reference" id="rd_reference" class="form-control input-sm">
                                    <option selected="selected" value="">- Select Status -</option>
                                    <option value="Karyawan">Karyawan</option>
                                    <option value="Perwakilan">Perwakilan</option>
                                    <option value="Agen Travel">Agen Travel</option>
                                </select>
                                <label for="rd_email">Email :</label>
                                <input id="rd_email" name="rd_email" placeholder="Type valid email here.." class="form-control input-sm" type="email">
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-lg-6">
                    <style type="text/css">
                        div#map {
                            position: relative;
                        }

                        div#crosshair {
                            position: absolute;
                            top: 165px;
                            height: 47px;
                            width: 29px;
                            left: 50%;
                            margin-left: -8px;
                            display: block;
                            background: url('../../freebox/image/point_grabber.png');
                            background-position: center center;
                            background-repeat: no-repeat;
                        }
                    </style>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>Proposed Location</h4>
                        </div>
                        <div class="panel-body">
                            <div class="row-fluid" style="margin-bottom: 10px;">
                                <div class="col-lg-6">
                                    <label for="pl_location_type">Location Type</label>
                                    <select name="pl_location_type" id="pl_location_type" class="show-field form-control" data-selector="pl_location_type_other">
                                        <option value="Ruko">Ruko</option>
                                        <option value="Mall">Mall</option>
                                        <option value="Perkantoran">Perkantoran</option>
                                        <option value="Perumahan">Perumahan</option>
                                        <option value="Travel Point">Travel Point</option>
                                        <option value="Hotel">Hotel</option>
                                        <option value="Pom Bensin">Pom Bensin</option>
                                        <option value="" selected="selected">Others</option>
                                    </select>
                                    <input name="pl_location_type_other" placeholder="Type Location here" class="form-control" style="display: none;" type="text">
                                    <br>
                                    <label for="pl_address_location">Address</label>
                                    <textarea name="pl_address_location" id="pl_address_location" class="form-control" cols="50" rows="5"></textarea>
                                    <label for="pl_province">Province :</label>
                                    <select name="pl_province" id="pl_province" class="province_change form-control input-sm" data-selector="pl_city" required="">
                                        <option selected="selected" value="">- Province -</option>
                                        <option value="dki_jakarta">DKI Jakarta</option>
                                        <option value="sumatra_utara">Sumatra Utara</option>
                                        <option value="sumatra_barat">Sumatra Barat</option>
                                        <option value="sumatera_selatan">Sumatera Selatan</option>
                                        <option value="nangroe_aceh_darussalam">Nangroe Aceh Darussalam</option>
                                        <option value="riau">Riau</option>
                                        <option value="jambi">Jambi</option>
                                        <option value="bangka_belitung">Bangka Belitung</option>
                                        <option value="bengkulu">Bengkulu</option>
                                        <option value="_lampung">Lampung</option>
                                        <option value="jawa_tengah">Jawa Tengah</option>
                                        <option value="jawa_barat">Jawa Barat</option>
                                        <option value="jawa_timur">Jawa Timur</option>

                                    </select>
                                    <label for="pl_city">City :</label>
                                    <select name="pl_city" id="pl_city" class="form-control input-sm" required="">
                                        <option selected="selected" value="">- City -</option>
                                        <option value="jakarta_utara">Jakarta Utara</option>
                                        <option value="jakarta_selatan">Jakarta Selatan</option>
                                        <option value="jakarta_pusat">Jakarta Pusat</option>
                                        <option value="jakarta_barat">Jakarta Barat</option>
                                        <option value="medan">Medan</option>
                                        <option value="pematangsiantar___">Pematangsiantar   </option>
                                        <option value="binjai____">Binjai    </option>
                                        <option value="banda_aceh">Banda Aceh</option>
                                        <option value="lhokseumawe">Lhokseumawe</option>
                                        <option value="langsa">Langsa</option>
                                        <option value="palembang">Palembang</option>
                                        <option value="surabaya">Surabaya</option>
                                    </select>
                                </div>
                                <div class="col-lg-6">

                                    <label for="pl_zipcode">ZIP Code :</label>
                                    <input id="pl_zipcode" required="" name="pl_zipcode" placeholder="Type zip code here.." class="form-control input-sm" type="text">
                                    <label for="pl_phone">Phone :</label>
                                    <input id="pl_phone" required="" name="pl_phone" placeholder="Type phone here.." class="form-control input-sm" type="text">
                                    <label for="pl_handphone">Handphone :</label>
                                    <input id="pl_handphone" name="pl_handphone" placeholder="Type handphone here.." class="form-control input-sm" type="text">
                                    <label for="pl_fax">Fax :</label>
                                    <input id="pl_fax" name="pl_fax" placeholder="Type FAX here.." class="form-control input-sm" type="text">
                                    <label for="pl_large">Space/Warehouse Wide(m2)</label>
                                    <input id="pl_large" required="" name="pl_large" placeholder="How the space wide?" class="form-control input-sm" type="text">
                                </div>

                            </div>

                            <input value="-6.29041853539655, 106.79451581420903" name="latlang" id="latlng" class="form-control" placeholder="Latitude/Longitude">
                            Insert Google Map here

                        </div>
                        <div class="panel-footer">
                            <div class="row-fluid">
                                <button type="submit" class="btn btn-primary">Save</button>
                                <button type="button" class="btn btn-danger" onclick="cancel();">Cancel</button>
                            </div>
                        </div>
                    </div>


                    <div class="panel panel-default">

                        <div class="panel-heading">
                            <h4>Attachments</h4>
                        </div>
                        <div class="panel-body">
                            <input name="id_pos" value="" type="hidden">
                            <input name="family_card" value="" type="hidden">
                            <input name="tax_number" value="" type="hidden">
                            <input name="id_card" value="" type="hidden">
                            <div id="scs">
                            </div>
                            <div id="result-attach">
                                <h3>Uploaded Attachments :</h3>
                                <li>Family Card Empty</li>
                                <li>Tax Number Empty</li>
                                <li>ID Card Empty</li>
                                <br>
                            </div>
                            <label for="family_card">Family Card</label>
                            <div style="height: 30px; width: 120px;" class="uploadify" id="family_card">
                                <object style="position: absolute; z-index: 1;" id="SWFUpload_0" type="application/x-shockwave-flash" data="images/uploadify.swf" class="swfupload" height="30" width="120">
                                    <param name="wmode" value="transparent">
                                    <param name="movie" value="/adminbox/uploadify/uploadify.swf?preventswfcaching=1404711152254">
                                    <param name="quality" value="high">
                                    <param name="menu" value="false">
                                    <param name="allowScriptAccess" value="always">
                                    <param name="flashvars" value="movieName=SWFUpload_0&amp;uploadURL=%2Fpos%2Finformation%2Fupload_files%3Fname%3Dkartukeluarga_1404711153&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=timestamp%3D1404711153%26amp%3Btoken%3D9458bff8d55844f105ff44a6c3121878%26amp%3Bid_exist%3D&amp;filePostName=Filedata&amp;fileTypes=*.*&amp;fileTypesDescription=All%20Files&amp;fileSizeLimit=0&amp;fileUploadLimit=3&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=&amp;buttonWidth=120&amp;buttonHeight=30&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                                </object>
                                <div style="height: 30px; line-height: 30px; width: 120px;" class="uploadify-button btn btn-primary btn-block" id="family_card-button"><span class="uploadify-button-text">Browse File</span></div>
                            </div>
                            <div class="uploadify-queue" id="family_card-queue"></div>
                            <label for="akta-notaris">Tax Number (NPWP)</label>
                            <div style="height: 30px; width: 120px;" class="uploadify" id="tax_button">
                                <object style="position: absolute; z-index: 1;" id="SWFUpload_1" type="application/x-shockwave-flash" data="images/uploadify_003.swf" class="swfupload" height="30" width="120">
                                    <param name="wmode" value="transparent">
                                    <param name="movie" value="/adminbox/uploadify/uploadify.swf?preventswfcaching=1404711152261">
                                    <param name="quality" value="high">
                                    <param name="menu" value="false">
                                    <param name="allowScriptAccess" value="always">
                                    <param name="flashvars" value="movieName=SWFUpload_1&amp;uploadURL=%2Fpos%2Finformation%2Fupload_files%3Fname%3Dpajak_1404711153&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=timestamp%3D1404711153%26amp%3Btoken%3D9458bff8d55844f105ff44a6c3121878%26amp%3Bid_exist%3D&amp;filePostName=Filedata&amp;fileTypes=*.*&amp;fileTypesDescription=All%20Files&amp;fileSizeLimit=0&amp;fileUploadLimit=3&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=&amp;buttonWidth=120&amp;buttonHeight=30&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                                </object>
                                <div style="height: 30px; line-height: 30px; width: 120px;" class="uploadify-button btn btn-primary btn-block" id="tax_button-button"><span class="uploadify-button-text">Browse File</span></div>
                            </div>
                            <div class="uploadify-queue" id="tax_button-queue"></div>
                            <label for="id_card">ID Card</label>
                            <div style="height: 30px; width: 120px;" class="uploadify" id="id_card">
                                <object style="position: absolute; z-index: 1;" id="SWFUpload_2" type="application/x-shockwave-flash" data="images/uploadify_002.swf" class="swfupload" height="30" width="120">
                                    <param name="wmode" value="transparent">
                                    <param name="movie" value="/adminbox/uploadify/uploadify.swf?preventswfcaching=1404711152265">
                                    <param name="quality" value="high">
                                    <param name="menu" value="false">
                                    <param name="allowScriptAccess" value="always">
                                    <param name="flashvars" value="movieName=SWFUpload_2&amp;uploadURL=%2Fpos%2Finformation%2Fupload_files%3Fname%3Dktp_1404711153&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=timestamp%3D1404711153%26amp%3Btoken%3D9458bff8d55844f105ff44a6c3121878%26amp%3Bid_exist%3D&amp;filePostName=Filedata&amp;fileTypes=*.*&amp;fileTypesDescription=All%20Files&amp;fileSizeLimit=0&amp;fileUploadLimit=3&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=&amp;buttonWidth=120&amp;buttonHeight=30&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                                </object>
                                <div style="height: 30px; line-height: 30px; width: 120px;" class="uploadify-button btn btn-primary btn-block" id="id_card-button"><span class="uploadify-button-text">Browse File</span></div>
                            </div>
                            <div class="uploadify-queue" id="id_card-queue"></div>

                        </div>
                        <div class="panel-footer">
                            <button type="submit" class="btn btn-success">Save Attachment</button>
                        </div>
                    </div>
                </div>
            </div>

            <link href="css/uploadify.css" rel="stylesheet">
            <script src="js/jquery.js"></script>
            <script type="text/javascript" src="service/js"></script>
            <script src="js/main.js" type="text/javascript"></script>
            <script>

                var base = $('#base').text();
                var message = {
                    Seletor: function (sel) {
                        if (typeof (sel) === 'undefined') sel = $('#loading-error-success');
                        return sel;
                    },
                    T_error: function (mess) {
                        return '<div class="alert alert-dismissable alert-danger" style="margin-bottom:4px;padding:2px;"><button type="button" class="close" data-dismiss="alert">×</button>' + mess + '</div>';
                    },
                    T_success: function (mess) {
                        return '<div class="alert alert-dismissable alert-success" style="margin-bottom:4px;padding:2px;"><button type="button" class="close" data-dismiss="alert">×</button>' + mess + '</div>';
                    },
                    Error: function (mess, mode, sel) {
                        if (typeof (mode) === 'undefined') mode = 'replace';
                        def_selector = message.Seletor(sel);
                        if (mode == 'add') {
                            def_selector.append(message.T_error(mess));
                        }
                        else if (mode == 'replace') {
                            def_selector.html(message.T_error(mess));
                        }

                    },
                    Success: function (mess, mode, sel) {
                        if (typeof (mode) === 'undefined') mode = 'replace';
                        def_selector = message.Seletor(sel);
                        if (mode == 'add') {
                            def_selector.append(message.T_success(mess));
                        }
                        else if (mode == 'replace') {
                            def_selector.html(message.T_success(mess));
                        }
                    },
                    Clean: function () {
                        var sel = message.Seletor();
                        sel.html('');
                    },
                    Loading: function () {
                        var sel = message.Seletor();
                        sel.hide().html('<img src="../../openbox/images/loader.gif"> Please Wait..').fadeIn('fast');
                    }
                };

                var slc = $('#scs');
                var base = $('#base').text();
                $("#family_card").uploadify({
                    'buttonText': 'Browse File',
                    'buttonClass': 'btn btn-primary btn-block',
                    'uploadLimit': 3,
                    'formData': {
                        'timestamp': '1404711153',
                        'token': '9458bff8d55844f105ff44a6c3121878',
                        'id_exist': ''
                    },
                    'swf': '/adminbox/uploadify/uploadify.swf',
                    'uploader': 'upload_files?name=kartukeluarga_1404711153',
                    'onUploadSuccess': function (file, data, response) {
                        var json = $.parseJSON(data);

                        message.Success(json.message.message, 'add', slc);

                        $('input[name="family_card"]').attr('value', json.message.path);
                    }
                });
                $("#tax_button").uploadify({
                    'buttonText': 'Browse File',
                    'buttonClass': 'btn btn-primary btn-block',
                    'uploadLimit': 3,
                    'formData': {
                        'timestamp': '1404711153',
                        'token': '9458bff8d55844f105ff44a6c3121878',
                        'id_exist': ''
                    },
                    'swf': '/adminbox/uploadify/uploadify.swf',
                    'uploader': 'upload_files?name=pajak_1404711153',
                    'onUploadSuccess': function (file, data, response) {
                        var json = $.parseJSON(data);

                        message.Success(json.message.message, 'add', slc);

                        $('input[name="tax_number"]').attr('value', json.message.path);
                    }
                });

                $("#id_card").uploadify({
                    'buttonText': 'Browse File',
                    'buttonClass': 'btn btn-primary btn-block',
                    'uploadLimit': 3,
                    'formData': {
                        'timestamp': '1404711153',
                        'token': '9458bff8d55844f105ff44a6c3121878',
                        'id_exist': ''
                    },
                    'swf': '/adminbox/uploadify/uploadify.swf',
                    'uploader': 'upload_files?name=ktp_1404711153',
                    'onUploadSuccess': function (file, data, response) {
                        var json = $.parseJSON(data);

                        message.Success(json.message.message, 'add', slc);

                        $('input[name="id_card"]').attr('value', json.message.path);
                    }
                });

            </script>

            <script>
                $(document).ready(function () {
                    $('.show-field').on('change', function () {
                        var selector = $(this).attr('data-selector');
                        var field = $('input[name="' + selector + '"]'),
                            value = $(this).val();
                        if (value == false || value == '') {
                            field.fadeIn(500);
                        }
                        else {
                            field.fadeOut(500);
                        }
                    });

                    $('.province_change').on('change', function () {
                        var c_selector = $(this).attr('data-selector');
                        var city = $.ajax({
                            type: 'GET',
                            url: 'get_city',
                            dataType: 'json',
                            data: { province: $(this).val() },
                            timeout: 15000
                        });
                        city.done(function (response) {
                            var option = '<option value="">- City -</option>';
                            if (response.status) {
                                $.each(response.message, function (key, value) {
                                    option += '<option value="' + value['alias'] + '">' + value['nama_kota'] + '</option>';
                                });
                                var select = $('select[name="' + c_selector + '"]');
                                select.empty();
                                select.append(option);
                            }
                            else {
                                var select = $('select[name="' + c_selector + '"]');
                                select.empty();
                                select.append(option);
                            }
                        });
                        city.fail(function (xhr, response) {
                            alert(response);
                        });
                    });

                    var formPos = $('form#pos-form');
                    formPos.on('submit', function (event) {
                        event.preventDefault();
                        message.Loading();

                        var pos = $.ajax({
                            type: $(this).attr('method'),
                            url: $(this).attr('action') + '_' + $(this).attr('data-drove'),
                            dataType: 'json',
                            data: $(this).serialize(),
                            timeout: 15000
                        });
                        pos.done(function (response) {
                            if (response.status) {
                                message.Success(response.message.message);
                                //formPos.find('input, textarea, select').val('');
                                $('input[name="id_pos"]').val(response.message.id_pos);

                                $("#family_card").uploadify('settings', 'formData', { 'id_exist': $('input[name="id_pos"]').val() });
                                $("#tax_button").uploadify('settings', 'formData', { 'id_exist': $('input[name="id_pos"]').val() });
                                $("#id_card").uploadify('settings', 'formData', { 'id_exist': $('input[name="id_pos"]').val() });
                            }
                            else {
                                message.Error(response.message.error_all, 'replace');
                                $.each(response.message.error, function (key, value) {
                                    if (value) $('[name="' + key + '"]').css({ "background-color": "#f2dede", "color": "#b94a48" });
                                });
                            }
                        });
                        pos.fail(function (xhr, response) {
                            message.Error(response);
                        });
                    });

                    var formAttach = $('form#pos-attachment');
                    formAttach.on('submit', function (event) {
                        event.preventDefault();
                        message.Loading();

                        var pos = $.ajax({
                            type: $(this).attr('method'),
                            url: $(this).attr('action'),
                            dataType: 'json',
                            data: $(this).serialize(),
                            timeout: 15000
                        });
                        pos.done(function (response) {
                            if (response.status) {
                                message.Success(response.message.message);
                                var result = '<h3>Uploaded Attachments :</h3>';
                                result += (response.message.files.kk) ? '<li><a href="' + base + response.message.files.kk + '">Family Card</a></li>' : '<li>Family Card Empty</li>';
                                result += (response.message.files.npwp) ? '<li><a href="' + base + response.message.files.npwp + '">Tax Number</a></li>' : '<li>Tax Number Empty</li>';
                                result += (response.message.files.ktp) ? '<li><a href="' + base + response.message.files.ktp + '">ID Card</a></li>' : '<li>ID Card Empty</li>';
                                $('#result-attach').html(result);
                                slc.html(message.T_success('All attachment saved.'));
                            }
                            else {
                                message.Error(response.message);
                            }
                        });
                        pos.fail(function (xhr, response) {
                            message.Error(response);
                        });
                    });
                });

                var map;
                var geocoder;
                var centerChangedLast;
                var reverseGeocodedLast;
                var currentReverseGeocodeResponse;

                function initialize() {
                    var latlng = new google.maps.LatLng(-6.29041853539655, 106.79451581420905);
                    var myOptions = {
                        zoom: 13,
                        center: latlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
                    geocoder = new google.maps.Geocoder();


                    setupEvents();
                    centerChanged();
                }

                function setupEvents() {
                    reverseGeocodedLast = new Date();
                    centerChangedLast = new Date();

                    setInterval(function () {
                        if ((new Date()).getSeconds() - centerChangedLast.getSeconds() > 1) {
                            if (reverseGeocodedLast.getTime() < centerChangedLast.getTime())
                                reverseGeocode();
                        }
                    }, 1000);

                    google.maps.event.addListener(map, 'zoom_changed', function () {
                        document.getElementById("zoom_level").innerHTML = map.getZoom();
                    });

                    google.maps.event.addListener(map, 'center_changed', centerChanged);

                    google.maps.event.addDomListener(document.getElementById('crosshair'), 'dblclick', function () {
                        map.setZoom(map.getZoom() + 1);
                    });

                }

                function getCenterLatLngText() {
                    return map.getCenter().lat() + ', ' + map.getCenter().lng();
                }

                function centerChanged() {
                    centerChangedLast = new Date();
                    var latlng = getCenterLatLngText();
                    document.getElementById('latlng').value = latlng;
                    document.getElementById('formatedAddress').innerHTML = '';
                    currentReverseGeocodeResponse = null;
                }

                function reverseGeocode() {
                    reverseGeocodedLast = new Date();
                    geocoder.geocode({ latLng: map.getCenter() }, reverseGeocodeResult);
                }

                function reverseGeocodeResult(results, status) {
                    currentReverseGeocodeResponse = results;
                    if (status == 'OK') {
                        if (results.length == 0) {
                            document.getElementById('formatedAddress').innerHTML = 'None';
                        } else {
                            document.getElementById('formatedAddress').innerHTML = results[0].formatted_address;
                        }
                    } else {
                        document.getElementById('formatedAddress').innerHTML = 'Error';
                    }
                }


                function geocode() {
                    var address = document.getElementById("address").value;
                    geocoder.geocode({
                        'address': address,
                        'partialmatch': true
                    }, geocodeResult);
                }

                function geocodeResult(results, status) {
                    if (status == 'OK' && results.length > 0) {
                        map.fitBounds(results[0].geometry.viewport);
                    } else {
                        alert("Geocode was not successful for the following reason: " + status);
                    }
                }

                function addMarkerAtCenter() {
                    var marker = new google.maps.Marker({
                        position: map.getCenter(),
                        map: map
                    });

                    var text = 'Lat/Lng : (' + getCenterLatLngText() + ')';
                    if (currentReverseGeocodeResponse) {
                        var addr = '';
                        if (currentReverseGeocodeResponse.size == 0) {
                            addr = 'None';
                        } else {
                            addr = currentReverseGeocodeResponse[0].formatted_address;
                        }
                        text = text + '<br>' + 'Alamat : ' + addr;
                    }

                    var infowindow = new google.maps.InfoWindow({ content: text });

                    google.maps.event.addListener(marker, 'click', function () {
                        infowindow.open(map, marker);
                    });
                }


                initialize();


                function cancel() {
                    window.location.replace("http://admin.cargo.totalit.co.id/pos/information");
                }
            </script>
        </div>

        <br />
        <div id="errordiv"></div>

    </div>
    <!-- /#page-wrapper -->
    <div class="modal fade" id="ConfirmDeleteCategory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" style="margin-left: -150px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Delete Confirm</h4>
                </div>
                <div class="modal-body">
                    Are you sure, you want to delete this category?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary" onclick="javascipt:DeleteItemCategory()">Yes</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /#wrapper -->

</asp:Content>
