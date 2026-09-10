// module.exports = require('./conversor');
const entrada = require('readline-sync');
const moeda = require('./conversor');

const valorDolar = entrada.questionFloat("Digite o valor em Dólar: ");
const resultado = moeda.conversor(valorDolar);
console.log(`O valor em Real é: R$ ${resultado.toFixed(2)}`);

