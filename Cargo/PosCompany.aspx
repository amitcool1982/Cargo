<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="PosCompany.aspx.cs" Inherits="Cargo.PosCompany" %>

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
    <script type="text/javascript" src="Scripts/PosCompany/PosCompany.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Point of Saless <small>Company Form</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li><a href="POS.aspx"><i class="icon-user"></i>Point of Sales</a></li>
                        <li class="active"><i class="icon-file-alt"></i>Company Form</li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <h3>Form Point of Sales</h3>
                </div>
                <input name="id" type="hidden" value="">
                <div class="col-lg-6">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>Company Information</h4>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="ci_company_name">Company Name :</label>
                                <input id="ci_company_name" required="" name="ci_company_name" value="" placeholder="Type company name here.." type="text" class="form-control input-sm">
                                <label for="ci_year_exist">Exist Year :</label>
                                <input id="ci_year_exist" required="" name="ci_year_exist" value="" placeholder="Year here.." type="year" class="form-control input-sm">
                                <label for="ci_owner">Company Owner :</label>
                                <input id="ci_owner" required="" name="ci_owner" value="" placeholder="Type owner name here.." type="text" class="form-control input-sm">
                                <label for="ci_nationality">Nationality :</label>
                                <select name="ci_nationality" id="ci_nationality" class="show-field form-control input-sm" data-selector="ci_nationality_other" required="">
                                    <option value="">- Select Country -</option>
                                    <option value="WNI">Indonesia</option>
                                    <option value="" selected="selected">Others</option>
                                </select>
                                <input name="ci_nationality_other" type="text" value="" placeholder="Type country here" class="form-control input-sm">
                                <label for="ci_address">Address :</label>
                                <textarea id="ci_address" required="" name="ci_address" class="form-control input-sm" placeholder="Type address item here.."></textarea>
                                <label for="ci_province">Province :</label>
                                <select name="ci_province" id="ci_province" class="province_change form-control input-sm" data-selector="ci_city" required="">
                                    <option value="">- Province -</option>
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
                                <label for="ci_city">City :</label>
                                <select name="ci_city" id="ci_city" class="form-control input-sm" required="">
                                    <option value="">- City -</option>
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
                                <label for="ci_zipcode">ZIP Code :</label>
                                <input id="ci_zipcode" required="" name="ci_zipcode" value="" placeholder="Type zip code here.." type="text" class="form-control input-sm">
                                <label for="ci_email">Email :</label>
                                <input id="ci_email" required="" name="ci_email" value="" placeholder="Type email here.." type="email" class="form-control input-sm">
                                <label for="ci_phone">Phone :</label>
                                <input id="ci_phone" required="" name="ci_phone" value="" placeholder="Type phone here.." type="text" class="form-control input-sm">
                                <label for="ci_fax">Fax :</label>
                                <input id="ci_fax" name="ci_fax" value="" placeholder="Type FAX here.." type="text" class="form-control input-sm">
                                <label for="ci_sector">Bussiness Sector :</label>
                                <input id="ci_sector" required="" name="ci_sector" value="" placeholder="Type Bussiness Sector here.." type="text" class="form-control input-sm">
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
                                <input id="rd_fullname" name="rd_fullname" value="" placeholder="Type name here.." type="text" class="form-control input-sm">
                                <label for="rd_phone">Phone :</label>
                                <input id="rd_phone" name="rd_phone" value="" placeholder="Type valid phone here.." type="text" class="form-control input-sm">
                                <label for="rd_reference">Reference Giver :</label>
                                <select name="rd_reference" id="rd_reference" class="form-control input-sm">
                                    <option value="">- Select Status -</option>
                                    <option value="Karyawan">Karyawan</option>
                                    <option value="Perwakilan">Perwakilan</option>
                                    <option value="Agen Travel">Agen Travel</option>
                                </select>
                                <label for="rd_email">Email :</label>
                                <input id="rd_email" name="rd_email" value="" placeholder="Type valid email here.." type="email" class="form-control input-sm">
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
                                    <input name="pl_location_type_other" type="text" value="" placeholder="Type Location here" class="form-control" style="display: none;">
                                    <br>
                                    <label for="pl_address_location">Address</label>
                                    <textarea name="pl_address_location" id="pl_address_location" class="form-control" cols="50" rows="5"></textarea>
                                    <label for="pl_province">Province :</label>
                                    <select name="pl_province" id="pl_province" class="province_change form-control input-sm" data-selector="pl_city" required="">
                                        <option value="">- Province -</option>
                                    </select>
                                    <label for="pl_city">City :</label>
                                    <select name="pl_city" id="pl_city" class="form-control input-sm" required="">
                                        <option value="">- City -</option>
                                    </select>
                                </div>
                                <div class="col-lg-6">

                                    <label for="pl_zipcode">ZIP Code :</label>
                                    <input id="pl_zipcode" required="" name="pl_zipcode" value="" placeholder="Type zip code here.." type="text" class="form-control input-sm">
                                    <label for="pl_phone">Phone :</label>
                                    <input id="pl_phone" required="" name="pl_phone" value="" placeholder="Type phone here.." type="text" class="form-control input-sm">
                                    <label for="pl_handphone">Handphone :</label>
                                    <input id="pl_handphone" name="pl_handphone" value="" placeholder="Type handphone here.." type="text" class="form-control input-sm">
                                    <label for="pl_fax">Fax :</label>
                                    <input id="pl_fax" name="pl_fax" value="" placeholder="Type FAX here.." type="text" class="form-control input-sm">
                                    <label for="pl_large">Space/Warehouse Wide(m2)</label>
                                    <input id="pl_large" required="" name="pl_large" value="" placeholder="How the space wide?" type="text" class="form-control input-sm">
                                </div>

                            </div>
                            <input name="latlang" id="latlng" class="form-control" placeholder="Latitude/Longitude">

                            Insert google map here
                            
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
                            <input name="id_pos" type="hidden" value="">
                            <input name="company_certificate" type="hidden" value="">
                            <input name="tax_number" type="hidden" value="">
                            <input name="bussiness_license" type="hidden" value="">
                            <input name="id_director" type="hidden" value="">
                            <div id="scs">
                            </div>
                            <div id="result-attach">
                                <h3>Uploaded Attachments :</h3>
                                <li>Company Certificate Empty</li>
                                <li>Tax Number (NPWP) Empty</li>
                                <li>Bussiness License (SIUP) Empty</li>
                                <li>Director Identity Card (KTP Direktur) Empty</li>
                                <br>
                            </div>
                            <label for="akta-notaris">Company Certificate</label>
                            <div id="certificate_button" class="uploadify" style="height: 30px; width: 120px;">
                                <object id="SWFUpload_0" type="application/x-shockwave-flash" data="http://admin.cargo.totalit.co.id/adminbox/uploadify/uploadify.swf?preventswfcaching=1404711450071" width="120" height="30" class="swfupload" style="position: absolute; z-index: 1;">
                                    <param name="wmode" value="transparent">
                                    <param name="movie" value="/adminbox/uploadify/uploadify.swf?preventswfcaching=1404711450071">
                                    <param name="quality" value="high">
                                    <param name="menu" value="false">
                                    <param name="allowScriptAccess" value="always">
                                    <param name="flashvars" value="movieName=SWFUpload_0&amp;uploadURL=%2Fpos%2Finformation%2Fupload_files%3Fname%3Dsertifikat_1404711451&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=timestamp%3D1404711451%26amp%3Btoken%3D352f4d47526a25e67c82c1148020ee3a%26amp%3Bid_exist%3D&amp;filePostName=Filedata&amp;fileTypes=*.*&amp;fileTypesDescription=All%20Files&amp;fileSizeLimit=0&amp;fileUploadLimit=3&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=&amp;buttonWidth=120&amp;buttonHeight=30&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                                </object>
                                <div id="certificate_button-button" class="uploadify-button btn btn-primary btn-block" style="height: 30px; line-height: 30px; width: 120px;"><span class="uploadify-button-text">Browse File</span></div>
                            </div>
                            <div id="certificate_button-queue" class="uploadify-queue"></div>
                            <label for="akta-notaris">Tax Number (NPWP)</label>
                            <div id="tax_button" class="uploadify" style="height: 30px; width: 120px;">
                                <object id="SWFUpload_2" type="application/x-shockwave-flash" data="http://admin.cargo.totalit.co.id/adminbox/uploadify/uploadify.swf?preventswfcaching=1404711450289" width="120" height="30" class="swfupload" style="position: absolute; z-index: 1;">
                                    <param name="wmode" value="transparent">
                                    <param name="movie" value="/adminbox/uploadify/uploadify.swf?preventswfcaching=1404711450289">
                                    <param name="quality" value="high">
                                    <param name="menu" value="false">
                                    <param name="allowScriptAccess" value="always">
                                    <param name="flashvars" value="movieName=SWFUpload_2&amp;uploadURL=%2Fpos%2Finformation%2Fupload_files%3Fname%3Dpajak_1404711451&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=timestamp%3D1404711451%26amp%3Btoken%3D352f4d47526a25e67c82c1148020ee3a%26amp%3Bid_exist%3D&amp;filePostName=Filedata&amp;fileTypes=*.*&amp;fileTypesDescription=All%20Files&amp;fileSizeLimit=0&amp;fileUploadLimit=3&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=&amp;buttonWidth=120&amp;buttonHeight=30&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                                </object>
                                <div id="tax_button-button" class="uploadify-button btn btn-primary btn-block" style="height: 30px; line-height: 30px; width: 120px;"><span class="uploadify-button-text">Browse File</span></div>
                            </div>
                            <div id="tax_button-queue" class="uploadify-queue"></div>
                            <label for="akta-notaris">Bussiness License (SIUP)</label>
                            <div id="license_button" class="uploadify" style="height: 30px; width: 120px;">
                                <object id="SWFUpload_1" type="application/x-shockwave-flash" data="http://admin.cargo.totalit.co.id/adminbox/uploadify/uploadify.swf?preventswfcaching=1404711450215" width="120" height="30" class="swfupload" style="position: absolute; z-index: 1;">
                                    <param name="wmode" value="transparent">
                                    <param name="movie" value="/adminbox/uploadify/uploadify.swf?preventswfcaching=1404711450215">
                                    <param name="quality" value="high">
                                    <param name="menu" value="false">
                                    <param name="allowScriptAccess" value="always">
                                    <param name="flashvars" value="movieName=SWFUpload_1&amp;uploadURL=%2Fpos%2Finformation%2Fupload_files%3Fname%3Dsiup_1404711451&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=timestamp%3D1404711451%26amp%3Btoken%3D352f4d47526a25e67c82c1148020ee3a%26amp%3Bid_exist%3D&amp;filePostName=Filedata&amp;fileTypes=*.*&amp;fileTypesDescription=All%20Files&amp;fileSizeLimit=0&amp;fileUploadLimit=3&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=&amp;buttonWidth=120&amp;buttonHeight=30&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                                </object>
                                <div id="license_button-button" class="uploadify-button btn btn-primary btn-block" style="height: 30px; line-height: 30px; width: 120px;"><span class="uploadify-button-text">Browse File</span></div>
                            </div>
                            <div id="license_button-queue" class="uploadify-queue"></div>
                            <label for="akta-notaris">Director Identity Card Number (No.KTP Direktur)</label>
                            <div id="identity_button" class="uploadify" style="height: 30px; width: 120px;">
                                <object id="SWFUpload_3" type="application/x-shockwave-flash" data="http://admin.cargo.totalit.co.id/adminbox/uploadify/uploadify.swf?preventswfcaching=1404711450358" width="120" height="30" class="swfupload" style="position: absolute; z-index: 1;">
                                    <param name="wmode" value="transparent">
                                    <param name="movie" value="/adminbox/uploadify/uploadify.swf?preventswfcaching=1404711450358">
                                    <param name="quality" value="high">
                                    <param name="menu" value="false">
                                    <param name="allowScriptAccess" value="always">
                                    <param name="flashvars" value="movieName=SWFUpload_3&amp;uploadURL=%2Fpos%2Finformation%2Fupload_files%3Fname%3Ddirektur_1404711451&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=timestamp%3D1404711451%26amp%3Btoken%3D352f4d47526a25e67c82c1148020ee3a%26amp%3Bid_exist%3D&amp;filePostName=Filedata&amp;fileTypes=*.*&amp;fileTypesDescription=All%20Files&amp;fileSizeLimit=0&amp;fileUploadLimit=3&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=&amp;buttonWidth=120&amp;buttonHeight=30&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                                </object>
                                <div id="identity_button-button" class="uploadify-button btn btn-primary btn-block" style="height: 30px; line-height: 30px; width: 120px;"><span class="uploadify-button-text">Browse File</span></div>
                            </div>
                            <div id="identity_button-queue" class="uploadify-queue"></div>
                        </div>
                        <div class="panel-footer">
                            <button type="submit" class="btn btn-success">Save Attachment</button>
                        </div>
                    </div>
                </div>
            </div>
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
