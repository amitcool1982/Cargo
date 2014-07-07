<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="POS.aspx.cs" Inherits="Cargo.POS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="Content/bootstrap.css">
    <link rel="stylesheet" href="Content/sb-admin.css">
    <link rel="stylesheet" href="Content/font-awesome.min.css">

    <link href="Content/select2.css" rel="stylesheet" />

    <script type="text/javascript" src="Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="Scripts/DT_bootstrap.js"></script>


    <script src="Scripts/select2.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <script type="text/javascript" src="Scripts/POS/POS.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">

            <div class="row">
                <div class="col-lg-12">
                    <h1>Point of Sales <small>List</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">Point of Sales</li>
                    </ol>
                </div>
            </div>
            <div class="row-fluid">
                <a class="btn btn-success" href="PosCompany.aspx">Create New Company POS</a>
                <a class="btn btn-success" href="PosPersonal.aspx">Create New Personal POS</a>
                <div class="span6">
                    <div id="table_filter" class="dataTables_filter">
                        <label>
                            Search:</label>
                        <input id="txtSearch" type="text" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <table id="myTablePOS" aria-describedby="table_info" style="margin-left: 0px; width: 100%;" class="table table-hover table-striped tablesorter dataTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Province</th>
                                <th>City</th>
                                <th>Name</th>
                                <th>Location</th>
                                <th>Address</th>
                                <th>Type</th>
                                <th><i class="fa fa-user"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>

            <br />
            <div id="errordiv"></div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</asp:Content>
