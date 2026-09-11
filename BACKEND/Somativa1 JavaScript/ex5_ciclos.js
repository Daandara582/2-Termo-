const entrada = require ('readline-sync')

let qtd_pecas_produzidas [];

const qtd = entrada.questionInt("Quantas pecas a maquina produz por ciclo?  ");

for (let i = 0; i < qtd; i++) {
    let serie = entrada.question(`Digite o numero do ciclo  ${i + 1}: `);
    pecasDefeituosas.push(serie); // Empurra para dentro da lista
}

console.log("\n--- RELATORIO DE QUALIDADE ---");
console.log(`Total de pecas: ${pecasDefeituosas.length}`);
console.log(`Numeros de serie: ${pecasDefeituosas.join(" | ")}`);