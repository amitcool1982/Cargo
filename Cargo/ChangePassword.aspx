<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Cargo.ChangePassword" %>

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
    <script type="text/javascript" src="../Scripts/Category/Category.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Change Password <small>Config</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">Change Password</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <h3>Form Change Password</h3>
                    <form id="user-form" action="http://admin.cargo.totalit.co.id/config/user/change_password_process" method="POST">
                        <label for="password">Current Password</label>
                        <input required type="password" name="password" id="password" class="form-control" placeholder="Type your current password" />
                        <hr>
                        <label for="new">New Password</label>
                        <input required type="password" name="new" id="new" class="form-control" placeholder="Minimum 6 character" />
                        <label for="confirm">Confirm Password</label>
                        <input required type="password" name="confirm" id="confirm" class="form-control" placeholder="Minimum 6 character" />
                        <br>
                        <button type="submit" class="btn btn-primary">Save</button>
                        <!-- <button type="reset" class="btn btn-warning">Reset</button> -->
                        <button type="button" class="user-show-form btn btn-danger" style="display: none;">Cancel</button>
                    </form>
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
    </div><!-- /#wrapper -->

</asp:Content>
