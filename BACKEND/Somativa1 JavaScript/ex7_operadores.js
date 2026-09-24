
const entrada = require('readline-sync')

const nomes = [] ;

const quantidade = entrada.questionInt(
    "Quantas nomes deseja cadastrar? "
);

for (let i = 0; i < quantidade; i++) {
    let  nomes = entrada.questionFloat(
        `Digite o nome  ${i + 1}: `
    );

    nomes.push(nome);
}

console.log("\nNomess cadastrados:");
console.log(nomes);


