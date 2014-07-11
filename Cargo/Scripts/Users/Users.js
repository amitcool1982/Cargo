var table = null;
var id = 0;
$(document).ready(function () {
    table = BindUsersTable();
    $("#txtSearch").keyup(function (event) {
        table.fnDraw();
    });

    $('#myTableUsers').on("click", "a.edit", function (e) {
        e.preventDefault();       

        /* Get the row as a parent of the link that was clicked on */
        var nRow = $(this).parents('tr')[0];
        editRow(table, nRow);
    });

    $('#myTableUsers').on("click", "a.delete", function (e) {
        e.preventDefault();
        var nRow = $(this).parents('tr')[0];

        DeleteUser(table, nRow);
    });
});

var BindUsersTable = function () {


    return $('#myTableUsers').dataTable({
        "oLanguage": {
            "sZeroRecords": "No records to display"//,

        },
        "aoColumns": [
                     { "sWidth": "5em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "5em", "bSortable": false },
                     { "sWidth": "1em", "bSortable": false },
                     { "sWidth": "1em", "bSortable": false }
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
        "sAjaxSource": "Users.aspx/GetUsers",

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
                        $("#myTableUsers").show();
                    }

                }
            });
        }

    });

}

function editRow(table, nRow) {
    var aData = table.fnGetData(nRow);
    var jqTds = $('>td', nRow);
    id = $(aData[0]).text();
    $('#txtname').val($(aData[1]).text());
    $('#txtalias').val($(aData[4]).text());
    
    if ($(aData[5]).text() == 1)
    { $('input[name=IsSuper]').attr('checked', true); }
    else {
        $('input[name=IsSuper]').attr('checked', false);
    }



    $('#save').hide();
    $('#cancelsave').show();
}

function SaveUsers() {
    
    //$('input[name=IsSuper]').is(':checked') 
    //$('input[name=IsSuper]').attr('checked') 


    $("#divsessionexpired").hide();
    if ($('#txtalias').val().trim() != '' && $('#txtname').val().trim() != '' && ($.trim($("#Password").val()).length > 6  || $.trim($("#Password").val()).length > 6)) {
        var res = null;
        if (id == 0) {
            res = ExecuteSynchronously('Users.aspx', 'AddUsers', { Name: $("#txtname").val().trim(), Alias: $("#txtalias").val().trim(), IsSuper: $("#IsSuper").val(), Alias: $("#Password").val() });
        }
        else {
            res = ExecuteSynchronously('Users.aspx', 'UpdateUsers', { Name: $("#txtname").val().trim(), Alias: $("#txtalias").val().trim(), IsSuper: $("#IsSuper").val(), Alias: $("#Password").val(), Id: Number(id) });
        }
        if (res.d == 1) {
            table.fnDraw();
            $('#txtalias').val('');
            $('#txtname').val('');
            id = 0;
        }
    }
    else {
        if ($('#txtname').val().trim() == '') {
            $('#errormsg').text("FullName is required");
            $("#divsessionexpired").show();
        }
        else if ($('#txtname').val().trim() == '') {
            $('#errormsg').text("UserName is required");
            $("#divsessionexpired").show();
        }
        else if ($('#Password').val() != '' && $.trim($("#Password").val()).length < 6) {
            $('#errormsg').text("Password must be more than 6 characters");
            $("#divsessionexpired").show();
        }
    }
}





function DeleteUser(table, nRow) {
    var aData = table.fnGetData(nRow);
    $('#ConfirmDeleteUser').modal('show');

    $('#btnDeleteUser').on("click", function (e) {
        try {
            var res = ExecuteSynchronously('Users.aspx', 'DeleteUsers', { id: $(aData[0]).text() });
            if (res.d == 1) {
                $('#ConfirmDeleteUser').modal('hide');
                table.fnDraw();
            }
        }
        catch (e) {
            alert(e.message);
        }
    });

}
