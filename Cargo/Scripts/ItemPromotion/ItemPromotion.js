var table = null;
var id = 0;
$(document).ready(function () {
    table = BindItemPromotionTable();
    $("#txtSearch").keyup(function (event) {
        table.fnDraw();
    });
});

var BindItemPromotionTable = function () {


    return $('#myTableItemPromotion').dataTable({
        "oLanguage": {
            "sZeroRecords": "No records to display"//,

        },
        "aoColumns": [
                     { "sWidth": "5em", "bSortable": true },
                     { "sWidth": "7em", "bSortable": true },
                     { "sWidth": "7em", "bSortable": true },
                     { "sWidth": "4em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },                     
                     { "sWidth": "3em", "bSortable": false }
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
        "sAjaxSource": "ItemPromotion.aspx/GetItemPromotion",

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
                        $("#myTableItemPromotion").show();
                    }

                }
            });
        }

    });

}


function SaveCategory() {
    if ($('#id').val().trim() != '' && $('#type').val().trim() != '' && $('#description').val().trim() != '' && $('#discount').val().trim() != '' && $('#start').val().trim() != '' && $('#end').val().trim() != '') {
        res = ExecuteSynchronously('ItemPromotion.aspx', 'AddItemPromotion', { itemiD: $("#id").val().trim(), promoType: $("#type").val().trim(), description: $("#description").val().trim(), discount: $("#discount").val().trim(), startPromoAt: $("#start").val().trim(), endPromoAt: $("#end").val().trim() });
        if (res.d == 1) {
            table.fnDraw();
        }
    }
}


function SaveCategory(obj) {
    $("#divsessionexpired").hide();
    if ($('#id').val().trim() != '' && $('#type').val().trim() != '' && $('#description').val().trim() != '' && $('#discount').val().trim() != '' && $('#start').val().trim() != '' && $('#end').val().trim() != '') {
        var res = null;
        if (obj == 0) {
            res = ExecuteSynchronously('ItemPromotion.aspx', 'AddItemPromotion', { itemiD: $("#id").val().trim(), promoType: $("#type").val().trim(), description: $("#description").val().trim(), discount: $("#discount").val().trim(), startPromoAt: $("#start").val().trim(), endPromoAt: $("#end").val().trim() });
        }
        else {
            res = ExecuteSynchronously('ItemPromotion.aspx', 'UpdateItemPromotion', { itemiD: $("#id").val().trim(), promoType: $("#type").val().trim(), description: $("#description").val().trim(), discount: $("#discount").val().trim(), startPromoAt: $("#start").val().trim(), endPromoAt: $("#end").val().trim(), Id: id });
        }
        if (res.d == 1) {
            table.fnDraw();
            $('#id').val('');
            $('#type').val('');
            $('#description').val('');
            $('#discount').val('');
            $('#start').val('');
            $('#end').val('');
            id = 0;
        }
    }
    else {
        if ($('#id').val().trim() == '') {
            $('#errormsg').text("The Id Menu Field is required");
            $("#divsessionexpired").show();
        }
        else if ($('#type').val().trim() == '') {
            $('#errormsg').text("The Type Promo field is required.");
            $("#divsessionexpired").show();
        }
        else if ($('#description').val().trim() == '') {
            $('#errormsg').text("The Description field is required.");
            $("#divsessionexpired").show();
        }
        else if ($('#discount').val().trim() == '') {
            $('#errormsg').text("The Discount field is required.");
            $("#divsessionexpired").show();
        }
        else if ($('#start').val().trim() == '') {
            $('#errormsg').text("The Start Promo field is required.");
            $("#divsessionexpired").show();
        }
        else if ($('#end').val().trim() == '') {
            $('#errormsg').text("The End Promo field is required.");
            $("#divsessionexpired").show();
        }
    }
}