<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Cargo.Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="Content/bootstrap.css">
    <link rel="stylesheet" href="Content/sb-admin.css">
    <link rel="stylesheet" href="Content/font-awesome.min.css">

    <script type="text/javascript" src="Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="Scripts/DT_bootstrap.js"></script>
    <script src="Scripts/select2.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <script type="text/javascript" src="Scripts/Customer/Customer.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Customer <small>Information list</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">Customer</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">

                    <div class="row">
                        <div class="col-lg-6 col-xs-6 pad-15">
                            <div class="dataTables_length" id="table_length">
                                <label>
                                    <select aria-controls="table" size="1" name="table_length">
                                        <option selected="selected" value="10">10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select></label>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xs-6">
                            <div id="table_filter" class="dataTables_filter">
                                <label>
                                    Search:
                                    <input id="txtSearch" type="text" /></label>
                            </div>
                        </div>
                    </div>

                    <table id="myTableCustomer" aria-describedby="table_info" style="margin-left: 0px; width: 100%;" class="table table-hover table-striped tablesorter dataTable">
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
    </div>

    <!-- /#page-wrapper -->
    <div class="modal fade" id="ConfirmDeleteCustomer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Delete Confirm</h4>
                </div>
                <div class="modal-body">
                    Are you sure, you want to delete this customer?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                    <button type="submit" id="btnDeleteCustomer" class="btn btn-primary">Yes</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /#wrapper -->

    <!-- Modal -->
        <div class="modal fade" id="modalDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-sm">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelDetail"></h4>
              </div>
              <div class="modal-body" id="bodyModal">
                
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>


    
</asp:Content>
