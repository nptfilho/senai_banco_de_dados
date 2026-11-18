-- Criando o banco de dados do jogo de RPG
CREATE DATABASE RPG_Online;
GO

-- Selecionando o banco de dados para uso
USE RPG_Online;
GO

-- 1. Tabela de Usuários
CREATE TABLE USUARIOS (
    UsuarioId INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(100) NOT NULL,
    Senha VARCHAR(100) NOT NULL
);
GO

-- 2. Tabela de Classes
CREATE TABLE CLASSES (
    ClasseId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(255)
);
GO

-- 3. Tabela de Personagens (Depende de Usuários e Classes)
CREATE TABLE PERSONAGENS (
    PersonagemId INT IDENTITY(1,1) PRIMARY KEY,
    NomePersonagem VARCHAR(50) NOT NULL,
    UsuarioId INT NOT NULL,
    ClasseId INT NOT NULL,
    FOREIGN KEY (UsuarioId) REFERENCES USUARIOS(UsuarioId),
    FOREIGN KEY (ClasseId) REFERENCES CLASSES(ClasseId)
);
GO

-- 4. Tabela de Habilidades
CREATE TABLE HABILIDADES (
    HabilidadeId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);
GO

-- 5. Tabela Associativa: Classes e Habilidades (Relação N:N)
CREATE TABLE CLASSES_HABILIDADES (
    ClasseId INT NOT NULL,
    HabilidadeId INT NOT NULL,
    PRIMARY KEY (ClasseId, HabilidadeId),
    FOREIGN KEY (ClasseId) REFERENCES CLASSES(ClasseId),
    FOREIGN KEY (HabilidadeId) REFERENCES HABILIDADES(HabilidadeId)
);
GO