var table = null;
var id = 0;
$(document).ready(function () {
    table = BindcategoryTable();    
    $("#txtSearch").keyup(function (event) {
        table.fnDraw();
    });

    $('#myTableFAQ').on("click", "a.edit", function (e) {
        e.preventDefault();

        /* Get the row as a parent of the link that was clicked on */
        var nRow = $(this).parents('tr')[0];
        editRow(table, nRow);
    });

    $('#myTableFAQ').on("click", "a.delete", function (e) {
        e.preventDefault();
        var nRow = $(this).parents('tr')[0];

        DeleteFAQ(table, nRow);
    });
});

var BindcategoryTable = function () {
    

    return $('#myTableFAQ').dataTable({
        "oLanguage": {
            "sZeroRecords": "No records to display"//,

        },
        "aoColumns": [
                     { "sWidth": "3em", "bSortable": true },
                     { "sWidth": "12em", "bSortable": true },
                     { "sWidth": "2em", "bSortable": true },
                     { "sWidth": "4em", "bSortable": false }
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
        "sAjaxSource": "../FAQ.aspx/GetFAQs",

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
                        $("#myTableFAQ").show();
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
    var res = ExecuteSynchronously('../FAQ.aspx', 'GetFaQDetail', { Id: Number(id) });
    $('#question').val(res.d.IndQuestion);
    $('#answer').val(res.d.IndAnswer);
    $('#en-question').val(res.d.EngQuestion);
    $('#en-answer').val(res.d.EngAnswer);
    $('#cancel').show();
}

function FillAlias() {
    $('#txtalias').val($('#txtname').val().trim());
}
function CancelSaveFAQ() {
    id = 0;
    $('#question').val('');
    $('#answer').val('');
    $('#en-question').val('');
    $('#en-answer').val('');
    $('#cancel').hide();
}

function SaveFAQ() {
    $("#divsessionexpired").hide();
    if ($('#question').val() != '' && $('#answer').val() != '' && $('#en-question').val() != '' && $('#en-answer').val() != '') {
        var res = null;
        if (id == 0) {
            res = ExecuteSynchronously('../FAQ.aspx', 'AddFAQ', { Id: 0, Ques: $("#question").val(), Ans: $("#answer").val(), EnQues: $("#en-question").val(), EnAns: $("#en-answer").val() });
        }
        else {
            res = ExecuteSynchronously('../FAQ.aspx', 'UpdateFAQ', { Id: Number(id), Ques: $("#question").val(), Ans: $("#answer").val(), EnQues: $("#en-question").val(), EnAns: $("#en-answer").val() });
        }
        if (res.d == 1) {
            table.fnDraw();
            $('#question').val('');
            $('#answer').val('');
            $('#en-question').val('');
            $('#en-answer').val('');
            id = 0;
        }
    }
    else {
        if ($('#question').val() == '') {
            $('#errormsg').text("Question is required");
            $("#divsessionexpired").show();
        }
        else if ($('#answer').val() == '') {
            $('#errormsg').text("Answer is required");
            $("#divsessionexpired").show();
        }
        else if ($('#en-question').val() == '') {
            $('#errormsg').text("English Question is required");
            $("#divsessionexpired").show();
        }
        else if ($('#en-answer').val() == '') {
            $('#errormsg').text("English Answer is required");
            $("#divsessionexpired").show();
        }
    }
}



function DeleteFAQ(table, nRow) {
    var aData = table.fnGetData(nRow);
    $('#ConfirmDeleteFAQ').modal('show');

    $('#btnDeleteFAQ').on("click", function (e) {
        try {
            var res = ExecuteSynchronously('../FAQ.aspx', 'DeleteFAQ', { Id: $(aData[0]).text() });
            if (res.d == 1) {
                $('#ConfirmDeleteFAQ').modal('hide');
                table.fnDraw();
            }
        }
        catch (e) {
            alert(e.message);
        }
    });

}
