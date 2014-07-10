<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Cargo.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="Content/bootstrap.css">
    <link rel="stylesheet" href="Content/sb-admin.css">
    <link rel="stylesheet" href="Content/font-awesome.min.css">

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
    <script type="text/javascript" src="Scripts/Users/Users.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>User Config <small>Management</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">User Config</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <label style="margin-left: 470px">Search:</label>
                    <input id="txtSearch" type="text" />
                    <table id="myTableUsers" aria-describedby="table_info" style="margin-left: 0px; width: 100%;" class="table table-hover table-striped tablesorter dataTable">
                        <thead>
                            <tr>
                                <th>Sort</th>
                                <th>Name</th>
                                <th>Last Access</th>
                                <th><i class="fa fa-user"></i></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-2" style="display:none">
                    <h2 style="display: inline">Form&nbsp;User</h2>
                    <div class="form-group">
                        <label>Full Name</label><br />
                        <input type="text" class="form-control formcustom" id="txtname" style="width: 250px; line-height: normal" placeholder="Type fullname here.." />
                    </div>
                    <div class="form-group">
                        <label>UserName</label><br />
                        <input type="text" class="form-control formcustom" id="txtalias" style="width: 250px; line-height: normal" placeholder="Username must be unique" />
                    </div>


                    <div class="form-group">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="super" value="1">
                                Set as Super Admin
                            </label>
                        </div>
                    </div>
                    <hr>
                    <div>
                    <h4>Reset Password</h4>
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Minimum 6 character" />
                    <label for="confirm">Confirm Password</label>
                    <input type="password" name="confirm" id="confirm" class="form-control" placeholder="Minimum 6 character" />

                    <br></div>
                    <button type="submit" class="btn btn-primary" onclick="javascript:SaveUsers()">Save</button>
                    <!-- <button type="reset" class="btn btn-warning">Reset</button> -->
                    <button type="button" class="user-show-form btn btn-danger" style="display: none;">Cancel</button>
                        
                </div>
            </div>
        </div>
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
    <!-- /#wrapper -->
    <!-- /#page-wrapper -->
    <div class="modal fade" id="ConfirmDeleteUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Delete Confirm</h4>
                </div>
                <div class="modal-body">
                    Are you sure, you want to delete this user?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                    <button type="submit" id="btnDeleteUser" class="btn btn-primary">Yes</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
