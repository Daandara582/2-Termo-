const fs  = require('fs');

console.log("=== SISTEMA DE PERSISTENCIA: REGISTRO DE MAQUINAS ===");

const maquinasIndustriais = [
    {id: 101, nome: "Torno Mecanico Universal", setor: "Usinagem", operacional: 
    true},
    {id: 102, nome: "Fresadora ferramentaria", setor: "Usinagem", operacional: 
    true},
    {id: 103, nome: "TPrensa Hdraulica 50T", setor: "Estamparia", operacional: 
    true},
]
const dadosParaGravar = JSON.stringify(maquinasIndustriais, null, 2);
const nomeDoArquivo = "maquinas.json";

fs.writeFileSync(nomeDoArquivo,dadosParaGravar);

console.log(`\nGravacao concluida com sucesso.`);
console.log(`Verifique o arquivo '${nomeDoArquivo}'`);

