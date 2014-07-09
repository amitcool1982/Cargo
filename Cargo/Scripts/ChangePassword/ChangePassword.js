function UpdatePassword(obj) {
    if ($('#txtalias').val().trim() != '' && $('#txtname').val().trim() != '') {
        var res = null;
        if (obj == 0) {           
            res = ExecuteSynchronously('Change Password.aspx', 'UpdatePassword', { Name: $("#txtname").val().trim(), Alias: $("#txtalias").val().trim(), Id: id });
        }
        if (res.d == 1) {
            alert("pasword update")
        }
    }
}