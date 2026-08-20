
function calcularBase(km) {
    return km * 2.10;
}
function calcularSeguro(valorCarga) {
    return valorCarga * 0.01;
}


function  verificarPrazo(Km) {
    if(meses<=100){
        return "1 dia util ";
    } else{
        return " Retorne  3 a 5 dias uteis ";

    }

}

module.exports = {
    calcularBase,
    calcularSeguro, 
    verificarPrazo
}