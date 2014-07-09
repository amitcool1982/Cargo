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

//function DetailCustomer(table, nRow) {
//    debugger;
//    var aData = table.fnGetData(nRow);
//    var jqTds = $('>td', nRow);
//    id = $(aData[0]).text();
//    $('#txtname').val($(aData[2]).text());
//    $('#txtalias').val($(aData[1]).text());
//    $('#save').hide();
//    $('#cancelsave').show();
//}

$(document).on('click', '.detail-customer', function () {
    var id = $(this).attr('data-id');

    var detail = ExecuteSynchronously('Customer.aspx', 'GetCustomerDetails', { Id: id });
    if (detail.d !="") {

        //detail = refreshData.CUS(id);
        //if (detail.status) {
            //var display = '<table>';
            //display += '<tr><td><b>ID</b></td><td>: ' + detail.message.id_generator + '</td></tr>';
            //display += '<tr><td><b>Fullname</b></td><td>: ' + detail.message.nama_lengkap + '</td></tr>';
            //display += '<tr><td><b>Born</b></td><td>: ' + detail.message.tempat_lahir + ', ' + detail.message.tanggal_lahir + '</td></tr>';
            //display += '<tr><td><b>Gender</b></td><td>: ' + detail.message.jenis_kelamin + '</td></tr>';
            //display += '<tr><td><b>Phone</b></td><td>: ' + detail.message.telepon + '</td></tr>';
            //display += '<tr><td><b>Handphone</b></td><td>: ' + detail.message.handphone + '</td></tr>';
            //display += '<tr><td><b>Address</b></td><td>: ' + detail.message.alamat + '</td></tr>';
            //display += '<tr><td><b>Province</b></td><td>: ' + ucwords(str_replace('_', ' ', detail.message.provinsi)) + '</td></tr>';
            //display += '<tr><td><b>City</b></td><td>: ' + ucwords(str_replace('_', ' ', detail.message.kota)) + '</td></tr>';
            //display += '<tr><td><b>Zip Code</b></td><td>: ' + detail.message.kode_pos + '</td></tr>';
            //display += '<tr><td><b>Email</b></td><td>: <a href="mailto:' + detail.message.email + '">' + detail.message.email + '</a></td></tr>';
            //display += '<tr><td><b>join Date</b></td><td>: ' + detail.message.join_datetime + '</td></tr>';
            //display += '<tr><td><b>Last Login</b></td><td>: ' + detail.message.last_login + '</td></tr>';
            //display += '</table>';
            $('#myModalLabelDetail').html('Customer Detail');
            $('#bodyModal').html(detail.d);
            $('#modalDetail').modal({
                keyboard: false
            });
            //message.Clean();

    //    detail = refreshData.CUS(id);
    //if (detail.status) {
    //    var display = '<table>';
    //    display += '<tr><td><b>ID</b></td><td>: ' + detail.message.id_generator + '</td></tr>';
    //    display += '<tr><td><b>Fullname</b></td><td>: ' + detail.message.nama_lengkap + '</td></tr>';
    //    display += '<tr><td><b>Born</b></td><td>: ' + detail.message.tempat_lahir + ', ' + detail.message.tanggal_lahir + '</td></tr>';
    //    display += '<tr><td><b>Gender</b></td><td>: ' + detail.message.jenis_kelamin + '</td></tr>';
    //    display += '<tr><td><b>Phone</b></td><td>: ' + detail.message.telepon + '</td></tr>';
    //    display += '<tr><td><b>Handphone</b></td><td>: ' + detail.message.handphone + '</td></tr>';
    //    display += '<tr><td><b>Address</b></td><td>: ' + detail.message.alamat + '</td></tr>';
    //    display += '<tr><td><b>Province</b></td><td>: ' + ucwords(str_replace('_', ' ', detail.message.provinsi)) + '</td></tr>';
    //    display += '<tr><td><b>City</b></td><td>: ' + ucwords(str_replace('_', ' ', detail.message.kota)) + '</td></tr>';
    //    display += '<tr><td><b>Zip Code</b></td><td>: ' + detail.message.kode_pos + '</td></tr>';
    //    display += '<tr><td><b>Email</b></td><td>: <a href="mailto:' + detail.message.email + '">' + detail.message.email + '</a></td></tr>';
    //    display += '<tr><td><b>join Date</b></td><td>: ' + detail.message.join_datetime + '</td></tr>';
    //    display += '<tr><td><b>Last Login</b></td><td>: ' + detail.message.last_login + '</td></tr>';
    //    display += '</table>';
    //    $('#myModalLabelDetail').html('Customer Detail');
    //    $('#bodyModal').html(display);
    //    $('#modalDetail').modal({
    //        keyboard: false
    //    });
    //    message.Clean();
    }
    else {
        message.Error(response.message);
    }
});



function DeleteCustomer(table, nRow) {
    debugger;
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