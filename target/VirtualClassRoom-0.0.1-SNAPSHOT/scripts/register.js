function verify() {
    var fname = verifyFullname();
    var username = verifyUsername();
    var password = verifyPassword();
    var select = verifySelect();
    if (!fname || !username || !select || !password) {
        return false;
    }else{
		return true;
	}
}

function verifyFullname() {
    var fullname = document.getElementById("fullname").value.trim();
    var error = document.getElementById("fullnameId");
    if (fullname.length < 6) {
        error.innerHTML = "<sup>*</sup><small>fullname should contain min 6 characters</small>";
        return false;
    }
    if (fullname.search(/\d/) >= 0) {
        error.innerHTML = "<sup>*</sup><small>fullname should not contain digits</small>";
        return false;
    } else {
        error.innerHTML = "";
		return true;
    }
}

function verifyUsername() {
    var username = document.getElementById("username").value.trim();
    var error = document.getElementById("usernameId");
    if (username.length < 6) {
        error.innerHTML = "<sup>*</sup><small>username should contain min 6 characters.</small>";
        return false;
    }
    if (username.search(/\d/) >= 0) {
        error.innerHTML = "<sup>*</sup><small>username should not contain digits.</small>";
        return false;
    } else {
        error.innerHTML = "";
		return true;
    }
}

function verifyPassword() {
    var password = document.getElementById("pass").value;
    var error = document.getElementById("passwordId");

    if (password.length < 9) {
        error.innerHTML = "<sup>*</sup><small>password must be min 9 characters long.</small>";
        return false;
    }
    if (password.search(/[0-9]/) == -1) {
        error.innerHTML = "<sup>*</sup><small>password must contain atleast one number/digit.</small>";
        return false;
    }
    //    if(password.search(/[A-Z]/)==-1){
    //        error.innerHTML="<sup>*</sup><small>password must contain atleast one capital letter.</small>";
    //        return false;
    //    }
    if (/[A-Z]+.*[A-Z]+/.test(password) == false) {
        error.innerHTML = "<sup>*</sup><small>password must contain atleast two capital letters.</small>";
        return false;
    }
    if (password.search(/[a-z]/) == -1) {
        error.innerHTML = "<sup>*</sup><small>password must contain atleast one small letter.</small>";
        return false;
    }
    if (password.search(/[!\@\#\$\%\^\&\*\)\(\_\+\=\-\?]/) == -1) {
        error.innerHTML = "<sup>*</sup><small>password must contain one special character</small>";
        return false;
    }
    error.innerHTML = "";
    return verifyConPass(password);


}

function verifyConPass(pass) {
    var conpass = document.getElementById("confirm-pass").value;
    var error = document.getElementById("confirm-passId");

    if (pass != conpass) {
        error.innerHTML = "<sup>*</sup><small>password not matched";
        return false;
    } else {
        error.innerHTML = "";
        return true;
    }
}

function verifySelect() {
    var select = document.getElementById("profession");
    if (select.value == "no") {
        document.getElementById("professionId").innerHTML = "<sup>*</sup><small>choose appropriate value</small>";
        return false;
    } else {
        document.getElementById("professionId").innerHTML = "";
        return true;
    }

}
