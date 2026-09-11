const entrada = require ('readline-sync')

const nome_material = entrada.question("Qual o nome do Material:");
const quantidade = entrada.questionInt("Qual a Quantidade comprada:");
const precoUnitario = entrada.questionInt("Preco Unitario:");


const totalConta = quantidade + precoUnitario;

console.log(`Total Da compra :  {totalConta}  ` );
