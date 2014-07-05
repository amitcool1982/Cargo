<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Cargo.Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/site.css" rel="stylesheet" />
    <link href="../Content/select2.css" rel="stylesheet" />

    <script type="text/javascript" src="../Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/DT_bootstrap.js"></script>
    <script src="../Scripts/select2.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <script type="text/javascript" src="../Scripts/Customer/Customer.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Customer <small>Information List</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active"><i class="icon-file-alt"></i>Customer</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <table id="myTableCustomer" style="border-style: dotted; border-width: .5px;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Email</th>
                                <th>Full Name</th>
                                <th>Phone</th>
                                <th>City</th>
                                <th>Join</th>
                                <th>Last Login</th>
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
