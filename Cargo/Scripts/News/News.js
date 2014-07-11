var table = null;
var id = -1;
$(document).ready(function () {
    table = BindCustomerTable();
    $("#txtSearch").keyup(function (event) {
        table.fnDraw();
    });


    $('#myTableNews').on("click", "a.edit", function (e) {
        e.preventDefault();

        /* Get the row as a parent of the link that was clicked on */
        var nRow = $(this).parents('tr')[0];
        editRow(table, nRow);
    });

    $('#myTableNews').on("click", "a.delete", function (e) {
        e.preventDefault();
        var nRow = $(this).parents('tr')[0];

        DeleteNews(table, nRow);
    });

    BindPageData(-1);
});


var BindCustomerTable = function () {
    
    return $('#myTableNews').dataTable({
        "oLanguage": {
            "sZeroRecords": "No records to display"//,

        },
        "aoColumns": [
                     { "sWidth": "3em", "bSortable": true },
                     { "sWidth": "15em", "bSortable": true },
                     { "sWidth": "3em", "bSortable": true },
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
        "sAjaxSource": "News.aspx/GetNews",

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
                        $("#myTableNews").show();
                    }

                }
            });
        }

    });

}

function BindPageData(Id) {
    var res = ExecuteSynchronously('News.aspx', 'GetNewsData', { NewsId: Id });

    $('#title').val(res.d.IndTitle);
    $('#alias').val(res.d.IndURLAlias);
    //$('#IndContent').val(res.d.IndContent);

    $('.summernote').eq(0).code(res.d.IndContent);

    $('#en_title').val(res.d.EngTitle);
    $('#en_alias').val(res.d.EngURLAlias);
    //$('#EngContent').val(res.d.EngContent);
    $('.summernote').eq(1).code(res.d.EngContent);
}


function editRow(Table, nRow) {
    debugger;
    var aData = Table.fnGetData(nRow);
    var jqTds = $('>td', nRow);
    id = $(aData[0]).text();
    BindPageData(Number(id));
    $('#cancel').show();
}

function SaveNews(obj) {
    debugger;
    $("#divsessionexpired").hide();
    var strMsg = DataIsValid();
    if (strMsg == '') {
        var News = new Object();
        News.Id = Number(id);
        News.IndTitleEncrypt = '';
        News.IndTitle = $('#title').val().trim();
        News.IndURLAlias = $('#alias').val().trim();
        //News.IndContent = $('#IndContent').val().trim();

        News.IndContent = $('.summernote').eq(0).code();

        News.EngTitle = $('#en_title').val();
        News.EngURLAlias = $('#en_alias').val().trim();
        //News.EngContent = $('#EngContent').val().trim();
        News.EngContent = $('.summernote').eq(1).code();

        News.PostDate = '';
        News.ImageURL = '';
        News.Author = '';

        if (obj == 0) {
            News.IsOnline = 0;
            News.IsSchedule = 1;
        }
        else {
            News.IsOnline = 1;
            News.IsSchedule = 0;
        }
        News.Count = 0;

        var res = ExecuteSynchronously('News.aspx', 'AddNews', { objNewsDetail: News });
        if (res.d == 1) {
            table.fnDraw();
            BindPageData(-1);
            id = -1;
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
    if ($('#title').val() == '') {
        return "title is required"
    }
    if ($('#alias').val() == '') {
        return "alias is required"
    }
    
    if ($('.summernote').eq(0).code() == '' || $('.summernote').eq(0).code() == '<br>') {
        return "content is required"
    }
    if ($('#en_title').val().trim() == '') {
        return "english title is required"
    }
    if ($('#en_alias').val().trim() == '') {
        return "english alias is required"
    }
    if ($('.summernote').eq(1).code() == '' || $('.summernote').eq(1).code() == '<br>') {
        return "english content is required"
    }
    return '';
}


function DeleteNews(table, nRow) {
    var aData = table.fnGetData(nRow);
    $('#ConfirmDeleteNews').modal('show');

    $('#btnDeleteNews').on("click", function (e) {
        try {
            var res = ExecuteSynchronously('News.aspx', 'DeleteNews', { Id: $(aData[0]).text() });
            if (res.d == 1) {
                $('#ConfirmDeleteNews').modal('hide');
                table.fnDraw();
            }
        }
        catch (e) {
            alert(e.message);
        }
    });

}

