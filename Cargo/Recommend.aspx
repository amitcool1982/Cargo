<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="Recommend.aspx.cs" Inherits="Cargo.Recommend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Content/select2.css" rel="stylesheet" />

    <link rel="stylesheet" href="Content/bootstrap.css">
    <link rel="stylesheet" href="Content/sb-admin.css">
    <link rel="stylesheet" href="Content/font-awesome.css">

    <script type="text/javascript" src="Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="Scripts/DT_bootstrap.js"></script>
    <script src="Scripts/select2.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <script type="text/javascript" src="Scripts/Recommend/Recommend.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Recommendation <small>List</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">Recommendation</li>
                    </ol>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-6">
                    <div class="span6"></div>
                    <div class="span6">
                        <div id="table_filter" class="dataTables_filter">
                            <label>
                                Search: 
                            <input id="txtSearch" type="text" /></label>
                        </div>
                    </div>
                    <table aria-describedby="table_info" style="margin-left: 0px; width: 100%;" id="myTableRecommend" class="table table-hover table-striped tablesorter dataTable">
                        <thead>
                            <tr style="height: 0px;" role="row">
                                <th>Sort</th>
                                <th>Vendor Name</th>
                                <th>Item Name</th>
                                <th><i class="fa fa-user"></i></th>
                            </tr>
                        </thead>
                        <tbody aria-relevant="all" aria-live="polite" role="alert">
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-6">


                    <%-- <div id="item-detail">
                    </div>--%>



                    <div id="modalDetail" tabindex="-1" style="visibility: hidden">

                        <div class="modal-header">

                            <h4 class="modal-title" id="myModalLabelDetail"></h4>
                        </div>
                        <div id="bodyModal">
                        </div>

                    </div>



                    <!-- /#page-wrapper -->

                </div>
                <!-- /#wrapper -->
            </div>

            <!-- /#page-wrapper -->
            <div class="modal fade" id="ConfirmDeleteRecommended" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Delete Confirm</h4>
                        </div>
                        <div class="modal-body">
                            Are you sure, you want to delete this Recommended Item?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                            <button type="submit" id="btnDeleteRecommended" class="btn btn-primary">Yes</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#wrapper -->

            <!-- Modal -->
</asp:Content>
