<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="BannerAssets.aspx.cs" Inherits="Cargo.BannerAssets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="Content/bootstrap.css">
    <link rel="stylesheet" href="Content/sb-admin.css">
    <link rel="stylesheet" href="Content/font-awesome.min.css">

    <script src="Scripts/site.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/DT_bootstrap.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <style type="text/css">
        .btncustom {
            height: 27px;
            line-height: 10px;
        }
    </style>
    <script type="text/javascript" src="../Scripts/BannerAssets/BannerAssets.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">


            <div class="row">
                <div class="col-lg-12">
                    <h1>Banner Assets <small>List</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="http://admin.cargo.totalit.co.id/config/templates/index.html"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">Banner Assets</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row-fluid">
                <div id="queue"></div>
                <div style="height: 30px; width: 120px;" class="uploadify" id="file_upload">
                    <object style="position: absolute; z-index: 1;" id="SWFUpload_0" type="application/x-shockwave-flash" data="images/uploadify.swf" class="swfupload" height="30" width="120">
                        <param name="wmode" value="transparent">
                        <param name="movie" value="/adminbox/uploadify/uploadify.swf?preventswfcaching=1404542931820">
                        <param name="quality" value="high">
                        <param name="menu" value="false">
                        <param name="allowScriptAccess" value="always">
                        <param name="flashvars" value="movieName=SWFUpload_0&amp;uploadURL=%2Fconfig%2Ftemplates%2Fupload_banner&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=timestamp%3D1404542940%26amp%3Btoken%3D67e955c873aaee13c6aea83629bdcaf9&amp;filePostName=Filedata&amp;fileTypes=*.jpg&amp;fileTypesDescription=Image%20Files&amp;fileSizeLimit=0&amp;fileUploadLimit=0&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=&amp;buttonWidth=120&amp;buttonHeight=30&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                    </object>
                    <div style="height: 30px; line-height: 30px; width: 120px;" class="uploadify-button btn btn-primary btn-block" id="file_upload-button"><span class="uploadify-button-text">SELECT FILES</span></div>
                </div>
                <div class="uploadify-queue" id="file_upload-queue"></div>

            </div>

            <div class="row">
                <div class="col-lg-3">
                    <div class="row-fluid">
                        <img src="images/no_picture.jpg" id="image-preview" class="img-responsive img-thumbnail" width="100%">
                    </div>
                    <div class="row-fluid">
                        <form id="create-banner" action="http://admin.cargo.totalit.co.id/config/templates/create_banner" method="POST">
                            <input name="path" type="hidden">
                            <div class="checkbox">
                                <label>
                                    <input name="activate" value="1" type="checkbox">
                                    Set as Active Banner
                                </label>
                            </div>
                            <button type="submit" class="btn btn-block btn-success">Save Banner</button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-3">
                    <img src="images/timthumb.jpg" class="img-thumbnail">
                    <div class="checkbox">
                        <label>
                            <input name="activate_update" class="update_activation" checked="checked" value="1" data-id="5" type="checkbox">
                            Active/non active banner
                        </label>
                    </div>
                    <button type="button" class="delete-banner btn btn-block btn-danger" data-id="5">Delete Banner</button>
                </div>

                <div class="col-lg-3">
                    <img src="images/timthumb_004.jpg" class="img-thumbnail">
                    <div class="checkbox">
                        <label>
                            <input name="activate_update" class="update_activation" checked="checked" value="1" data-id="8" type="checkbox">
                            Active/non active banner
                        </label>
                    </div>
                    <button type="button" class="delete-banner btn btn-block btn-danger" data-id="8">Delete Banner</button>
                </div>

                <div class="col-lg-3">
                    <img src="images/timthumb_002.jpg" class="img-thumbnail">
                    <div class="checkbox">
                        <label>
                            <input name="activate_update" class="update_activation" value="1" data-id="9" type="checkbox">
                            Active/non active banner
                        </label>
                    </div>
                    <button type="button" class="delete-banner btn btn-block btn-danger" data-id="9">Delete Banner</button>
                </div>

                <div class="col-lg-3">
                    <img src="images/timthumb_003.jpg" class="img-thumbnail">
                    <div class="checkbox">
                        <label>
                            <input name="activate_update" class="update_activation" checked="checked" value="1" data-id="10" type="checkbox">
                            Active/non active banner
                        </label>
                    </div>
                    <button type="button" class="delete-banner btn btn-block btn-danger" data-id="10">Delete Banner</button>
                </div>


            </div>
            <!-- Modal -->
            <div class="modal fade" id="modalConfirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel">Delete Confirm</h4>
                        </div>
                        <div class="modal-body">
                            Are you sure, you want to delete this banner?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                            <button type="button" class="btn btn-primary" id="delete-confirmed">Yes</button>
                        </div>
                    </div>
                </div>
            </div>
            <link href="content/uploadify.css" rel="stylesheet">
            <script src="js/jquery_002.js"></script>
            <script>
                //$(function () {
                //    $("#file_upload").uploadify({
                //        'buttonClass': 'btn btn-primary btn-block',
                //        'fileTypeDesc': 'Image Files',
                //        'fileType': 'image/*',
                //        'fileTypeExts': '*.jpg',
                //        'formData': {
                //            'timestamp': '1404542940',
                //            'token': '67e955c873aaee13c6aea83629bdcaf9'
                //        },
                //        'swf': '/adminbox/uploadify/uploadify.swf',
                //        'uploader': 'upload_banner',
                //        'onUploadSuccess': function (file, data, response) {
                //            var json = $.parseJSON(data);
                //            console.log(json);
                //            console.log(json.message.path);
                //            var base = $('#base').text();
                //            $('img#image-preview').attr('src', base + 'timthumb.php?src=' + base + json.message.path + '&w=245&h=190');

                //            $('form#create-banner input[name="path"]').attr('value', json.message.path);
                //        }
                //    });

                //});

                $(document).ready(function () {
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
                            $('#success-message, #error-message').html('');
                        },
                        Loading: function () {
                            var sel = message.Seletor();
                            sel.hide().html('<img src="../../openbox/images/loader.gif"> Please Wait..').fadeIn('fast');
                        }
                    };

                    $('input[name="name"]').keyup(function () {
                        $('p#caption-preview').html($(this).val());
                    });


                    $('form#create-banner').on('submit', function (event) {
                        event.preventDefault();
                        message.Loading();

                        var banner = $.ajax({
                            type: $(this).attr('method'),
                            url: $(this).attr('action'),
                            dataType: 'json',
                            data: $(this).serialize(),
                            timeout: 15000,
                            beforeSend: function () {
                                message.Loading();
                            }
                        });
                        banner.done(function (response) {
                            if (response.status) {
                                message.Success(response.message);
                                setTimeout(location.reload(), 2000);
                            }
                            else {
                                message.Error(response.message);
                            }
                        });
                        banner.fail(function (xhr, response) {
                            message.Error(response);
                        });
                    });

                    $(document).on('click', '.update_activation', function () {
                        var status = $(this).prop('checked');
                        var update = $.ajax({
                            type: 'post',
                            url: base + 'config/templates/update_banner',
                            dataType: 'json',
                            data: { status: status, id: $(this).attr('data-id') },
                            timeout: 15000,
                            beforeSend: function () {
                                message.Loading();
                            }
                        });
                        update.done(function (response) {
                            if (response.status) {
                                message.Success(response.message);
                            }
                            else {
                                message.Error(response.message);
                            }
                        });
                        update.fail(function (xhr, response) {
                            message.Error(response);
                        });
                    });

                    $(document).on('click', '.delete-banner', function () {
                        var id = $(this).attr('data-id');
                        $('#delete-confirmed').attr('data-id', id);
                        $('#modalConfirmDelete').modal({
                            keyboard: false
                        });
                    });

                    $('#modalConfirmDelete').on('click', '#delete-confirmed', function () {
                        var status = $(this).prop('checked');
                        var update = $.ajax({
                            type: 'get',
                            url: base + 'config/templates/delete_banner',
                            dataType: 'json',
                            data: { id: $(this).attr('data-id') },
                            timeout: 15000,
                            beforeSend: function () {
                                message.Loading();
                            }
                        });
                        update.done(function (response) {
                            if (response.status) {
                                message.Success(response.message);
                                setTimeout(location.reload(), 2000);
                            }
                            else {
                                message.Error(response.message);
                            }
                        });
                        update.fail(function (xhr, response) {
                            message.Error(response);
                        });
                        $('#modalConfirmDelete').modal('hide');
                    });

                });



            </script>
        </div>
        <!-- /#page-wrapper -->

    </div>

    <br />
    <div id="errordiv"></div>
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
    </div><!-- /#wrapper -->

</asp:Content>
