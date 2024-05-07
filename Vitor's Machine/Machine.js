
function converter() {
    var decimal = Number(document.getElementById("demo1").value);
    let octal = decimal.toString(8);
    let hexadecimal = decimal.toString(16);
    let binaria = decimal.toString(2);

    console.log(decimal);
    console.log(octal);
    console.log(hexadecimal);
    console.log(binaria);

    document.querySelector(".display_octal").innerHTML = octal;
    document.querySelector(".display_hexa").innerHTML = hexadecimal;
    document.querySelector(".display_bin").innerHTML = binaria;
}