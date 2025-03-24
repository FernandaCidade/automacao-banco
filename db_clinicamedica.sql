--Usar o BD
use clinica_medica;

-- Criando as tabelas 

create table paciente(
	cpf varchar(14) primary key,
	nome_paciente varchar(40),
	telefone varchar(14),
	numero_plano int,
	nome_plano varchar(20),
	tipo_plano varchar(10)
);

create table medico(
	crm int primary key,
	nome_medico varchar(30),
	especialidade varchar(20)
);

create table consulta(
	numero_consulta int primary key,
	data_consulta date,
	horario_consulta time
);

create table pedido_exame(
	numero_pedido int primary key,
	resultado varchar(40),
	data_exame date, 
	valor_pagar money
);

create table exame(
	codigo int primary key,
	especificacao varchar(20),
	preco money
);

--  Fazendo altera��es na tabela consulta
ALTER TABLE consulta ADD fk_paciente_cpf varchar(14);

ALTER TABLE consulta ADD fk_medico_crm int;


--ALTER TABLE consulta DROP CONSTRAINT fk_paciente_cpf;
--ALTER TABLE consulta DROP COLUMN fk_medico_crm;


-- Adiciona a chave estrangeira referenciando as tabelas

ALTER TABLE consulta 
ADD CONSTRAINT fk_paciente_cpf 
FOREIGN KEY (fk_paciente_cpf) 
REFERENCES paciente(cpf);

ALTER TABLE consulta 
ADD CONSTRAINT fk_medico_crm 
FOREIGN KEY (fk_medico_crm) 
REFERENCES medico(crm);

--Alterado a tabela pedido_exame

alter table pedido_exame add fk_consulta_numero_consulta int;
alter table pedido_exame add fk_exame_codigo int;

--Adicionado chaves estrangeiras

alter table pedido_exame
add constraint  fk_consulta_numero_consulta
foreign key (fk_consulta_numero_consulta)
references consulta(numero_consulta);

alter table pedido_exame
add constraint fk_exame_codigo
foreign key (fk_exame_codigo)
references exame(codigo);

--Inserir informa��es dentro das tabelas

--Tabela paciente
INSERT INTO paciente (cpf, nome_paciente, telefone, numero_plano, nome_plano, tipo_plano)
VALUES 
('12345678900', 'Fernanda Cidade', '(11)91234-5678', 1, 'Plano A', 'B�sico'),
('09876543211', 'K�ssia Millena', '(21)98765-4321', 2, 'Plano B', 'Premium');

--Tabela Medico
INSERT INTO medico (crm, nome_medico, especialidade)
VALUES 
(12345, 'Dr. Pedro Santos', 'Cardiologista'),
(67890, 'Dra. Ana Costa', 'Dermatologista');

--Tabela Consulta
INSERT INTO consulta (numero_consulta, data_consulta, horario_consulta, fk_paciente_cpf, fk_medico_crm)
VALUES 
(1, '2024-08-30', '14:00:00', '12345678900', 67890),
(2, '2024-09-01', '09:00:00', '09876543211', 12345);

--Tabela exame
INSERT INTO exame 
VALUES 
(101, 'Exame de Sangue', 50.00),
(102, 'Raio-X', 100.00);

--Tabela Pedido Exame

INSERT INTO pedido_exame 
VALUES 
(1, 'Negativo', '2024-08-31', 150.00, 1, 102),
(2, 'Positivo', '2024-09-02', 200.00, 2, 101);

--Consultar
select * from consulta;
select * from medico where crm = 12345;