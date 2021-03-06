﻿var table = null;
var id = 0;
var Selectedtags = '';

$(document).ready(function () {
    table = BindItemsTable();
    $("#txtSearch").keyup(function (event) {
        table.fnDraw();
    });

    $('#myTableItems').on("click", "a.edit", function (e) {
        e.preventDefault();
        $("#divsessionexpired").hide();

        /* Get the row as a parent of the link that was clicked on */
        var nRow = $(this).parents('tr')[0];
        editRow(table, nRow);
    });
    BindPageData(0);
});

function BindPageData(Id) {
    var res = ExecuteSynchronously('Items.aspx', 'GetItemData', { ItemId: Id });
    PopulateControl('ddlVendor', res.d.Vendor);
    $('#ddlVendor').selectpicker('refresh');

    PopulateControl('ddlItemCategory', res.d.Categoty);
    $('#ddlItemCategory').selectpicker('refresh');

    $('#name').val(res.d.ItemName);
    $('#alias').val(res.d.UrlAlias);
    $('#description').val(res.d.Description);
    $('#price').val(res.d.price);

    //$('#Tags').val(res.d.Tags);

    $('#recommended').val(res.d.recommended);
    if (res.d.ItemImageUrl != '') {
        $('#ItemImageUrl').attr('src', res.d.ItemImageUrl);
    }
    if (res.d.Tags != "") {
        var temp = res.d.Tags.split(',');
        var temp2 = null;
        for (var i = 0; i < temp.length; i++) {
            temp2 = temp[i].split('^');
            if (temp2[0].indexOf("✓") != -1) {
                Selectedtags += "," + temp2[0].replace("✓", "");
                $('#tag_list').append("<input class='tags' checked='checked' value='" + temp2[0].replace("✓","") + "' type='checkbox' onchange='javascript:UpdateSelectedTags(this)'> " + temp2[1] + " ");
            }
            else {
                $('#tag_list').append("<input class='tags' value='" + temp2[0] + "' type='checkbox' onchange='javascript:UpdateSelectedTags(this)'> " + temp2[1] + " ");
            }
        }
        
    }

}

var BindItemsTable = function () {


    return $('#myTableItems').dataTable({
        "oLanguage": {
            "sZeroRecords": "No records to display"//,

        },
        "aoColumns": [
                     { "sWidth": "4em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
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
        "sAjaxSource": "Items.aspx/GetItems",

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
                        $("#myTableItems").show();
                    }

                }
            });
        }

    });

}


function SaveItem() {
    $("#divsessionexpired").hide();
    var strMsg = DataIsValid();
    if (strMsg == '') {
        var Item = new Object();
        Item.ItemID = Number(id);
        Item.VendorAlias = $('#ddlVendor').val();
        Item.CategotyAlias = $('#ddlItemCategory').val();
        Item.ItemName = $('#name').val().trim();
        Item.UrlAlias = $('#alias').val().trim();
        Item.Description = $('#description').val().trim();
        Item.Price = Number($('#price').val().trim());
        Item.Tags = Selectedtags.replace(",","");
        Item.IsRecommendItem = $('#recommended')[0].checked;
        Item.ItemImageUrl = '';
        var res = ExecuteSynchronously('Items.aspx', 'AddItemss', { objItemdetail: Item });
        if (res.d == 1) {
            table.fnDraw();
            id = 0;
            BindPageData(0);
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
    if ($('#ddlVendor').val() == '-1') {
        return "Vendor is required"
    }
    if ($('#ddlItemCategory').val() == '') {
        return "Category is required"
    }
    if ($('#name').val().trim() == '') {
        return "Item's name is required"
    }
    if ($('#alias').val().trim() == '') {
        return "Alias is required"
    }
    if ($('#description').val().trim() == '') {
        return "Description is required"
    }
    if ($('#price').val().trim() == '') {
        return "price is required"
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


function FillAlias(obj) {
    $('#alias').val(obj.value.trim());
}

function AddTags() {
    if ($('#tags_input').val().trim() != "") {
        var temp = $('#tags_input').val().trim().split(',');
        for (var i = 0; i < temp.length; i++) {
            $('#tag_list').append("<input class='tags' value='" + temp[i] + "✓" + "' type='checkbox' onchange='javascript:UpdateSelectedTags(this)'> " + temp[i] + " ");
        }

    }
    $('#tags_input').val('');
}

function UpdateSelectedTags(obj) {
    if (Selectedtags.indexOf(obj.value) == -1) {
        Selectedtags += "," + obj.value;
    }
    else {
        Selectedtags = Selectedtags.replace("," + obj.value, "");
    }
}


function RecommendItem(obj) {
    var res = ExecuteSynchronously('Items.aspx', 'RecommendItem', { Id: obj });
    if (res.d == 1) {
        table.fnDraw();
    }
}