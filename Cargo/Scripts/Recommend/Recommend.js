var table = null;
var id = 0;

$(document).ready(function () {
    table = BindRecommendTable();
    $("#txtSearch").keyup(function (event) {
        table.fnDraw();
    });

    $('#myTableRecommend').on("click", "a.delete", function (e) {
        e.preventDefault();
        $("#divsessionexpired").hide();
        var nRow = $(this).parents('tr')[0];

        DeleteRecommend(table, nRow);
    });
});

var BindRecommendTable = function () {


    return $('#myTableRecommend').dataTable({
        "oLanguage": {
            "sZeroRecords": "No records to display"//,

        },
        "aoColumns": [
                     { "sWidth": "2em", "bSortable": true },
                     { "sWidth": "11em", "bSortable": true },
                     { "sWidth": "7em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": false }
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
        "sAjaxSource": "Recommend.aspx/GetRecommend",

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
                        $("#myTableRecommend").show();
                    }

                }
            });
        }

    });

}


$(document).on('click', '.edit', function () {
    var id = $(this).attr('data-id');

    var detail = ExecuteSynchronously('Recommend.aspx', 'GetRecommendedDetails', { Id: id });
    if (detail.d != "") {
        $('#myModalLabelDetail').html('Detail Item');
        $('#bodyModal').html(detail.d);
        //$('#modalDetail').modal({
        //    keyboard: false
        //});
        //$('#bodyModal').vis
        //visibility: hidden
        $("#modalDetail").css('visibility', 'visible');
    }
    else {
        message.Error(response.message);
    }
});


function DeleteRecommend(table, nRow) {
    var aData = table.fnGetData(nRow);
    $('#ConfirmDeleteRecommended').modal('show');

    $('#btnDeleteRecommended').on("click", function (e) {
        try {
            var res = ExecuteSynchronously('Recommend.aspx', 'DeleteRecommended', { Id: $(aData[0]).text() });
            if (res.d == 1) {
                $('#ConfirmDeleteRecommended').modal('hide');
                table.fnDraw();
            }
        }
        catch (e) {
            alert(e.message);
        }
    });

}