var tableProv = null;
var tableCity = null;
var ProvinceId = -1;
var CityId = -1;
var id = 0;

$(document).ready(function () {
    tableProv = BindProvinceTable();
    tableCity = BindCityTable();

    $('.selectpicker').selectpicker({
        style: 'form-control formcustom',
        size: 4
    });

    $("#txtSearchProvince").keyup(function (event) {
        tableProv.fnDraw();
    });

    $("#txtSearchCity").keyup(function (event) {
        tableCity.fnDraw();
    });

    $('#myTableProvince').on("click", "a.edit", function (e) {
        e.preventDefault();

        /* Get the row as a parent of the link that was clicked on */
        var nRow = $(this).parents('tr')[0];
        editRow(tableProv, nRow);
    });

    $('#myTableCity').on("click", "a.edit", function (e) {
        e.preventDefault();

        /* Get the row as a parent of the link that was clicked on */
        var nRow = $(this).parents('tr')[0];
        editCityRow(tableCity, nRow);
    });
});

function editRow(Table, nRow) {
    var aData = Table.fnGetData(nRow);
    var jqTds = $('>td', nRow);
    ProvinceId = $(aData[0]).text();
    $('#provincename').val($(aData[1]).text());
    $('#create-new-province').modal('show');

}
function editCityRow(Table, nRow) {
    var aData = Table.fnGetData(nRow);
    var jqTds = $('>td', nRow);
    CityId = $(aData[0]).text();
    var res = ExecuteSynchronously('../ProvAndCity.aspx', 'GetDropProvince', {});
    PopulateControl('ddlprovince', res.d);
    $('#ddlprovince').val(aData[4]);
    $('#ddlprovince').selectpicker('render');
    $('#cityname').val($(aData[2]).text());
    $('#create-city').modal('show');
}

var BindProvinceTable = function () {


    return $('#myTableProvince').dataTable({
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
        "sAjaxSource": "../ProvAndCity.aspx/GetProvince",

        "fnServerData": function (sSource, aoData, fnCallback) {
            aoData.push({ "name": "SearchFilter", "value": $("#txtSearchProvince").val() });
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
                        $("#myTableProvince").show();
                    }

                }
            });
        }

    });

}

var BindCityTable = function () {


    return $('#myTableCity').dataTable({
        "oLanguage": {
            "sZeroRecords": "No records to display"//,

        },
        "aoColumns": [
                     { "sWidth": "2em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "8em", "bSortable": true },
                     { "sWidth": "5em", "bSortable": false },
                     { "bVisible": false }
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
        "sAjaxSource": "../ProvAndCity.aspx/GetCity",

        "fnServerData": function (sSource, aoData, fnCallback) {
            aoData.push({ "name": "SearchFilter", "value": $("#txtSearchCity").val() });
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
                        $("#myTableCity").show();
                    }

                }
            });
        }

    });

}

function AddUpdateProvince() {
    if ($('#provincename').val().trim() != "") {
        var res = ExecuteSynchronously('../ProvAndCity.aspx', 'AddUpdateProvince', { Id: Number(ProvinceId), Name: $('#provincename').val().trim() });
        if (res.d == 1) {
            ProvinceId = -1;
            $('#create-new-province').modal('hide');
            tableProv.fnDraw();
        }
    }
}

function HideModal() {
    ProvinceId = -1;
    $('#create-new-province').modal('hide');
}

function LoadNewCityData() {
    var res = ExecuteSynchronously('../ProvAndCity.aspx', 'GetDropProvince', {});
    PopulateControl('ddlprovince', res.d);
    $('#ddlprovince').selectpicker('refresh');
    $('#create-city').modal('show');    
}

function HideCityModal() {
    $('#ddlprovince').val("-1");
    $('#ddlprovince').selectpicker('render');
    $('#cityname').val('');
    $('#create-city').modal('hide');
    CityId = -1;
}

function AddUpdateCity() {
    if ($('#cityname').val().trim() != "" && $('#ddlprovince').val()!="-1") {
        var res = ExecuteSynchronously('../ProvAndCity.aspx', 'AddUpdateCity', { Id: Number(CityId), CityName: $('#cityname').val().trim(), Province: $('#ddlprovince').val() });
        if (res.d == 1) {
            CityId = -1;
            $('#create-city').modal('hide');
            tableCity.fnDraw();
        }
    }
}