// const entrada = require(`readline-sync`);

// const oficina = require('./funcoes_Logistica');

// console.log("Sistema de gerenciamento ");
 
// const produto = entrada.question("Digite o nome do produto:");
// const distancia_entrega = entrada.questionFloat("Digite a distancia de entrega (em km):");
// const valor_total= entrada.questionFloat("Digite o valor total da carga (em R$):");

// const freteBase = calcularBase(km);
// const seguro = calcularSeguro(valorCarga);
// const prazo = verificarPrazo(km);

// const valorTotal = freteBase + seguro;

// console.log(`RELATÓRIO DE POSTAGEM`)

// Produto: ${produto}
// Distância: ${km} km
// Valor da carga: R$ ${valorCarga.toFixed(2)}
// Frete base: R$ ${freteBase.toFixed(2)}
// Seguro: R$ ${seguro.toFixed(2)}
// Prazo de entrega: ${prazo}
// VALOR TOTAL DO FRETE: R$ ${valorTotal.toFixed(2)}
// `);



const entrada = require(`readline-sync`);

const oficina = require('./funcoes_Logistica');

console.log("Sistema de gerenciamento ");

 
const produto = entrada.question("Digite o nome do produto:");
const distancia_entrega = entrada.questionFloat("Digite a distancia de entrega (em km):");
const valor_total= entrada.questionFloat("Digite o valor total da carga (em R$):");


const totaldistancia = Logistica.calcularBase(distancia_entrega);
const seguro = Logistica.calcularSeguro(valor_total);
const total_valor = Logistica.verificarPrazo(distancia_entrega);

console.log("\n  --- Calculadora  ---");
console.log(`Orcamento Sem desconto : R$ ${totaldistancia.toFixed(2)}`);
console.log(`Orcamento Com desconto (1%): R$ ${totalComDesconto.toFixed(2)}`);
console.log(`status do veiculo: ${seguro}`);





