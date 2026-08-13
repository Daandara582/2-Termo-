const entrada = require('readline-sync');

console.log("=== Sistema de controle de qualidade - pesagem ===")

//1.Definição de Variáveis 
const pesos = []; //Array para guardar o histórico (Dia 4 )
let somaTotal = 0; //Acumulador (Dia 3)

const qtdPecas =entrada.questionInt("Quantas pecas deseja avaliar?");

//2.Loop para coletar dados 
for(let i = 0;i < qtdPecas; i++) {
    let peso = entrada.questionFloat(`Digite o peso da peca $ {i+ 1} (kg): `);

    pesos.push(peso);  //Guarda no prédio/Array 
    somaTotal += peso; //Soma no cofre/Acumulador 
}

    //3.Calculos 
const media= somaTotal / qtdPecas;

//4.Exibição do relatório
console.log("\n --- relatorio da auditoria ---");
console.log (`Pesos registrados:[ ${pesos.join("kg |")}kg]`);
console.log(`Media de pesos do lote : ${media.toFixed(2)}`);

//Decisão (lógica combinada da Semana)
if (media >= 4.8 && media <= 5.2){
    console.log("Status final: lote aprovado!)");
} else {
    console.log("Status Final: lote reprovado (fora do padrão)");
    
}

