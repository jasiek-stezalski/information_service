function loadfile(input){
    var file  = input.files[0];
    var textType = /text.*/;
    var temp = document.getElementById("fileError");

    temp.innerHTML = '';

    if(file.type.match(textType)){
        var reader = new FileReader();

        reader.onload = function (e) {
            document.getElementById('text').value = e.target.result;
        }

        reader.readAsText(file);
    } else{

        var s = document.getElementById("temp");
        temp.innerHTML = s.innerHTML;

    }
}

function checkfile(input){
    var file  = input.files[0];
    var temp = document.getElementById("fileError2");

    temp.innerHTML = '';

    if(file.size >= 1048576) {
        var s = document.getElementById("temp2");
        temp.innerHTML = s.innerHTML;
        var cos = document.getElementById("cos");
        cos.value = '';
    }
}
