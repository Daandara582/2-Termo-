

function classificareficiencia( percentual) {
    if (percentual > 90) 
        return "Meta Atingida ";
    }

    if (percentual >70 && percentual <89) {
        return "Atenção";
    }

    if (percentual <70 ) {
        return "Abaixo da meta"
    }

module.exports = { 
    classificareficiencia

}