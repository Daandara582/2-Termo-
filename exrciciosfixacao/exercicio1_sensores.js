const fs  = require('fs');

console.log("===SISTEMA DE MONITORAMENTO DE SENSORES ===");

const sensores = [
    {codigo: 1001, tipo: "Temperatual", leituraAtual: 40.8, status: "Operando"},
    {codigo: 1002, tipo: "Pressao", leituraAtual:6, status: "Operando"},
    {codigo: 1003, tipo: "Temperatual", leituraAtual: 140.9, status: "Alerta!"},
]

const dadosParaGravar = JSON.stringify(sensores, null, 2);
const nomeDoArquivo = "maquinas.json";

fs.writeFileSync(nomeDoArquivo,dadosParaGravar);

console.log(`\nGravacao concluida com sucesso.`);
console.log(`Verifique o arquivo '${nomeDoArquivo}'`);
