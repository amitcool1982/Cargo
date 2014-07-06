var table=null;
var id = 0;
$(document).ready(function () {
    table = BindcategoryTable();
    $("#txtSearch").keyup(function (event) {
        table.fnDraw();
    });

    $('#myTableCategory').on("click", "a.delete", function (e) {
        e.preventDefault();
        var nRow = $(this).parents('tr')[0];

        DeleteCategory(table, nRow);
    });
});


function SaveCategory(obj) {
    if ($('#txtalias').val().trim() != '' && $('#txtname').val().trim() != '') {
        var res = null;
        if (obj == 0) {
            res = ExecuteSynchronously('Change Password.aspx', 'AddCategory', { Name: $("#txtname").val().trim(), Alias: $("#txtalias").val().trim() });
        }
        else {
            res = ExecuteSynchronously('Change Password.aspx', 'UpdateCategory', { Name: $("#txtname").val().trim(), Alias: $("#txtalias").val().trim(), Id: id });
        }
        if (res.d == 1) {
            table.fnDraw();
            $('#txtalias').val('');
            $('#txtname').val('');
            id = 0;
        }
    }
}