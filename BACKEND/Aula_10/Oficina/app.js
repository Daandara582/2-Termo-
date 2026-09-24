const entrada = require(`readline-sync`);

//Buscando as ferraamentas no arquivo funcoesOficina.js
//o ' ./' significa "nesta mesma pasta"
const oficina = require('./funcoes_Oficina');

console.log("Sistema de gestão de oficina");

const peca = entrada.questionFloat ("Preco da peca: R$");
const horas = entrada.questionInt("Horas de servico: ")
const tempoUso = entrada.questionInt("Meses desde  o ultimo conserto:")

//Usamos o nome 'oficina' (que damos no require) seguido do ponto .
const totalBruto = oficina.calcularOrcamento(peca,horas);
const statusGarantia = oficina.verificarGarantia(tempoUso);
const totalComDesconto = oficina.aplicarDesconto(totalBruto);

console.log("\n  --- Relatrio Final  ---");
console.log(`Orcamento Sem desconto : R$ ${totalBruto.toFixed(2)}`);
console.log(`Orcamento Com desconto (5%): R$ ${totalComDesconto.toFixed(2)}`);
console.log(`status do veiculo: ${statusGarantia}`);
