const entrada = require ('readline-sync')

const peso_peca = entrada.questionInt("Qual o peso da peça?")

if (peso_peca >95 && peso_peca <105) {
    console.log("Peça Aprovada!");
} else {
    console.log("Peça Reprovada!");
}



