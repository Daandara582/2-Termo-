function checarTemperatura(valor) {
    if (valor > 40) {
        return "ATENÇÃO! Alerta caldeira super aquecida.";
    }   
}

function checarUmidade(valor) {
    if (valor < 20) {
        return "ATENÇÃO! Ar Seco.";
    }
}
      
module.exports = {checarTemperatura,
    checarUmidade};