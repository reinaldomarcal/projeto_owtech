/*
Created		12/06/2018
Modified		12/06/2018
Project		
Model		
Company		
Author		
Version		
Database		mySQL 5 
*/


Create table CLIENTE (
	ID_CLIENTE Int NOT NULL AUTO_INCREMENT,
	NOME Varchar(100),
	CNPJ Char(14) NOT NULL,
	INSCRICAO_ESTADUAL Char(14),
	REGIAO_VENDAS Char(20),
 Primary Key (ID_CLIENTE)
) ENGINE = MyISAM;

Create table ENDERECO (
	ID_ENDERECO Int UNSIGNED NOT NULL AUTO_INCREMENT,
	ENDERECO Varchar(100),
	NUMERO Char(6),
	CEP Char(10),
	BAIRRO Char(40),
	CIDADE Char(40),
	ESTADO Char(2),
	Index AI_ID_ENDERECO (ID_ENDERECO),
 Primary Key (ID_ENDERECO)
) ENGINE = MyISAM;

Create table CLIENTE_ENDERECO (
	ID_CLIENTE Int NOT NULL,
	ID_ENDERECO Int UNSIGNED NOT NULL,
 Primary Key (ID_CLIENTE,ID_ENDERECO),
 Foreign Key (ID_CLIENTE) references CLIENTE (ID_CLIENTE) on delete  restrict on update  restrict,
 Foreign Key (ID_ENDERECO) references ENDERECO (ID_ENDERECO) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table TELEFONE (
	ID_TELEFONE Int UNSIGNED NOT NULL AUTO_INCREMENT,
	DDD Int,
	NUMERO Char(20),
	WATTS Char(1),
	Index AI_ID_TELEFONE (ID_TELEFONE),
 Primary Key (ID_TELEFONE)
) ENGINE = MyISAM;

Create table EMAIL (
	ID_EMAIL Int UNSIGNED NOT NULL AUTO_INCREMENT,
	EMAIL Varchar(100),
	Index AI_ID_EMAIL (ID_EMAIL),
 Primary Key (ID_EMAIL)
) ENGINE = MyISAM;

Create table CLIENTE_TELEFONE (
	ID_CLIENTE Int NOT NULL,
	ID_TELEFONE Int UNSIGNED NOT NULL,
 Primary Key (ID_CLIENTE,ID_TELEFONE),
 Foreign Key (ID_CLIENTE) references CLIENTE (ID_CLIENTE) on delete  restrict on update  restrict,
 Foreign Key (ID_TELEFONE) references TELEFONE (ID_TELEFONE) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table CLIENTE_EMAIL (
	ID_CLIENTE Int NOT NULL,
	ID_EMAIL Int UNSIGNED NOT NULL,
 Primary Key (ID_CLIENTE,ID_EMAIL),
 Foreign Key (ID_CLIENTE) references CLIENTE (ID_CLIENTE) on delete  restrict on update  restrict,
 Foreign Key (ID_EMAIL) references EMAIL (ID_EMAIL) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table CONTATO (
	ID_CONTATO Int UNSIGNED NOT NULL AUTO_INCREMENT,
	NOME Varchar(100),
	FUNCAO Varchar(50),
	DEPARTAMENTO Varchar(60),
	Index AI_ID_CONTATO (ID_CONTATO),
 Primary Key (ID_CONTATO)
) ENGINE = MyISAM;

Create table CONTATO_EMAIL (
	ID_EMAIL Int UNSIGNED NOT NULL,
	ID_CONTATO Int UNSIGNED NOT NULL,
 Primary Key (ID_EMAIL,ID_CONTATO),
 Foreign Key (ID_EMAIL) references EMAIL (ID_EMAIL) on delete  restrict on update  restrict,
 Foreign Key (ID_CONTATO) references CONTATO (ID_CONTATO) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table CONTATO_TELEFONE (
	ID_CONTATO Int UNSIGNED NOT NULL,
	ID_TELEFONE Int UNSIGNED NOT NULL,
 Primary Key (ID_CONTATO,ID_TELEFONE),
 Foreign Key (ID_CONTATO) references CONTATO (ID_CONTATO) on delete  restrict on update  restrict,
 Foreign Key (ID_TELEFONE) references TELEFONE (ID_TELEFONE) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table CLIENTE_CONTATO (
	ID_CLIENTE Int NOT NULL,
	ID_CONTATO Int UNSIGNED NOT NULL,
 Primary Key (ID_CLIENTE,ID_CONTATO),
 Foreign Key (ID_CLIENTE) references CLIENTE (ID_CLIENTE) on delete  restrict on update  restrict,
 Foreign Key (ID_CONTATO) references CONTATO (ID_CONTATO) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table BALANCA (
	ID_BALANCA Int UNSIGNED NOT NULL AUTO_INCREMENT,
	SERIE Int NOT NULL,
	LOCAL Varchar(70),
	FABRICANTE Varchar(60),
	MODELO Varchar(50),
	CAPACIDADE Decimal(10,6),
	D Decimal(10,6),
	E Decimal(10,6),
	PORTARIA Char(40),
	INVENTARIO Int,
	Index AI_ID_BALANCA (ID_BALANCA),
 Primary Key (ID_BALANCA,SERIE)
) ENGINE = MyISAM;

Create table CLIENTE_BALANCA (
	ID_CLIENTE Int NOT NULL,
	ID_BALANCA Int UNSIGNED NOT NULL,
	SERIE Int NOT NULL,
 Primary Key (ID_CLIENTE,ID_BALANCA,SERIE),
 Foreign Key (ID_CLIENTE) references CLIENTE (ID_CLIENTE) on delete  restrict on update  restrict,
 Foreign Key (ID_BALANCA,SERIE) references BALANCA (ID_BALANCA,SERIE) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table AGENDAMENTO (
	ID_AGENDAMENTO Char(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	ID_PERIODO Int NOT NULL,
	ID_BALANCA Int UNSIGNED NOT NULL,
	SERIE Int NOT NULL,
	DIA Char(2),
	DATA_CADASTRO Date,
	Index AI_ID_AGENDAMENTO (ID_AGENDAMENTO),
 Primary Key (ID_AGENDAMENTO,ID_PERIODO,ID_BALANCA,SERIE),
 Foreign Key (ID_BALANCA,SERIE) references BALANCA (ID_BALANCA,SERIE) on delete  restrict on update  restrict,
 Foreign Key (ID_PERIODO) references PERIODO (ID_PERIODO) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table PERIODO (
	ID_PERIODO Int NOT NULL,
	QTDE_DIAS Int,
 Primary Key (ID_PERIODO)
) ENGINE = MyISAM;

Create table ORDEM_SERVICO (
	ID_ORDEM Int UNSIGNED NOT NULL AUTO_INCREMENT,
	ID_TIPO_SERVICO Int UNSIGNED NOT NULL,
	NRO_ORDEM Int NOT NULL,
	ID_TIPO_ATIVIDADE Int UNSIGNED NOT NULL,
	ID_TIPO_ORDEM Int UNSIGNED NOT NULL,
	ID_CLIENTE Int NOT NULL,
	ID_CONTATO Int UNSIGNED NOT NULL,
	ID_BALANCA Int UNSIGNED NOT NULL,
	SERIE Int NOT NULL,
	NRO_CONTRATO_SAP Char(50),
	DESCRICAO_GERAL Blob,
	OPERACAO Char(20),
	TEMPO_PREVISTO Time,
	DESCRICAO_OPERACAO Char(100),
	SINTOMA Char(100),
	DEFEITO Char(100),
	CAUSA Char(100),
	DATA_HORA_INICIAL Datetime,
	Index AI_ID_ORDEM (ID_ORDEM),
 Primary Key (ID_ORDEM,NRO_ORDEM),
 Foreign Key (ID_CLIENTE) references CLIENTE (ID_CLIENTE) on delete  restrict on update  restrict,
 Foreign Key (ID_CONTATO) references CONTATO (ID_CONTATO) on delete  restrict on update  restrict,
 Foreign Key (ID_BALANCA,SERIE) references BALANCA (ID_BALANCA,SERIE) on delete  restrict on update  restrict,
 Foreign Key (ID_TIPO_ORDEM) references TIPO_ORDEM_SERVICO (ID_TIPO_ORDEM) on delete  restrict on update  restrict,
 Foreign Key (ID_TIPO_ATIVIDADE) references TIPO_ATIVIDADE (ID_TIPO_ATIVIDADE) on delete  restrict on update  restrict,
 Foreign Key (ID_TIPO_SERVICO) references TIPO_SERVICO (ID_TIPO_SERVICO) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table TIPO_ORDEM_SERVICO (
	ID_TIPO_ORDEM Int UNSIGNED NOT NULL AUTO_INCREMENT,
	DESCRICAO Char(60),
	Index AI_ID_TIPO_ORDEM (ID_TIPO_ORDEM),
 Primary Key (ID_TIPO_ORDEM)
) ENGINE = MyISAM;

Create table TIPO_ATIVIDADE (
	ID_TIPO_ATIVIDADE Int UNSIGNED NOT NULL AUTO_INCREMENT,
	DESCRICAO Char(100),
	Index AI_ID_TIPO_ATIVIDADE (ID_TIPO_ATIVIDADE),
 Primary Key (ID_TIPO_ATIVIDADE)
) ENGINE = MyISAM;

Create table TIPO_SERVICO (
	ID_TIPO_SERVICO Int UNSIGNED NOT NULL AUTO_INCREMENT,
	DESCRICAO Char(100),
	Index AI_ID_TIPO_SERVICO (ID_TIPO_SERVICO),
 Primary Key (ID_TIPO_SERVICO)
) ENGINE = MyISAM;

Create table EMPRESA (
	ID_EMPRESA Int UNSIGNED NOT NULL AUTO_INCREMENT,
	NOME Char(150),
	CNPJ Char(14),
	INSCRICAO_ESTADUAL Char(14),
	LOGOTIPO Blob,
	Index AI_ID_EMPRESA (ID_EMPRESA),
 Primary Key (ID_EMPRESA)
) ENGINE = MyISAM;

Create table EMPRESA_ENDERECO (
	ID_EMPRESA Int UNSIGNED NOT NULL,
	ID_ENDERECO Int UNSIGNED NOT NULL,
 Primary Key (ID_EMPRESA,ID_ENDERECO),
 Foreign Key (ID_ENDERECO) references ENDERECO (ID_ENDERECO) on delete  restrict on update  restrict,
 Foreign Key (ID_EMPRESA) references EMPRESA (ID_EMPRESA) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table EMPRESA_TELEFONE (
	ID_EMPRESA Int UNSIGNED NOT NULL,
	ID_TELEFONE Int UNSIGNED NOT NULL,
 Primary Key (ID_EMPRESA,ID_TELEFONE),
 Foreign Key (ID_TELEFONE) references TELEFONE (ID_TELEFONE) on delete  restrict on update  restrict,
 Foreign Key (ID_EMPRESA) references EMPRESA (ID_EMPRESA) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table EMPRESA_EMAIL (
	ID_EMPRESA Int UNSIGNED NOT NULL,
	ID_EMAIL Int UNSIGNED NOT NULL,
 Primary Key (ID_EMPRESA,ID_EMAIL),
 Foreign Key (ID_EMAIL) references EMAIL (ID_EMAIL) on delete  restrict on update  restrict,
 Foreign Key (ID_EMPRESA) references EMPRESA (ID_EMPRESA) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table EMPRESA_CLIENTE (
	ID_EMPRESA Int UNSIGNED NOT NULL,
	ID_CLIENTE Int NOT NULL,
 Primary Key (ID_EMPRESA,ID_CLIENTE),
 Foreign Key (ID_CLIENTE) references CLIENTE (ID_CLIENTE) on delete  restrict on update  restrict,
 Foreign Key (ID_EMPRESA) references EMPRESA (ID_EMPRESA) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table CALIBRACAO (
	ID_CALIBRACAO Int UNSIGNED NOT NULL AUTO_INCREMENT,
	ID_TECNICO Int UNSIGNED NOT NULL,
	ID_CLIENTE Int NOT NULL,
	ID_BALANCA Int UNSIGNED NOT NULL,
	SERIE Int NOT NULL,
	PONTO_TRABALHO Int,
	CLASSE Char(5),
	LOCAL_CALIBRACAO Char(20),
	ESCENTRICIDADE_01 Decimal(10,6),
	ESCENTRICIDADE_02 Decimal(10,6),
	ESCENTRICIDADE_03 Decimal(10,6),
	ESCENTRICIDADE_04 Decimal(10,6),
	ESCENTRICIDADE_05 Decimal(10,6),
	ESCENTRICIDADE_06 Decimal(10,6),
	ESCENTRICIDADE_07 Decimal(10,6),
	ESCENTRICIDADE_08 Decimal(10,6),
	ESCENTRICIDADE_09 Decimal(10,6),
	ESCENTRICIDADE_10 Decimal(10,6),
	ESCENTRICIDADE_11 Decimal(10,6),
	ESCENTRICIDADE_12 Decimal(10,6),
	ESCENTRICIDADE_13 Decimal(10,6),
	PROVA_FIDELIDADE_01 Decimal(10,6),
	PROVA_FIDELIDADE_02 Decimal(10,6),
	PROVA_FIDELIDADE_03 Decimal(10,6),
	PROVA_FIDELIDADE_04 Decimal(10,6),
	LEITURA_SEM_SOBRECARGA Decimal(10,6),
	SOBRECARGA_APLICADA Decimal(10,6),
	LEITURA_APOS_SOBRECARGA Decimal(10,6),
	DATA_CALIBRACAO Datetime,
	Index AI_ID_CALIBRACAO (ID_CALIBRACAO),
 Primary Key (ID_CALIBRACAO,ID_CLIENTE,ID_BALANCA,SERIE),
 Foreign Key (ID_CLIENTE) references CLIENTE (ID_CLIENTE) on delete  restrict on update  restrict,
 Foreign Key (ID_BALANCA,SERIE) references BALANCA (ID_BALANCA,SERIE) on delete  restrict on update  restrict,
 Foreign Key (ID_TECNICO) references TECNICO (ID_TECNICO) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table TESTE_PESAGEM (
	ID_CALIBRACAO Int UNSIGNED NOT NULL,
	ID_CLIENTE Int NOT NULL,
	ID_BALANCA Int UNSIGNED NOT NULL,
	SERIE Int NOT NULL,
	CARGA Decimal(10,6),
	LEITURA_ANTES Decimal(10,6),
	LEITURA_DEPOIS Decimal(10,6),
	ERRO_ANTES Decimal(10,6),
	ERRO_DEPOIS Decimal(10,6),
 Foreign Key (ID_CALIBRACAO,ID_CLIENTE,ID_BALANCA,SERIE) references CALIBRACAO (ID_CALIBRACAO,ID_CLIENTE,ID_BALANCA,SERIE) on delete  restrict on update  restrict
) ENGINE = MyISAM;

Create table TECNICO (
	ID_TECNICO Int UNSIGNED NOT NULL AUTO_INCREMENT,
	NOME Char(100),
	Index AI_ID_TECNICO (ID_TECNICO),
 Primary Key (ID_TECNICO)
) ENGINE = MyISAM;


/* Users permissions */


