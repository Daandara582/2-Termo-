 function CalcularTotal(preco,quantidade){
    return preco * quantidade;

 }

function GerarCupom(nome, valor ){ 
    return `O cliente ${nome} comprou o produto no valor de R$ ${valor.toFixed(2)}`;
}

module.exports = {CalcularTotal, 
    GerarCupom};
    