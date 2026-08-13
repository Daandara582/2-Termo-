# 2º_Termo - Exercícios de Node.js

Este repositório contém exercícios e exemplos usados nas aulas de Node.js do curso do Prof. Celso Ricardo Carvalho. Os arquivos estão organizados por pastas de aula e por exercícios práticos (laços, arrays e desafios).

**Tecnologias utilizadas:**
- Node.js
- Biblioteca `readline-sync` (entrada via terminal)

**Estrutura de pastas:**
- BACKEND/: código fonte das aulas e exercícios
  - Aula_1/: fundamentos, variáveis, tipos, entrada/saída e exemplos básicos
  - Aula_2/: exercícios adicionais (ex.: classificação por idade, comparações)
  - Desafios/: exercícios propostos
  - Lacos/: exercícios com loops e arrays
- BCD/, LIMA/, PROJETOS/: arquivos de apoio/teste

**Resumo dos exercícios por pasta**

- Aula_1
  - [app1.js](BACKEND/Aula_1/app1.js) — Hello World e exemplos simples
  - [app2.js](BACKEND/Aula_1/app2.js) — variáveis e impressão
  - [app3.js](BACKEND/Aula_1/app3.js) — tipos e `typeof`
  - [app4.js](BACKEND/Aula_1/app4.js) — sistema simples de vendas (recebimento e total)
  - [app5.js](BACKEND/Aula_1/app5.js) — análise de crédito (condicionais compostas)
  - [app6.js](BACKEND/Aula_1/app6.js) — operação módulo (`%`)
  - [multi.js](BACKEND/Aula_1/multi.js) — cálculo de média e situação do aluno (aprovado/recuperação/reprovado)

- Aula_2
  - [imc.js](BACKEND/Aula_2/imc.js) — classificação por faixas etárias (ex.: natação)
  - [produtos.js](BACKEND/Aula_2/produtos.js) — cálculo de proporção (álcool x gasolina)

- Lacos
  - [ex1.js](BACKEND/Lacos/ex1.js) — tabuada (for loop)
  - [ex2.js](BACKEND/Lacos/ex2.js) — exemplo com while (incrementos)
  - [aray.js](BACKEND/Lacos/aray.js) — uso de arrays
  - [ex3.js](BACKEND/Lacos/ex3.js) — menu interativo (while + opções)
  - [ex4.js](BACKEND/Lacos/ex4.js) — loop com grande iteração
  - [teste.js](BACKEND/Lacos/teste.js) — exemplo de controle/validação

- Desafios
  - [desafio1.js](BACKEND/Desafios/desafio1.js) — versão de desafio de vendas/recibo
  - [desafio4.js](BACKEND/Desafios/desafio4.js) — desafio de classificação/condicionais

Observação: há arquivos com pequenas inconsistências (ex.: validações de string em condições) que podem ser corrigidos como exercício.

**Como executar os arquivos (Node.js)**

1. Instale as dependências (há uso de `readline-sync`):

```bash
npm install
```

2. Execute um arquivo com Node.js a partir da raiz do projeto. Exemplo:

```bash
node BACKEND/Aula_1/app4.js
```

Se o script usar entrada pelo terminal (readline-sync), responda às mensagens no console.

**Instruções básicas de Git**

Inicializar repositório (se ainda não estiver inicializado):

```bash
git init
git add .
git commit -m "Initial commit: exercícios Node.js"
```

Fluxo comum de trabalho:

```bash
git checkout -b minha-feature
# editar/Adicionar arquivos
git add .
git commit -m "Descrição do que foi feito"
git push origin minha-feature
```

**Autor**: Prof. Celso Ricardo Carvalho

---

Se desejar, eu posso:
- ajustar/formatar os exemplos com correções (ex.: validar loops e entradas),
- combinar arquivos repetidos ou remover versões de teste,
- gerar um script `npm run start` para facilitar a execução.
# 2o_Termo1
