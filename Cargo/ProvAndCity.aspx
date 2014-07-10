<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="ProvAndCity.aspx.cs" Inherits="Cargo.ProvAndCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link rel="stylesheet" href="Content/bootstrap.css">
    <link rel="stylesheet" href="Content/sb-admin.css">
    <link rel="stylesheet" href="Content/font-awesome.min.css">
    
    <link href="Content/bootstrap-select.css" rel="stylesheet" />

    <script type="text/javascript" src="Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="Scripts/DT_bootstrap.js"></script>    
    <script src="Scripts/bootstrap-select.js"></script>
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
                    <h3>Province <a href="#create-new-province" data-toggle="modal" class="province-show-form" title="Create new province">(+)</a></h3>
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
                    <h3>City <a href="javascript:void(0)" onclick="javascript:LoadNewCityData()" class="city-show-form" data-toggle="tooltip" title="Create new city">(+)</a></h3>
                    <label style="margin-left: 420px">Search:</label>
                    <input id="txtSearchCity" type="text" />
                    <table id="myTableCity" aria-describedby="table_info" style="margin-left: 0px; width: 100%;" class="table table-hover table-striped tablesorter dataTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Province</th>
                                <th>Kota</th>
                                <th><i class="fa fa-user"></i></th>
                                <th></th>
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
        <div class="modal fade" id="create-new-province" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                    <div class="modal-body">  
                        <div class="form-group">
                            <label class="col-sm-3" style="margin-top:5px">Province Name:</label>
                            <input id="provincename" name="name" placeholder="Province Name" class="form-control col-sm-2" style="width:250px" type="text">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-link" onclick="javascript:HideModal()">Close</button>
                        <button type="submit" class="btn btn-primary" onclick="javascript:AddUpdateProvince();">Submit</button>
                    </div>
            </div> <!-- /.modal-content -->
        </div> <!-- /.modal-dialog -->
    </div> <!-- /.modal -->
        <div class="modal fade" id="create-city" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                    <div class="modal-body">  
                        <div class="form-group">
                            <label class="col-sm-3" style="margin-top:5px">Province:</label>
                            <select id="ddlprovince" class="selectpicker form-control col-sm-2" data-width="250px"></select>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3" style="margin-top:5px">City Name:</label>
                            <input id="cityname" name="name" placeholder="Province Name" class="form-control col-sm-2" style="width:250px" type="text">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-link" onclick="javascript:HideCityModal()">Close</button>
                        <button type="submit" class="btn btn-primary" onclick="javascript:AddUpdateCity();">Submit</button>
                    </div>
            </div> <!-- /.modal-content -->
        </div> <!-- /.modal-dialog -->
    </div> <!-- /.modal -->
    </div>
    <!-- /#wrapper -->
</asp:Content>
