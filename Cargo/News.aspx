<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Cargo.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/site.css" rel="stylesheet" />
    <link href="../Content/select2.css" rel="stylesheet" />

    <link rel="stylesheet" href="Content/bootstrap.css">
    <link rel="stylesheet" href="Content/sb-admin.css">
    <link rel="stylesheet" href="Content/font-awesome.min.css">

    <script type="text/javascript" src="../Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/DT_bootstrap.js"></script>
    <script src="../Scripts/select2.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <script type="text/javascript" src="../Scripts/News/News.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>News <small>List</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">News</li>
                    </ol>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-6">
                    <table aria-describedby="table_info" style="margin-left: 0px; width: 100%;" id="myTableNews" class="table table-hover table-striped tablesorter dataTable">
                        <thead>
                            <tr style="height: 0px;" role="row">
                                <th>Sort</th>
                                <th>Title News</th>
                                <th>Read</th>
                                <th><i class="fa fa-user"></i></th>
                            </tr>
                        </thead>
                        <tbody aria-relevant="all" aria-live="polite" role="alert">
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-6">
                    <h3>Form News</h3>
                    <div>
                        <input name="id" type="hidden">
                        <input name="picture" type="hidden">
                        <input name="online" type="hidden">
                        <input name="schedule" type="hidden">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Indonesia Version</h3>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="title">Title :</label>
                                    <input id="title" name="title" placeholder="Type title news here.." class="form-control" type="text">
                                    <p class="help-block">Exp : Our services accross nations, fast and secure.</p>
                                </div>
                                <div class="form-group">
                                    <label for="alias">URL Alias :</label>
                                    <input id="alias" name="alias" placeholder="URL Alias will autocomplete.." class="form-control" type="text">
                                </div>
                                <div class="form-group">
                                    <label for="content">Content :</label>
                                    HTML Editor need to add here
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">English Version</h3>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="en_title">Title :</label>
                                    <input id="en_title" name="en_title" placeholder="Type title news here.." class="form-control" type="text">
                                    <p class="help-block">Exp : Our services accross nations, fast and secure.</p>
                                </div>
                                <div class="form-group">
                                    <label for="en_alias">URL Alias :</label>
                                    <input id="en_alias" name="en_alias" placeholder="URL Alias will autocomplete.." class="form-control" type="text">
                                </div>
                                <div class="form-group">
                                    <label for="en_content">Content :</label>
                                    HTML Editor need to add here
                                </div>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div id="queue"></div>
                            <div style="height: 30px; width: 120px;" class="uploadify" id="file_upload">
                                <object style="position: absolute; z-index: 1;" id="SWFUpload_0" type="application/x-shockwave-flash" data="images/uploadify.swf" class="swfupload" height="30" width="120">
                                    <param name="wmode" value="transparent">
                                    <param name="movie" value="/adminbox/uploadify/uploadify.swf?preventswfcaching=1404542896589">
                                    <param name="quality" value="high">
                                    <param name="menu" value="false">
                                    <param name="allowScriptAccess" value="always">
                                    <param name="flashvars" value="movieName=SWFUpload_0&amp;uploadURL=%2Fpages%2Fnews%2Fupload_image&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=timestamp%3D1404542903%26amp%3Btoken%3D133d53061bc340e0a365f4315320f205&amp;filePostName=Filedata&amp;fileTypes=*.jpg&amp;fileTypesDescription=Image%20Files&amp;fileSizeLimit=0&amp;fileUploadLimit=1&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=&amp;buttonWidth=120&amp;buttonHeight=30&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                                </object>
                                <div style="height: 30px; line-height: 30px; width: 120px;" class="uploadify-button btn btn-primary btn-block" id="file_upload-button"><span class="uploadify-button-text">Browse Picture</span></div>
                            </div>
                            <div class="uploadify-queue" id="file_upload-queue"></div>
                        </div>
                        <div class="row-fluid">
                            <img id="image-preview" class="show_load" src="images/no_picture_wide.png" style="width: 100%;">
                        </div>
                        <br>
                        <div class="form-group row col-lg-5" style="display: none;">
                            <div class="input-group" id="schedule-form">
                                <input name="time_schedule" class="form-control" placeholder="Date Schedule">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            </div>
                        </div>
                        <div class="row-fluid text-right">
                            <input name="action" value="Publish" class="btn btn-success" type="submit">
                            <input name="action" value="Draft" class="btn btn-warning" type="submit">
                            <!-- <button type="button" class="schedule-show btn btn-info">Schedule</button> -->
                            <button type="button" class="news-show-form btn btn-danger" style="display: none;">Cancel</button>
                        </div>

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
