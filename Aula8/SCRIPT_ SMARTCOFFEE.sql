
CREATE DATABASE IF NOT EXISTS Aula8;

USE Aula8; 

CREATE TABLE Cliente (
    Id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    endereco VARCHAR(255),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    telefone VARCHAR(20),
    email VARCHAR(60)
);

CREATE TABLE Funcionarios (
    Id_Funcionarios INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    salario DECIMAL(10,2),
    cargo VARCHAR(50),
    telefone VARCHAR(20),
    data_admissao DATE NOT NULL
);

CREATE TABLE Produtos (
    Id_Produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    categoria VARCHAR(50),
    descricao TEXT,
    preco_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Estoque_Insumo (
    Id_Insumo INT AUTO_INCREMENT PRIMARY KEY,
    nome_insumo VARCHAR(100) NOT NULL,
    quantidade_minima DECIMAL(10,3) NOT NULL,
    quantidade_atual DECIMAL(10,3) NOT NULL,
    unidade_medida VARCHAR(20) NOT NULL
);

CREATE TABLE Fornecedor (
    Id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    email VARCHAR(40),
    endereco VARCHAR(255)
);

CREATE TABLE Promocao (
    Id_Promocao INT AUTO_INCREMENT PRIMARY KEY,
    inicio DATE NOT NULL,
    fim DATE NOT NULL,
    desconto DECIMAL(10,2),
    percentual DECIMAL(5,2)
);

CREATE TABLE Delivery (
    Id_delivery INT AUTO_INCREMENT PRIMARY KEY,
    endereco_entrega VARCHAR(255) NOT NULL,
    taxa_entrega DECIMAL(10,2) DEFAULT 0.00,
    status_entrega VARCHAR(30),
    data_hora_saida DATETIME
);

CREATE TABLE Programa_Fidelidade (
    Id_fidelidade INT AUTO_INCREMENT PRIMARY KEY,
    saldos_pontos INT DEFAULT 0,
    data_ultima_atualizacao DATETIME,
    Id_cliente INT UNIQUE,
    CONSTRAINT fk_fidelidade_cliente FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_cliente) ON DELETE CASCADE
);

CREATE TABLE Pagamento (
    Id_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    forma_pagamento VARCHAR(30) NOT NULL,
    status_pagamento VARCHAR(30) NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    data_hora_pagamento DATETIME NOT NULL
);

CREATE TABLE Pedidos (
    Id_pedidos INT AUTO_INCREMENT PRIMARY KEY,
    tipo_pedido VARCHAR(30) NOT NULL,
    data_hora DATETIME NOT NULL,
    status VARCHAR(30) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    Id_cliente INT NOT NULL,
    Id_Pagamento INT UNIQUE,
    CONSTRAINT fk_pedidos_cliente FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_cliente),
    CONSTRAINT fk_pedidos_pagamento FOREIGN KEY (Id_Pagamento) REFERENCES Pagamento(Id_Pagamento)
);



CREATE TABLE Consome (
    Id_Insumo INT,
    Id_Produto INT,
    PRIMARY KEY (Id_Insumo, Id_Produto),
    CONSTRAINT fk_consome_insumo FOREIGN KEY (Id_Insumo) REFERENCES Estoque_Insumo(Id_Insumo) ON DELETE CASCADE,
    CONSTRAINT fk_consome_produto FOREIGN KEY (Id_Produto) REFERENCES Produtos(Id_Produto) ON DELETE CASCADE
);

CREATE TABLE Entregam (
    Id_delivery INT,
    Id_Funcionarios INT,
    PRIMARY KEY (Id_delivery, Id_Funcionarios),
    CONSTRAINT fk_entregam_delivery FOREIGN KEY (Id_delivery) REFERENCES Delivery(Id_delivery) ON DELETE CASCADE,
    CONSTRAINT fk_entregam_funcionario FOREIGN KEY (Id_Funcionarios) REFERENCES Funcionarios(Id_Funcionarios) ON DELETE CASCADE
);

CREATE TABLE Fornece (
    Id_Promocao INT,
    Id_fornecedor INT,
    PRIMARY KEY (Id_Promocao, Id_fornecedor),
    CONSTRAINT fk_fornece_promocao FOREIGN KEY (Id_Promocao) REFERENCES Promocao(Id_Promocao) ON DELETE CASCADE,
    CONSTRAINT fk_fornece_fornecedor FOREIGN KEY (Id_fornecedor) REFERENCES Fornecedor(Id_fornecedor) ON DELETE CASCADE
);