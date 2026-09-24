const entrada = require ('readline-sync')

let qtd_pecas_produzidas = [];

const qtd = entrada.questionInt("Quantas pecas a maquina produz por ciclo?  ");

for (let i = 0; i < qtd; i++) {
    let serie = entrada.question(`Digite o numero do ciclo  ${i + 1}: `);
    qtd_pecas_produzidas .push(serie);
}


console.log(`Total de pecas: ${qtd_pecas_produzidas .length}`);
console.log(`Numeros de serie: ${qtd_pecas_produzidas .join(" | ")}`);