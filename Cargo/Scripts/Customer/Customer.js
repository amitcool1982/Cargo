var table = null;
var id = 0;
$(document).ready(function () {
    table = BindCustomerTable();
    $("#txtSearch").keyup(function (event) {
        table.fnDraw();
    });

    //$('#myTableCustomer').on("click", "a.edit", function (e) {
    //    e.preventDefault();
    //    $("#divsessionexpired").hide();

    //    /* Get the row as a parent of the link that was clicked on */
    //    var nRow = $(this).parents('tr')[0];
    //    DetailCustomer(table, nRow);
    //});

    $('#myTableCustomer').on("click", "a.delete", function (e) {
        e.preventDefault();
        $("#divsessionexpired").hide();
        var nRow = $(this).parents('tr')[0];

        DeleteCustomer(table, nRow);
    });
});

var BindCustomerTable = function () {


    return $('#myTableCustomer').dataTable({
        "oLanguage": {
            "sZeroRecords": "No records to display"//,

        },
        "aoColumns": [
                     { "sWidth": "3em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "6em", "bSortable": true },
                     { "sWidth": "5em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "5em", "bSortable": false }
        ],
        "bProcessing": true,
        "bServerSide": true,
        "bStateSave": false,
        "bPaginate": true,
        "bLengthChange": false,//To Hide the Length menu in the Datatables
        "iDisplayLength": Number(PageSize),
        "bAutoWidth": false,
        "bDestroy": true,
        "bDeferRender": true,
        "bFilter": false,
        "bSort": true,
        "sPaginationType": "bs_normal",
        "sAjaxSource": "Customer.aspx/GetCustomers",

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

$(document).on('click', '.detail', function () {
    var id = $(this).attr('data-id');

    var detail = ExecuteSynchronously('Customer.aspx', 'GetCustomerDetails', { Id: id });
    if (detail.d != "") {
        $('#myModalLabelDetail').html('Customer Detail');
        $('#bodyModal').html(detail.d);
        $('#modalDetail').modal({
            keyboard: false
        });
    }
    else {
        message.Error(response.message);
    }
});



function DeleteCustomer(table, nRow) {
    var aData = table.fnGetData(nRow);
    $('#ConfirmDeleteCustomer').modal('show');

    $('#btnDeleteCustomer').on("click", function (e) {
        try {
            var res = ExecuteSynchronously('Customer.aspx', 'DeleteCustomer', { Id: $(aData[0]).text() });
            if (res.d == 1) {
                $('#ConfirmDeleteCustomer').modal('hide');
                table.fnDraw();
            }
        }
        catch (e) {
            alert(e.message);
        }
    });

}