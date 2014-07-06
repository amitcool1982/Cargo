<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="ProvAndCity.aspx.cs" Inherits="Cargo.ProvAndCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link rel="stylesheet" href="Content/bootstrap.css">
    <link rel="stylesheet" href="Content/sb-admin.css">
    <link rel="stylesheet" href="Content/font-awesome.min.css">

    <link href="../Content/select2.css" rel="stylesheet" />

    <script type="text/javascript" src="Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="Scripts/DT_bootstrap.js"></script>
    <script src="../Scripts/select2.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <script type="text/javascript" src="Scripts/ProvAndCity/ProvAndCity.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Province & City  <small>Config</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">Province & City</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div style="display: none; width: 96%; position: absolute; background: #222222; z-index: 2; padding: 10px;">

                        <input name="alias" type="hidden">
                        <div class="row-fluid">
                            <div class="col-lg-8">
                                <input name="name" placeholder="Province Name" class="form-control input-sm" type="text">
                            </div>
                            <div class="col-lg-4">
                                <button class="btn btn-primary" type="submit">Submit</button>
                                <button class="btn btn-danger" type="reset" data-ref="province">Close</button>
                            </div>
                        </div>

                    </div>
                    <h3>Province <a href="#create-new-province" class="province-show-form" data-toggle="tooltip" title="Create new province">(+)</a></h3>
                    <label style="margin-left: 420px">Search:</label>
                    <input id="txtSearchProvince" type="text" />
                    <table id="myTableProvince" aria-describedby="table_info" style="margin-left: 0px; width: 100%;" class="table table-hover table-striped tablesorter dataTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Province</th>
                                <th><i class="fa fa-user"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-6">
                    <div style="display: none; width: 96%; position: absolute; background: #222222; z-index: 2; padding: 10px;">

                        <input name="alias" type="hidden">
                        <div class="row-fluid">
                            <div class="col-lg-4">
                                <select name="province" class="form-control input-sm" required="">
                                    <option selected="selected" value="">- Province -</option>
                                </select>
                            </div>
                            <div class="col-lg-4">
                                <input name="city" required="" placeholder="City Name" class="form-control input-sm" type="text">
                            </div>
                            <div class="col-lg-4">
                                <button class="btn btn-primary" type="submit">Submit</button>
                                <button class="btn btn-danger" type="reset" data-ref="city">Close</button>
                            </div>
                        </div>

                    </div>
                    <h3>City <a href="#create-city" class="city-show-form" data-toggle="tooltip" title="Create new city">(+)</a></h3>
                    <label style="margin-left: 420px">Search:</label>
                    <input id="txtSearchCity" type="text" />
                    <table id="myTableCity" aria-describedby="table_info" style="margin-left: 0px; width: 100%;" class="table table-hover table-striped tablesorter dataTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Province</th>
                                <th>Kota</th>
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
