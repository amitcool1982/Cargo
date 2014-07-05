<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Cargo.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/site.css" rel="stylesheet" />
    <link href="../Content/select2.css" rel="stylesheet" />
    
    <script type="text/javascript"  src="../Scripts/jquery.dataTables.js"></script>
    <script type="text/javascript"  src="../Scripts/DT_bootstrap.js"></script>
    <script src="../Scripts/select2.js"></script>
    <script type="text/javascript">
        var PageSize = "<%=PageSize%>";
    </script>
    <script type="text/javascript" src="../Scripts/Category/Category.js"></script>
    
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
    <div id="page-wrapper">
        <div class="row">
        <div class="col-lg-12">
            <h1>Item Category <small>Config</small></h1>
            <ol class="breadcrumb">
              <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i> Dashboard</a></li>
              <li class="active"> Category</li>
            </ol>
          </div>
            </div>
        
        <div class="row">
            <div class="col-lg-8">
                <table  id="myTableCategory" style="border-style:dotted;border-width:.5px;">
            <thead >
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
                <h2>Form Category</h2>
                <div class="form-group">
                    <label>Name</label><br />
                    <input type="text" class="form-control formcustom" style="width:250px;line-height:normal" placeholder="Type category name here.."/>
                </div>
                <div class="form-group">
                    <label>Alias</label><br />
                    <input type="text" class="form-control formcustom" style="width:250px;line-height:normal" placeholder="URL alias will auto complete.."/>
                </div>
                <button class="btn btn-info">Save</button>

            </div>
        </div>     		
            
        <br />  
        <div id="errordiv">  </div> 
     </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->
</asp:Content>
