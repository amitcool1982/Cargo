<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="Cargo.FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Content/select2.css" rel="stylesheet" />

    <link rel="stylesheet" href="Content/bootstrap.css">
    <link rel="stylesheet" href="Content/sb-admin.css">
    <link rel="stylesheet" href="Content/font-awesome.min.css">


    <link href="css/editor_gecko.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="Scripts/DT_bootstrap.js"></script>
    <script src="Scripts/select2.js"></script>
    <script src="js/ckeditor.js"></script>
    <%--<script>
        CKEDITOR.replace('answer', {
            toolbar: [
                ['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink'],
                ['FontSize', 'TextColor', 'BGColor']
            ]
        });
        CKEDITOR.replace('en_answer', {
            toolbar: [
                ['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink'],
                ['FontSize', 'TextColor', 'BGColor']
            ]
        });

        function CKupdate() {
            for (instance in CKEDITOR.instances)
                CKEDITOR.instances[instance].updateElement();
        }

        function ckInit() {
            var config = {
                toolbar: [
                    ['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink'],
                    ['FontSize', 'TextColor', 'BGColor']
                ]
            };
            $('textarea.ckeditor').each(function () {
                if (typeof (CKEDITOR.instances[this.id]) == 'undefined') {
                    CKEDITOR.replace(this.id, config);
                } else {
                    CKEDITOR.instances[this.id].destroy(true);
                    CKEDITOR.replace(this.id, config);
                }
            });
        }
    </script>--%>

    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <script type="text/javascript" src="Scripts/FAQ/FAQ.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Frequently Asked Question <small>Config</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">Frequently Asked Question</li>
                    </ol>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-6">
                    <label style="margin-left: 430px">Search:</label>
                    <input id="txtSearch" type="text" />
                    <table aria-describedby="table_info" style="margin-left: 0px; width: 100%;" id="myTableFAQ" class="table table-hover table-striped tablesorter dataTable">
                        <thead>
                            <tr style="height: 0px;" role="row">
                                <th>Sort</th>
                                <th>Question</th>
                                <th>Read</th>
                                <th><i class="fa fa-user"></i></th>
                            </tr>
                        </thead>
                        <tbody aria-relevant="all" aria-live="polite" role="alert">
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-6">
                    <h3>Form FAQ</h3>

                    <input name="id" type="hidden">
                    <input name="icon" type="hidden">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Indonesia Version</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="question">Question :</label>
                                <input id="question" name="question" placeholder="Type question here.." class="form-control" type="text">
                                <p class="help-block">Exp : How do I could check my order status?</p>
                            </div>
                            <div class="form-group">
                                <label for="answer">Answer :</label>
                                <textarea id="answer" name="answer" class="form-control" rows="5" placeholder="Type answer from question above here.."></textarea>
                                <%--<div id="cke_answer" class="cke_1 cke cke_reset cke_chrome cke_editor_answer cke_ltr cke_browser_gecko" dir="ltr" role="application" aria-labelledby="cke_answer_arialbl" lang="en">
                                    <span id="cke_answer_arialbl" class="cke_voice_label">Rich Text Editor, answer</span><div class="cke_inner cke_reset" role="presentation">
                                        <span id="cke_1_top" class="cke_top cke_reset_all" role="presentation" style="height: auto; -moz-user-select: none;"><span id="cke_11" class="cke_voice_label">Editor toolbars</span><span id="cke_1_toolbox" class="cke_toolbox" role="group" aria-labelledby="cke_11" onmousedown="return false;"><span id="cke_12" class="cke_toolbar" role="toolbar"><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_13" class="cke_button cke_button__bold  cke_button_off" title="Bold" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_13_label" aria-haspopup="false" onblur="this.style.cssText = this.style.cssText;" onkeydown="return CKEDITOR.tools.callFunction(2,event);" onfocus="return CKEDITOR.tools.callFunction(3,event);" onclick="CKEDITOR.tools.callFunction(4,this);return false;"><span class="cke_button_icon cke_button__bold_icon" style="background-image: url(http://admin.cargo.totalit.co.id/adminbox/ckeditor/plugins/icons.png?t=E3OD); background-position: 0 -24px; background-size: auto;">&nbsp;</span><span id="cke_13_label" class="cke_button_label cke_button__bold_label" aria-hidden="false">Bold</span></a><a id="cke_14" class="cke_button cke_button__italic  cke_button_off" title="Italic" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_14_label" aria-haspopup="false" onblur="this.style.cssText = this.style.cssText;" onkeydown="return CKEDITOR.tools.callFunction(5,event);" onfocus="return CKEDITOR.tools.callFunction(6,event);" onclick="CKEDITOR.tools.callFunction(7,this);return false;"><span class="cke_button_icon cke_button__italic_icon" style="background-image: url(http://admin.cargo.totalit.co.id/adminbox/ckeditor/plugins/icons.png?t=E3OD); background-position: 0 -48px; background-size: auto;">&nbsp;</span><span id="cke_14_label" class="cke_button_label cke_button__italic_label" aria-hidden="false">Italic</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_15" class="cke_button cke_button__numberedlist  cke_button_off" title="Insert/Remove Numbered List" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_15_label" aria-haspopup="false" onblur="this.style.cssText = this.style.cssText;" onkeydown="return CKEDITOR.tools.callFunction(8,event);" onfocus="return CKEDITOR.tools.callFunction(9,event);" onclick="CKEDITOR.tools.callFunction(10,this);return false;"><span class="cke_button_icon cke_button__numberedlist_icon" style="background-image: url(http://admin.cargo.totalit.co.id/adminbox/ckeditor/plugins/icons.png?t=E3OD); background-position: 0 -648px; background-size: auto;">&nbsp;</span><span id="cke_15_label" class="cke_button_label cke_button__numberedlist_label" aria-hidden="false">Insert/Remove Numbered List</span></a><a id="cke_16" class="cke_button cke_button__bulletedlist  cke_button_off" title="Insert/Remove Bulleted List" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_16_label" aria-haspopup="false" onblur="this.style.cssText = this.style.cssText;" onkeydown="return CKEDITOR.tools.callFunction(11,event);" onfocus="return CKEDITOR.tools.callFunction(12,event);" onclick="CKEDITOR.tools.callFunction(13,this);return false;"><span class="cke_button_icon cke_button__bulletedlist_icon" style="background-image: url(http://admin.cargo.totalit.co.id/adminbox/ckeditor/plugins/icons.png?t=E3OD); background-position: 0 -600px; background-size: auto;">&nbsp;</span><span id="cke_16_label" class="cke_button_label cke_button__bulletedlist_label" aria-hidden="false">Insert/Remove Bulleted List</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_17" class="cke_button cke_button__link  cke_button_off" title="Link" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_17_label" aria-haspopup="false" onblur="this.style.cssText = this.style.cssText;" onkeydown="return CKEDITOR.tools.callFunction(14,event);" onfocus="return CKEDITOR.tools.callFunction(15,event);" onclick="CKEDITOR.tools.callFunction(16,this);return false;"><span class="cke_button_icon cke_button__link_icon" style="background-image: url(http://admin.cargo.totalit.co.id/adminbox/ckeditor/plugins/icons.png?t=E3OD); background-position: 0 -528px; background-size: auto;">&nbsp;</span><span id="cke_17_label" class="cke_button_label cke_button__link_label" aria-hidden="false">Link</span></a><a id="cke_18" class="cke_button cke_button__unlink cke_button_disabled " title="Unlink" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_18_label" aria-haspopup="false" aria-disabled="true" onblur="this.style.cssText = this.style.cssText;" onkeydown="return CKEDITOR.tools.callFunction(17,event);" onfocus="return CKEDITOR.tools.callFunction(18,event);" onclick="CKEDITOR.tools.callFunction(19,this);return false;"><span class="cke_button_icon cke_button__unlink_icon" style="background-image: url(http://admin.cargo.totalit.co.id/adminbox/ckeditor/plugins/icons.png?t=E3OD); background-position: 0 -552px; background-size: auto;">&nbsp;</span><span id="cke_18_label" class="cke_button_label cke_button__unlink_label" aria-hidden="false">Unlink</span></a></span><span class="cke_toolbar_end"></span></span></span></span><div style="height: 200px;" id="cke_1_contents" class="cke_contents cke_reset" role="presentation">
                                            <span id="cke_24" class="cke_voice_label">Press ALT 0 for help</span><iframe allowtransparency="true" tabindex="0" aria-describedby="cke_24" title="Rich Text Editor, answer" class="cke_wysiwyg_frame cke_reset" style="width: 100%; height: 100%;" src="" frameborder="0"></iframe>
                                        </div>
                                        <span style="-moz-user-select: none;" id="cke_1_bottom" class="cke_bottom cke_reset_all" role="presentation"><span id="cke_1_resizer" class="cke_resizer cke_resizer_vertical cke_resizer_ltr" title="Resize" onmousedown="CKEDITOR.tools.callFunction(0, event)">◢</span><span id="cke_1_path_label" class="cke_voice_label">Elements path</span><span id="cke_1_path" class="cke_path" role="group" aria-labelledby="cke_1_path_label"><span class="cke_path_empty">&nbsp;</span></span></span>
                                    </div>
                                </div>
                                Insert HTML Editor here--%>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">English Version</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="en_question">Question :</label>
                                <input id="en-question" name="en-question" placeholder="Type question here.." class="form-control" type="text">
                                <p class="help-block">Exp : How do I could check my order status?</p>
                            </div>
                            <div class="form-group">
                                <label for="en_answer">Answer :</label>
                               <textarea id="en-answer" name="en-answer" class="form-control" rows="5" placeholder="Type answer from question above here.."></textarea>
                                <%--<div id="cke_en_answer" class="cke_2 cke cke_reset cke_chrome cke_editor_en_answer cke_ltr cke_browser_gecko" dir="ltr" role="application" aria-labelledby="cke_en_answer_arialbl" lang="en">
                                    <span id="cke_en_answer_arialbl" class="cke_voice_label">Rich Text Editor, en_answer</span><div class="cke_inner cke_reset" role="presentation">
                                        <span id="cke_2_top" class="cke_top cke_reset_all" role="presentation" style="height: auto; -moz-user-select: none;"><span id="cke_27" class="cke_voice_label">Editor toolbars</span><span id="cke_2_toolbox" class="cke_toolbox" role="group" aria-labelledby="cke_27" onmousedown="return false;"><span id="cke_28" class="cke_toolbar" role="toolbar"><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_29" class="cke_button cke_button__bold  cke_button_off" title="Bold" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_29_label" aria-haspopup="false" onblur="this.style.cssText = this.style.cssText;" onkeydown="return CKEDITOR.tools.callFunction(24,event);" onfocus="return CKEDITOR.tools.callFunction(25,event);" onclick="CKEDITOR.tools.callFunction(26,this);return false;"><span class="cke_button_icon cke_button__bold_icon" style="background-image: url(http://admin.cargo.totalit.co.id/adminbox/ckeditor/plugins/icons.png?t=E3OD); background-position: 0 -24px; background-size: auto;">&nbsp;</span><span id="cke_29_label" class="cke_button_label cke_button__bold_label" aria-hidden="false">Bold</span></a><a id="cke_30" class="cke_button cke_button__italic  cke_button_off" title="Italic" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_30_label" aria-haspopup="false" onblur="this.style.cssText = this.style.cssText;" onkeydown="return CKEDITOR.tools.callFunction(27,event);" onfocus="return CKEDITOR.tools.callFunction(28,event);" onclick="CKEDITOR.tools.callFunction(29,this);return false;"><span class="cke_button_icon cke_button__italic_icon" style="background-image: url(http://admin.cargo.totalit.co.id/adminbox/ckeditor/plugins/icons.png?t=E3OD); background-position: 0 -48px; background-size: auto;">&nbsp;</span><span id="cke_30_label" class="cke_button_label cke_button__italic_label" aria-hidden="false">Italic</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_31" class="cke_button cke_button__numberedlist  cke_button_off" title="Insert/Remove Numbered List" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_31_label" aria-haspopup="false" onblur="this.style.cssText = this.style.cssText;" onkeydown="return CKEDITOR.tools.callFunction(30,event);" onfocus="return CKEDITOR.tools.callFunction(31,event);" onclick="CKEDITOR.tools.callFunction(32,this);return false;"><span class="cke_button_icon cke_button__numberedlist_icon" style="background-image: url(http://admin.cargo.totalit.co.id/adminbox/ckeditor/plugins/icons.png?t=E3OD); background-position: 0 -648px; background-size: auto;">&nbsp;</span><span id="cke_31_label" class="cke_button_label cke_button__numberedlist_label" aria-hidden="false">Insert/Remove Numbered List</span></a><a id="cke_32" class="cke_button cke_button__bulletedlist  cke_button_off" title="Insert/Remove Bulleted List" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_32_label" aria-haspopup="false" onblur="this.style.cssText = this.style.cssText;" onkeydown="return CKEDITOR.tools.callFunction(33,event);" onfocus="return CKEDITOR.tools.callFunction(34,event);" onclick="CKEDITOR.tools.callFunction(35,this);return false;"><span class="cke_button_icon cke_button__bulletedlist_icon" style="background-image: url(http://admin.cargo.totalit.co.id/adminbox/ckeditor/plugins/icons.png?t=E3OD); background-position: 0 -600px; background-size: auto;">&nbsp;</span><span id="cke_32_label" class="cke_button_label cke_button__bulletedlist_label" aria-hidden="false">Insert/Remove Bulleted List</span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_33" class="cke_button cke_button__link  cke_button_off" title="Link" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_33_label" aria-haspopup="false" onblur="this.style.cssText = this.style.cssText;" onkeydown="return CKEDITOR.tools.callFunction(36,event);" onfocus="return CKEDITOR.tools.callFunction(37,event);" onclick="CKEDITOR.tools.callFunction(38,this);return false;"><span class="cke_button_icon cke_button__link_icon" style="background-image: url(http://admin.cargo.totalit.co.id/adminbox/ckeditor/plugins/icons.png?t=E3OD); background-position: 0 -528px; background-size: auto;">&nbsp;</span><span id="cke_33_label" class="cke_button_label cke_button__link_label" aria-hidden="false">Link</span></a><a id="cke_34" class="cke_button cke_button__unlink cke_button_disabled " title="Unlink" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_34_label" aria-haspopup="false" aria-disabled="true" onblur="this.style.cssText = this.style.cssText;" onkeydown="return CKEDITOR.tools.callFunction(39,event);" onfocus="return CKEDITOR.tools.callFunction(40,event);" onclick="CKEDITOR.tools.callFunction(41,this);return false;"><span class="cke_button_icon cke_button__unlink_icon" style="background-image: url(http://admin.cargo.totalit.co.id/adminbox/ckeditor/plugins/icons.png?t=E3OD); background-position: 0 -552px; background-size: auto;">&nbsp;</span><span id="cke_34_label" class="cke_button_label cke_button__unlink_label" aria-hidden="false">Unlink</span></a></span><span class="cke_toolbar_end"></span></span></span></span><div style="height: 200px;" id="cke_2_contents" class="cke_contents cke_reset" role="presentation">
                                            <span id="cke_39" class="cke_voice_label">Press ALT 0 for help</span><iframe allowtransparency="true" tabindex="0" aria-describedby="cke_39" title="Rich Text Editor, en_answer" class="cke_wysiwyg_frame cke_reset" style="width: 100%; height: 100%;" src="" frameborder="0"></iframe>
                                        </div>
                                        <span style="-moz-user-select: none;" id="cke_2_bottom" class="cke_bottom cke_reset_all" role="presentation"><span id="cke_2_resizer" class="cke_resizer cke_resizer_vertical cke_resizer_ltr" title="Resize" onmousedown="CKEDITOR.tools.callFunction(22, event)">◢</span><span id="cke_2_path_label" class="cke_voice_label">Elements path</span><span id="cke_2_path" class="cke_path" role="group" aria-labelledby="cke_2_path_label"><span class="cke_path_empty">&nbsp;</span></span></span>
                                    </div>
                                </div>
                                Insert HTML Editor here--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sorting">Sorting :</label>
                        <select name="sorting" id="sorting">
                            <option selected="selected" value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                        <!-- <p class="help-block">Number "1" means will show as first row. if there was similar sorting number then the last data input will show first.</p> -->
                        <p class="help-block">Tips: Lowest number will show first in front-end. Last inputed data will show first in front-end if sorting number was similar. </p>
                    </div>
                    <div class="form-group">
                        <div class="checkbox">
                            <label>
                                <input name="primary" value="1" type="checkbox">
                                Make it top three
                            </label>
                        </div>
                    </div>

                    <style type="text/css">
                        .icon-faq {
                            cursor: pointer;
                            background: #ff5555;
                        }

                        .selected {
                            background: #A22020;
                        }
                    </style>
                    <div class="form-group">
                        <label for="sorting">Select Icon :</label><br>
                        <img src="images/vendor.png" data-value="vendor.png" class="icon-faq">
                        <img src="images/letter.png" data-value="letter.png" class="icon-faq">
                        <img src="images/dollar.png" data-value="dollar.png" class="icon-faq">
                        <img src="images/help.png" data-value="help.png" class="icon-faq">
                        <img src="images/customer2.png" data-value="customer2.png" class="icon-faq">
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary" onclick="javascript:SaveFAQ()">Save</button>
                    <!-- <button type="reset" class="btn btn-warning">Reset</button> -->
                    <button type="button" id="cancel" class="faq-show-form btn btn-danger" style="display: none;"  onclick="javascript:CancelSaveFAQ()">Cancel</button>
                    <br /><div id="divsessionexpired" class="alert alert-warning" style="margin-top: 10px; display: none;">
                <strong id="errormsg"></strong>
            </div>
                </div>
            </div>


            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->
    </div>

    <!-- /#page-wrapper -->
    <div class="modal fade" id="ConfirmDeleteFAQ" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Delete Confirm</h4>
                </div>
                <div class="modal-body">
                    Are you sure, you want to delete this faq?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                    <button type="submit" id="btnDeleteFAQ" class="btn btn-primary">Yes</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /#wrapper -->
</asp:Content>
