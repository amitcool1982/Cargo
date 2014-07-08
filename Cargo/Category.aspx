<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Cargo.Category" %>

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
    <script type="text/javascript" src="../Scripts/Category/Category.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Item Category <small>Config</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">Category</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-7">
                    <label style="margin-left: 420px">Search:</label>
                    <input id="txtSearch" type="text" />
                    <table id="myTableCategory" aria-describedby="table_info" style="margin-left: 0px; width: 100%;" class="table table-hover table-striped tablesorter dataTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Alias</th>
                                <th>Name</th>
                                <th><i class="fa fa-user"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-5">
                    <h2 style="display: inline">Form&nbsp;Category</h2>
                    <div class="form-group">
                        <label>Name</label><br />
                        <input type="text" class="form-control formcustom" id="txtname" onkeyup="javascript:FillAlias()" style="width: 430px; line-height: normal"
                            placeholder="Type category name here.." />
                    </div>
                    <div class="form-group">
                        <label>Alias</label><br />
                        <input type="text" class="form-control formcustom" id="txtalias" style="width: 430px; line-height: normal" placeholder="URL alias will auto complete.." />
                    </div>
                    <div id="save" style="width: 300px">
                        <button type="submit" onclick="javascript:SaveCategory(0)" class="btn btn-info btncustom">Save</button>
                    </div>
                    <div id="cancelsave" style="width: 300px; display: none">
                        <a href="javascript:void(0)" onclick="javascript:void(0)" class="btn btn-danger btncustom">Cancel</a>
                        <%--<button type="submit" id="btnViewMap" name="btnCancel" class="btn btn-info btncustom" style="border:1px solid red;" >View Map</button>--%>
                        <button type="submit" onclick="javascript:SaveCategory(1)" class="btn btn-info btncustom">Save</button>
                    </div>
                    <div id="divsessionexpired" class="alert alert-warning" style="margin-top: 10px;display:none;">
                        <strong id="errormsg"></strong>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <div id="errordiv"></div>

    </div>
    <!-- /#page-wrapper -->
    <div class="modal fade" id="ConfirmDeleteCategory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
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
                    <button type="submit" id="btnDeleteCategory" class="btn btn-primary">Yes</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /#wrapper -->

</asp:Content>
