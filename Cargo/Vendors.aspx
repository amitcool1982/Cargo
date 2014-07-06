<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="Vendors.aspx.cs" Inherits="Cargo.Vendors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="Content/bootstrap.css">
    <link rel="stylesheet" href="Content/sb-admin.css">
    <link rel="stylesheet" href="Content/font-awesome.css">

    <script type="text/javascript" src="Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="Scripts/DT_bootstrap.js"></script>
    <script src="../Scripts/select2.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <script type="text/javascript" src="../Scripts/Vendors/Vendors.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Vendors <small>Information List</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">Vendors</li>
                    </ol>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-5">
                    <div class="span6"></div>
                    <div class="span6">
                        <div id="table_filter" class="dataTables_filter">
                            <label>Search: 
                            <input id="txtSearch" type="text" /></label>
                        </div>
                    </div>
                    <table aria-describedby="table_info" style="margin-left: 0px; width: 100%;" id="myTableCustomer" class="table table-hover table-striped tablesorter dataTable">
                        <thead>
                            <tr style="height: 0px;" role="row">
                                <th>ID</th>
                                <th>Vendors</th>
                                <th><i class="fa fa-user"></i></th>
                            </tr>
                        </thead>
                        <tbody aria-relevant="all" aria-live="polite" role="alert">
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-7">
                    <h3>Form Vendors</h3>
                    <div class="row">
                        <div class="col-lg-3">
                            <div id="queueLogo"></div>
                            <div style="height: 30px; width: 120px;" class="uploadify" id="logo_upload">
                                <object style="position: absolute; z-index: 1;" id="SWFUpload_0" type="application/x-shockwave-flash" data="images/uploadify_002.swf" class="swfupload" height="30" width="120">
                                    <param name="wmode" value="transparent">
                                    <param name="movie" value="/adminbox/uploadify/uploadify.swf?preventswfcaching=1404542736395">
                                    <param name="quality" value="high">
                                    <param name="menu" value="false">
                                    <param name="allowScriptAccess" value="always">
                                    <param name="flashvars" value="movieName=SWFUpload_0&amp;uploadURL=%2Fcommerce%2Fvendors%2Fupload_image%3Fref%3Dlogo&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=timestamp%3D1404542744%26amp%3Btoken%3D9765608a2246133d9b94b034470a455f&amp;filePostName=Filedata&amp;fileTypes=*.jpg&amp;fileTypesDescription=Image%20Files&amp;fileSizeLimit=100&amp;fileUploadLimit=0&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=&amp;buttonWidth=120&amp;buttonHeight=30&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                                </object>
                                <div style="height: 30px; line-height: 30px; width: 120px;" class="uploadify-button btn btn-primary btn-block" id="logo_upload-button"><span class="uploadify-button-text">Browse Logo</span></div>
                            </div>
                            <div class="uploadify-queue" id="logo_upload-queue"></div>
                        </div>
                        <div class="col-lg-3">
                            <div id="queueBanner"></div>
                            <div style="height: 30px; width: 120px;" class="uploadify" id="banner_upload">
                                <object style="position: absolute; z-index: 1;" id="SWFUpload_1" type="application/x-shockwave-flash" data="images/uploadify.swf" class="swfupload" height="30" width="120">
                                    <param name="wmode" value="transparent">
                                    <param name="movie" value="/adminbox/uploadify/uploadify.swf?preventswfcaching=1404542736405">
                                    <param name="quality" value="high">
                                    <param name="menu" value="false">
                                    <param name="allowScriptAccess" value="always">
                                    <param name="flashvars" value="movieName=SWFUpload_1&amp;uploadURL=%2Fcommerce%2Fvendors%2Fupload_image%3Fref%3Dbanner&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=timestamp%3D1404542744%26amp%3Btoken%3D9765608a2246133d9b94b034470a455f&amp;filePostName=Filedata&amp;fileTypes=*.jpg&amp;fileTypesDescription=Image%20Files&amp;fileSizeLimit=0&amp;fileUploadLimit=0&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=&amp;buttonWidth=120&amp;buttonHeight=30&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                                </object>
                                <div style="height: 30px; line-height: 30px; width: 120px;" class="uploadify-button btn btn-primary btn-block" id="banner_upload-button"><span class="uploadify-button-text">Browse Banner</span></div>
                            </div>
                            <div class="uploadify-queue" id="banner_upload-queue"></div>
                        </div>
                    </div>
                    <div>
                        <input name="id" type="hidden">
                        <input name="logo" type="hidden">
                        <input name="banner" type="hidden">
                        <div class="form-inline form-group">
                            <div class="form-group">
                                <label for="province">Province :</label>
                                <select name="province" class="province_change form-control" data-selector="city" required="">
                                    <option selected="selected" value="">- Province -</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="city">City :</label>
                                <select name="city" class="form-control" required="">
                                    <option selected="selected" value="">- City -</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name">Vendors Name :</label>
                            <input id="name" required="" name="name" placeholder="Type vendor name here.." class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label for="url">URL Alias :</label>
                            <input id="url" required="" name="url" placeholder="URL Alias will autocomplete.." class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label for="address">Address :</label>
                            <textarea id="address" required="" name="address" class="form-control" placeholder="Type complete address here.."></textarea>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <img id="logo-preview" src="images/no_picture.jpg" style="width: 200px; height: 100px;">
                            </div>
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <label for="phone">Phone :</label>
                                    <input id="phone" required="" name="phone" placeholder="Phone or Handphone" class="form-control" type="text">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email :</label>
                                    <input id="email" required="" name="email" placeholder="Type valid email here.." class="form-control" type="text">
                                </div>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <img id="image-preview" src="images/no_picture_wide.png" class="img-thumbnail" style="width: 100%;">
                        </div>
                        <br>
                        <button type="submit" class="btn btn-primary">Save</button>
                        <button type="reset" class="btn btn-warning">Reset</button>
                        <button type="button" class="vendors-show-form btn btn-danger" style="display: none;">Cancel</button>


                    </div>

                    <br />
                    <div id="errordiv"></div>
                </div>
            </div>


            <!-- /#page-wrapper -->

        </div>
    <!-- /#wrapper -->
    </div>
</asp:Content>
