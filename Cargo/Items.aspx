<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="Cargo.Items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Content/bootstrap.css" rel="stylesheet">
    <link href="Content/sb-admin.css" rel="stylesheet">
    <link href="Content/font-awesome.css" rel="stylesheet">

    <script type="text/javascript" src="Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="Scripts/DT_bootstrap.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <script type="text/javascript" src="Scripts/Items/Items.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Item <small>Configuration</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">Item</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8">

                    <div class="row-fluid">
                        <div class="span6"></div>
                        <div class="span6">
                            <div id="table_filter" class="dataTables_filter">
                                <label>Search:
                                    <input id="txtSearch" type="text" /></label>
                            </div>
                        </div>
                    </div>

                    <%--<div class="form-group">
                        <label>Search:</label>
                        <input id="txtSearch" type="text" />
                    </div>--%>
                    <table id="myTableItems" aria-describedby="table_info" style="margin-left: 0px; width: 100%;" class="table table-hover table-striped tablesorter dataTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Vendor</th>
                                <th>Item</th>
                                <th>Price</th>
                                <th><i class="fa fa-user"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">
                    <div>
                        <h3>Form Item</h3>

                        <input name="id" type="hidden">
                        <input name="photo" type="hidden">

                        <div class="form-group">
                            <label for="vendors">Vendors :</label>
                            <select id="ddlVendor" name="ddlVendor" class="form-control" required="">
                                <option selected="selected" value="">- Select Vendors -</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="category">Category Item :</label>
                            <select id="ddlItemCategory" name="ddlItemCategory" class="form-control" required="">
                                <option selected="selected" value="">- Category -</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="name">Items Name :</label>
                            <input id="name" required="" name="name" placeholder="Type item name here.." class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label for="alias">URL Alias :</label>
                            <input id="alias" required="" name="alias" placeholder="URL Alias will autocomplete.." class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label for="description">Description :</label>
                            <textarea id="description" required="" name="description" class="form-control" placeholder="Type description item here.."></textarea>
                        </div>
                        <div class="form-group">
                            <label for="price">Price :</label>
                            <input id="price" required="" name="price" placeholder="Price (Rp)" class="form-control" type="text">
                        </div>
                        <div class="form-group form-inline" id="tag_list">
                            <label for="tags">Tags :</label>
                            <input id="tags" name="tags[]" value="fast-food" type="checkbox">Fast Food                                               
                                <input id="tags" name="tags[]" value="gorengan" type="checkbox">Gorengan                                               
                                <input id="tags" name="tags[]" value="makanan-pedas" type="checkbox">Makanan Pedas                                               
                                <input id="tags" name="tags[]" value="makanan-berat" type="checkbox">Makanan Berat                                               
                                <input id="tags" name="tags[]" value="minuman-spesial" type="checkbox">Minuman Spesial                                           
                        </div>
                        <div class="row">
                            <div class="col-lg-9 col-md-9 col-xs-7">
                                <input id="tags_input" placeholder="Type NEW TAGS here separate by koma(,)" class="form-control input-block input-sm" type="text">
                                <p class="help-block">Exp : Khas Jawa, Mie, Kering, Goreng-gorengan, Asin.</p>
                            </div>
                            <div class="col-lg-3 col-md-3 col-xs-5">
                                <button type="button" id="add_tags" class="btn btn-success btn-sm">Add</button>
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="checkbox">
                                <label>
                                    <input id="recommended" name="recommended" value="1" type="checkbox">
                                    Make this as <strong>RECOMMENDED ITEM</strong>
                                </label>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <h4>Media :</h4>
                            <div id="queue"></div>
                            <div style="height: 30px; width: 120px;" class="uploadify" id="file_upload">
                                <object style="position: absolute; z-index: 1;" id="SWFUpload_0" type="application/x-shockwave-flash" data="images/uploadify.swf" class="swfupload" height="30" width="120">
                                    <param name="wmode" value="transparent">
                                    <param name="movie" value="/adminbox/uploadify/uploadify.swf?preventswfcaching=1404542776024">
                                    <param name="quality" value="high">
                                    <param name="menu" value="false">
                                    <param name="allowScriptAccess" value="always">
                                    <param name="flashvars" value="movieName=SWFUpload_0&amp;uploadURL=%2Fcommerce%2Fitems%2Fupload_image&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=timestamp%3D1404542785%26amp%3Btoken%3D9052908036d32b3f8de089efbb79c035&amp;filePostName=Filedata&amp;fileTypes=*.jpg&amp;fileTypesDescription=Image%20Files&amp;fileSizeLimit=0&amp;fileUploadLimit=0&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=&amp;buttonWidth=120&amp;buttonHeight=30&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                                </object>
                                <div style="height: 30px; line-height: 30px; width: 120px;" class="uploadify-button btn btn-primary btn-block" id="file_upload-button"><span class="uploadify-button-text">Browse Photo</span></div>
                            </div>
                            <div class="uploadify-queue" id="file_upload-queue"></div>
                        </div>
                        <div class="row-fluid">
                            <img id="ItemImageUrl" src="images/no_picture_wide.png" class="img-thumbnail" style="width: 100%;">
                        </div>
                        <br>
                        <button type="submit" class="btn btn-primary" onclick="javascript:SaveItem()">Save</button>
                        <button type="reset" class="btn btn-warning">Reset</button>
                        <button type="button" class="items-show-form btn btn-danger" style="display: none;">Cancel</button>
                    </div>
                </div>
            </div>

            <br />
            <div id="errordiv"></div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</asp:Content>
