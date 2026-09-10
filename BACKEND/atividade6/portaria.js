const entrada = require('readline-sync');
let listaVisitantes = [];

while (true) {
    let opcao = entrada.question("Deseja cadastrar um visitante? (S/N): ");
}

if (opcao.toUpperCase() !== 'S') {
    break;
}

let nomeVisitante = entrada.question("Digite o nome do visitante: ");
letempresaVisitante = entrada.question("Digite a empresa do visitante: ");

listaVisitantes.push({ nome: nomeVisitante, 
    empresa: empresaVisitante });

console.log("\n Registrado com sucesso:");

console.log("\n Visitantes Do Dia");

for (let i = 0; i < listaVisitantes.length; i++) {
      console.log(`${i + 1}. ${listaVisitantes[i].nome} (${listaVisitantes[i].empresa})`);
}
