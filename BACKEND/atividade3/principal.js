const realine = require('readline');

const sensor = require('./sensor');

const rl = realine.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Qual o valor da temperatura: ",(temperatura) => {
    rl.question("Qual o valor da umidade: ",(umidade) => {

        const avisoTemperatura = sensor.checarTemperatura(Number(temperatura));
        const avisoUmidade = sensor.checarUmidade(Number(umidade));

        if(avisoTemperatura){
            console.log(avisoTemperatura);
        }

        if(avisoUmidade){
            console.log(avisoUmidade);
        }   

        rl.close();
    });
}); 


