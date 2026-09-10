const readlineSync = require('readline-sync');

const venda = require('./Venda');

const nome = readlineSync.question("Digite o nome do cliente: ");
const preco = readlineSync.questionFloat("Digite o preço do produto: ");
const quantidade = readlineSync.questionInt("Digite a quantidade do produto: ");

const total = venda.CalcularTotal(preco, quantidade);

const cupom = venda.GerarCupom(nome, total);

console.log('\n'+ cupom);

