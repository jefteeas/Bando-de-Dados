CREATE DATABASE faculdade;

USE faculdade;

CREATE TABLE departamento(
    id int NOT NULL AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    local varchar(255),
    PRIMARY KEY(id)
);

CREATE TABLE aluno(
    nome varchar(255) NOT NULL
    data_nascimento date,
    matricula varchar(10) NOT NULL,
    endereço varchar(255),
    PRIMARY KEY(matricula)
);

CREATE TABLE disciplina(
    nome varchar(100) NOT NULL,
    carga_horaria int NOT NULL DEFAULT 30,
    ementa text,
    PRIMARY KEY(nome)
);

CREATE TABLE professor(
    inicio_contrato date,
    nome varchar(255) NOT NULL,
    cpf varchar(11) NOT NULL,
    depto_id int,
    PRIMARY KEY(cpf),
    FOREIGN KEY (depto_id) REFERENCES departamento(id)
);

CREATE TABLE professor_contato(
    prof_cpf varchar(11) NOT NULL,
    contato varchar(14) NOT NULL,
    FOREIGN KEY (prof_cpf) REFERENCES professor(cpf),
    CONSTRAINT PK_professor_contato PRIMARY KEY (prof_cpf, contato) 
);

CREATE TABLE avaliacao(
    prof_cpf varchar(11) NOT NULL,
    data_hora datetime NOT NULL,
    comentario varchar(500),
    note int,
    FOREIGN KEY(prof_cpf) REFERENCES professor(cpf),
    PRIMARY KEY (prof_cpf, data_hora)
);

ALTER TABLE departamento
    ADD prof_chefe_cpf varchar(11),
    ADD FOREIGN KEY(prof_chefe_cpf) REFERENCES professor(cpf);

ALTER TABLE disciplina
    ADD disc_pre_requisito varchar(100),
    ADD FOREIGN KEY (disc_pre_requisito) REFERENCES disciplina(nome);

CREATE TABLE alino_disciplina(
    matricula varchar(10) NOT NULL,
    nome varchar(100) NOT NULL,

    PRIMARY KEY(cpf, nome),
    FOREIGN KEY(cpf) REFERENCES professor(cpf),
    FOREIGN KEY(nome) REFERENCES disciplina(nome)
);

CREATE TABLE professor_disciplina(
    cpf varchar(11) NOT NULL,
    nome varchar(100) NOT NULL,

    PRIMARY KEY(cpf, nome),
    FOREIGN KEY(cpf) REFERENCES professor(cpf)
    FOREIGN KEY(nome) REFERENCES disciplina(nome)
);