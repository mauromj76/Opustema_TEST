function checkDays(num) {
    if ((num === null) || (num.length > 5) || (num < 0)) {
        return false;
    } else {
        return true;
    }
}

function checkDiscount(discount) {
    if ((discount === null) || ((discount / 1) > 99.99) || ((discount / 1) < 0)) {
        return false;
    } else {
        return true;
    }
}

function checkEMail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function checkSize(min, max, str) {
    if (str == null) {
        return true;
    }

    return((str.length >= min) && (str.length <= max));
}



