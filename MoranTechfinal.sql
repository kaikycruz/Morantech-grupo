CREATE DATABASE morantech;

use Morantech;

-- TABELA DE CADASTRO DO CLIENTE
create table cadastro (
idCliente int primary key auto_increment,
nome varchar(60) NOT NULL,
email varchar(30) UNIQUE NOT NULL, constraint chkEmail CHECK (email like '%@%'),
senha varchar(20) NOT NULL,
telefone char(13) default('(00)000000000'),
cidade varchar(50),
uf char(2),
cnpj char(18) NOT NULL
) auto_increment = 100;


insert into cadastro values
(null, 'Transports', 'transportsmorango@morantech', 'transports123', '(11)901234567', 'Belo Horizonte', 'MG', '00.000.000/0000-01'),
(null, 'Leva e Traz Morango', 'levaetrazmorango@morantech', 'levaetraz123', '(11)901234568', 'Salvador', 'BA', '00.000.000/0000-02'),
(null, 'Truck do strawberry', 'truckdomorango@morantech', 'truck123', '(11)901234569', 'São Paulo', 'SP', '00.000.000/0000-03');

INSERT INTO cadastro VALUES
(NULL, 'ZE DA FRUTA', 'zemorango#morantech', 'ze321', '(11)921386415', '00.123.456/0001.21');


select * from cadastro;


-- TABELA DE SENSOR
create table sensor (
idSensor int primary key auto_increment,
modelo varchar(10),
medição varchar(20),
serialNumber char(9) -- (SU2023001)
) auto_increment = 1;

insert into sensor values
(null, 'SU-100', 'Umidade', 'SU2023001'),
(null, 'ST-100', 'Temperatura', 'ST2023002'),
(null, 'SB-100', 'Bloqueio', 'SB2023003');

select * from sensor;


-- TABELA DE RECURSOS 
create table Recursos (
idRecurso int primary key,
situacao char(1), constraint chksituacao check (situacao in('A', 'I')),
qtdSensores int,
dtManutencao DATE,
qtdCamara int  
);

insert into Recursos values
(1, 'I', 5, '2023-06-02', 3),
(2, 'A', 7, '2023-04-15', 4),
(3, 'A', 9, '2023-02-20', 5);

select * from Recursos;


-- TABELA DE FUNCIONÁRIOS
create table funcionarios (
idFuncionario int primary key auto_increment,
nome varchar(60),
matricula char(10), -- (M202303001)
cargo varchar(30),
cargaHorariaSemanal int
) auto_increment = 1;

insert into funcionarios values
(null, 'Gustavo', 'M202301001', 'Técnico de Instalação', 40),
(null, 'Kaiky', 'M202301002', 'Diretor', 30),
(null, 'Vinicius', 'M202301003', 'Suporte TI', 36);

select * from funcionarios;