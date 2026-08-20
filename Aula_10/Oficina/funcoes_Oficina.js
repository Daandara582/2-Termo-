function calcularOrcamento(precoPeca,horas_trabalho){
    const valorHora = 85.00;
    const totalMaodeObra = horas_trabalho * valorHora;
    return precoPeca + totalMaodeObra;
}

function  verificarGarantia(meses) {
    if(meses<=3){
        return "Dentro da Garantia ";
    } else{
        return "Garantia Expirada ";

    }
}
function aplicarDesconto(valorTotal) {
    return valorTotal *0.95;
}
module.exports = {
    calcularOrcamento,
    verificarGarantia,
    aplicarDesconto
}