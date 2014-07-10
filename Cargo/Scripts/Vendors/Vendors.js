var id = 0;
var table = null;

$(document).ready(function () {
    $('.selectpicker').selectpicker({
        style: 'form-control formcustom',
        size: 4
    });
    $('#phone').mask('000000000000000');
    table = BindCustomerTable();
    $("#txtSearch").keyup(function (event) {
        table.fnDraw();
    });
    $('#myTableCustomer').on("click", "a.edit", function (e) {
        e.preventDefault();
        $("#divsessionexpired").hide();

        /* Get the row as a parent of the link that was clicked on */
        var nRow = $(this).parents('tr')[0];
        editRow(table, nRow);
    });
    BindPageData(-1);
});

function BindPageData(Id) {
    id = 0;
    var res = ExecuteSynchronously('Vendors.aspx', 'GetVendorData', { VendorId: Id });
    PopulateControl('ddlProvince', res.d.Province);
    $('#ddlProvince').selectpicker('refresh');

    PopulateControl('ddlCity', res.d.City);
    $('#ddlCity').selectpicker('refresh');

    $('#name').val(res.d.VendorsName);
    $('#url').val(res.d.VendorsAlias);
    $('#address').val(res.d.VendorsAddress);
    $('#phone').val(res.d.Phone);
    $('#email').val(res.d.Email);
    if (res.d.ImageUrl != '') {
        $('#logopreview').attr('src', res.d.ImageUrl);
    }
    if (res.d.BannerUrl != '') {
        $('#imagepreview').attr('src', res.d.BannerUrl == "" ? "" : res.d.ImageUrl);
    }
}

var BindCustomerTable = function () {


    return $('#myTableCustomer').dataTable({
        "oLanguage": {
            "sZeroRecords": "No records to display"//,

        },
        "aoColumns": [
                     { "sWidth": "2em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "5em", "bSortable": false }
        ],
        "bProcessing": true,
        "bServerSide": true,
        "bStateSave": false,
        "bPaginate": false,
        "bLengthChange": false,//To Hide the Length menu in the Datatables
        "iDisplayLength": Number(PageSize),
        "bAutoWidth": false,
        "bDestroy": true,
        "bDeferRender": true,
        "bFilter": false,
        "bSort": true,
        "sPaginationType": "bs_normal",
        "sAjaxSource": "Vendors.aspx/GetVendors",

        "fnServerData": function (sSource, aoData, fnCallback) {
            aoData.push({ "name": "SearchFilter", "value": $("#txtSearch").val() });
            var data = "{ ";

            for (var i = 0; i < aoData.length; i++) {
                if (aoData[i].name == 'iDisplayLength') {
                    aoData.push({ "name": "PageSize", "value": aoData[i].value });
                }
                if (aoData[i].name == 'iDisplayStart') {
                    aoData.push({ "name": "PageIndex", "value": ((aoData[i].value) + 1) });
                }
                if (aoData[i].name == 'iSortCol_0') {
                    aoData.push({ "name": "SortCol", "value": ((aoData[i].value)) });
                }
                if (aoData[i].name == 'sSortDir_0') {
                    aoData.push({ "name": "SortDir", "value": ((aoData[i].value)) });
                }

                data += aoData[i].name + ": ";
                data += "'" + aoData[i].value + "'";

                if (i != (aoData.length - 1))
                    data += ", ";
            }

            data += " }";
            $.ajax({
                type: "POST",
                url: sSource,
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d != null) {
                        var json = jQuery.parseJSON(msg.d);
                        fnCallback(json);
                        $("#myTableCustomer").show();
                    }

                }
            });
        }

    });

}

function BindataonProvinceChange(obj) {
    var res = ExecuteSynchronously('Vendors.aspx', 'GetCity', { ProvinceId: obj.value });

    PopulateControl('ddlCity', res.d);
    $('#ddlCity').selectpicker('refresh');
}

function SaveVendor() {
    $("#divsessionexpired").hide();
    var strMsg = DataIsValid();
    if (strMsg == '') {
        var Vendor = new Object();
        Vendor.VendorID = id;
        Vendor.CityAlias = $('#ddlCity').val();
        Vendor.ProvinceAlias = $('#ddlProvince').val();
        Vendor.VendorsAlias = $('#url').val().trim();
        Vendor.VendorsName = $('#name').val().trim();
        Vendor.VendorsAddress = $('#address').val().trim();
        Vendor.Email = $('#email').val().trim();
        Vendor.Phone = $('#phone').val().trim();
        Vendor.ImageUrl = '';
        Vendor.BannerUrl = '';
        var res = ExecuteSynchronously('Vendors.aspx', 'SaveUpdateVendorData', { objVendordetail: Vendor });
        if (res.d == 1) {
            table.fnDraw();
            BindPageData(-1);
            $('#errormsg').text("Data updated successfully");
            $("#divsessionexpired").show();
            $('#cancelsave').hide();
        }
    }
    else {
        $('#errormsg').text(strMsg);
        $("#divsessionexpired").show();
    }
}

function DataIsValid() {
    if ($('#ddlProvince').val() == '') {
        return "Province is required"
    }
    if ($('#ddlCity').val() == '') {
        return "City is required"
    }
    if ($('#name').val().trim() == '') {
        return "Vendor's name is required"
    }
    if ($('#url').val().trim() == '') {
        return "URL alias is required"
    }
    if ($('#phone').val().trim() == '') {
        return "Phone is required"
    }
    if ($('#email').val().trim() == '') {
        return "Email is required"
    }
    return '';
}

function editRow(Table, nRow) {
    var aData = Table.fnGetData(nRow);
    var jqTds = $('>td', nRow);
    id = $(aData[0]).text();
    BindPageData(Number(id));
    $('#cancelsave').show();
}