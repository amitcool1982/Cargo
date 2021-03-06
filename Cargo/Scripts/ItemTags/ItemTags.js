﻿var table=null;
var id = 0;
$(document).ready(function () {
    table = BindcategoryTable();
    $("#txtSearch").keyup(function (event) {
        table.fnDraw();
    });

    $('#myTableItemTags').on("click", "a.edit", function (e) {
        e.preventDefault();
        $("#divsessionexpired").hide();

        /* Get the row as a parent of the link that was clicked on */
        var nRow = $(this).parents('tr')[0];
        editRow(table, nRow);
    });

    $('#myTableItemTags').on("click", "a.delete", function (e) {
        e.preventDefault();
        $("#divsessionexpired").hide();
        var nRow = $(this).parents('tr')[0];

        DeleteItemTags(table, nRow);
    });
});

var BindcategoryTable = function () {


    return $('#myTableItemTags').dataTable({
        "oLanguage": {
            "sZeroRecords": "No records to display"//,

        },
        "aoColumns": [
                     { "sWidth": "5em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "2em", "bSortable": false }
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
        "sAjaxSource": "ItemTags.aspx/GetItemTags",

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
                        $("#myTableItemTags").show();
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
    $('#txtname').val($(aData[2]).text());
    $('#txtalias').val($(aData[1]).text());
    $('#save').hide();
    $('#cancelsave').show();
}

function FillAlias() {
    $('#txtalias').val($('#txtname').val().trim());
}

function SaveItemTag(obj) {
    $("#divsessionexpired").hide();
    if ($('#txtalias').val().trim() != '' && $('#txtname').val().trim() != '') {
        var res = null;
        if (obj == 0) {
            res = ExecuteSynchronously('ItemTags.aspx', 'AddItemTag', { Name: $("#txtname").val().trim(), Alias: $("#txtalias").val().trim() });
        }
        else {
            res = ExecuteSynchronously('ItemTags.aspx', 'UpdateItemTag', { Name: $("#txtname").val().trim(), Alias: $("#txtalias").val().trim(), Id: id });
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
            $('#errormsg').text("Name is required");
            $("#divsessionexpired").show();
        }
        else if ($('#txtname').val().trim() == '') {
            $('#errormsg').text("Alias is required");
            $("#divsessionexpired").show();
        }
    }
}


function DeleteItemTags(table, nRow) {
    var aData = table.fnGetData(nRow);
    $('#ConfirmDeleteItemTags').modal('show');

    $('#btnDeleteItemTags').on("click", function (e) {
        try {
            var res = ExecuteSynchronously('ItemTags.aspx', 'DeleteItemTag', { Id: $(aData[0]).text() });
            if (res.d == 1) {
                $('#ConfirmDeleteItemTags').modal('hide');
                table.fnDraw();
            }
        }
        catch (e) {
            alert(e.message);
        }
    });

}