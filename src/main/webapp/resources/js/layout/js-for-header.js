function goMain(){
    console.log('ciao');
    return $.get("/hippokrates-spring/");
}
function setLanguage(lng){
    console.log(lng);
    return $.get("/hippokrates-spring/");
}