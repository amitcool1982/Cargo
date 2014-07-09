<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="ItemTags.aspx.cs" Inherits="Cargo.ItemTags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Content/bootstrap.css" rel="stylesheet">
    <link href="Content/sb-admin.css" rel="stylesheet">
    <link href="Content/font-awesome.css" rel="stylesheet">

    <script src="Scripts/site.js"></script>
    <script type="text/javascript" src="Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="Scripts/DT_bootstrap.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <script type="text/javascript" src="Scripts/ItemTags/ItemTags.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Item Tags <small>Config</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">Item Tags</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <div class="span6"></div>
                    <div class="span6">
                        <div id="table_filter" class="dataTables_filter">
                            <label>
                                Search: 
                            <input id="txtSearch" type="text" /></label>
                        </div>
                    </div>

                    <table id="myTableItemTags" aria-describedby="table_info" style="margin-left: 0px; width: 100%;" class="table table-hover table-striped tablesorter dataTable">

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
                <div class="col-lg-2">
                    <h2>Form Tags</h2>
                    <div class="form-group">
                        <label>Name</label><br />
                        <input type="text" class="form-control formcustom" id="txtname" required="" onkeyup="javascript:FillAlias()" style="width: 250px; line-height: normal" placeholder="Type tags name here.." />
                    </div>
                    <div class="form-group">
                        <label>URL Alias</label><br />
                        <input type="text" class="form-control formcustom" id="txtalias" required="" style="width: 250px; line-height: normal" placeholder="URL alias will auto complete.." />
                    </div>
                    <button class="btn btn-info" onclick="javascript:SaveItemTag()">Save</button>

                </div>
            </div>

            <br />
            <div id="errordiv"></div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- /#page-wrapper -->
    <div class="modal fade" id="ConfirmDeleteItemTags" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Delete Confirm</h4>
                </div>
                <div class="modal-body">
                    Are you sure, you want to delete this Item Tag?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                    <button type="submit" id="btnDeleteItemTags" class="btn btn-primary">Yes</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /#wrapper -->
</asp:Content>
