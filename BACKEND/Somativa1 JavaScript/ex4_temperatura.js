const entrada = require ('readline-sync')

const temperatura=entrada.questionInt("Qual a Temperatura");

if (temperatura <60){
   console.log ("Situação Normal") 
}
if (temperatura >60 && temperatura <80) {
    console.log("Atenção!");
}
if  (temperatura >80){
    console.log("Situação Crítíca!!");
}
