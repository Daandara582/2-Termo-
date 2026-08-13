const entrada = require('readline-sync');

const nome = entrada.question("Nome Aluno: ");
const n1 = entrada.questionFloat("Nota 1: ");
const n2 = entrada.questionFloat("Nota 2: ");

const media = (n1+n2) / 2;

if (media >=7) {
    console.log("Aprovado");
} else if (media >= 5 && media < 7) {
    console.log("Recuperação");
}else {
    console.log("Reprovado");
}
