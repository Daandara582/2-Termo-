const entrada = require('readline-sync');

let pecasDefeituosas = [];
const qtd = entrada.questionInt("Digite a quantidade de peças a serem verificadas: ");

for (let i = 0; i < qtd; i++) {
    let serie = entrada.question("Digite o número de série da peça: {i + 1}: ");
}
    pecasDefeituosas.push(serie);
    
    console.log(`\nPeças defeituosas: ${pecasDefeituosas.join(", ")}`); 
