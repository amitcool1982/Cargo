<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="ItemPromotion.aspx.cs" Inherits="Cargo.ItemPromotion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Content/bootstrap.css" rel="stylesheet">
    <link href="Content/site.css" rel="stylesheet" />
    <link href="Content/sb-admin.css" rel="stylesheet">
    <link href="Content/font-awesome.css" rel="stylesheet">

    <script src="Scripts/site.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/DT_bootstrap.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <script type="text/javascript" src="../Scripts/ItemPromotion/ItemPromotion.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Promotion <small>Configuration</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active">Promotion</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-9">
                    <div class="form-group">
                        <label>Search:</label>
                        <input id="txtSearch" type="text" />
                    </div>
                    <table id="myTableItemPromotion" aria-describedby="table_info" style="margin-left: 0px; width: 100%;" class="table table-hover table-striped tablesorter dataTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Item</th>
                                <th>Promo</th>
                                <th>Dsc(%)</th>
                                <th>Start Promos</th>
                                <th>End Promo</th>
                                <th><i class="fa fa-user"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-3">
                    <div>
                        <h3>Form Item</h3>
                        <input name="id" value="" type="hidden">
                        <input name="activate" value="" type="hidden">
                        <div class="form-group">
                            <label for="id">ID Item :</label>
                            <input id="id" required="" name="id_menu" placeholder="Type ID Item here.." class="form-control" type="text">
                            <!-- <p class="help-block" style="font-size:11px;"></p> -->
                        </div>
                        <div class="form-group">
                            <label for="type">Promo :</label>
                            <select id="type" name="type_promo" class="form-control" style="width: 100%;">
                                <option selected="selected" value="">- Promo Type -</option>
                                <option value="od">Discount Promo</option>
                                <!-- <option value="dso">Discount &amp; Special Offer</option>
                            <option value="so">Special Offer Promo</option> -->
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="description">Description Promo :</label>
                            <textarea id="description" name="description_promo" class="form-control" placeholder="Description promo or special offer" style="width: 100%;"></textarea>
                            <p class="help-block" style="font-size: 11px;">Tips: Make sure this special offer description matched with your real promotion</p>
                        </div>
                        <div class="form-group">
                            <label for="discount">Discount :</label>
                            <input id="discount" min="0" max="100" step="5" name="discount" class="form-control" placeholder="discount" style="width: 100px;" type="number">
                        </div>
                        <div class="form-group">
                            <label for="start">Start Promo at :</label>
                            <input id="start" name="start_promo" class="form-control" placeholder="Start promo datetime" style="width: 100%;" type="datetime-local">
                        </div>
                        <div class="form-group">
                            <label for="end">End Promo at :</label>
                            <input id="end" name="end_promo" class="form-control" placeholder="End promo datetime" style="width: 100%;" type="datetime-local">
                        </div>
                        <br>
                        <button type="submit" class="btn-promo btn btn-success">Submit</button>
                        <button type="button" class="promotion-show-form btn btn-danger" style="display: none;">Cancel</button>
                    </div>
                </div>
            </div>

            <br />
            <div id="errordiv"></div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</asp:Content>
