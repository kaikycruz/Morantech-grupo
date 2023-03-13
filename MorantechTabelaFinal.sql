create database MoranTech;
use MoranTech;

-- TABELA DE CADASTRO DO CLIENTE
create table cadastro (
idCliente int primary key auto_increment,
nome varchar(60) NOT NULL,
genero char(1), constraint chkGenero check (genero in('F','M','N')), 
email varchar(70) UNIQUE NOT NULL, constraint chkEmail CHECK (email like '%@%'),
senha varchar(20) NOT NULL,
telefone char(13) default '(00)000000000',
empresa varchar(50) not null,
cidade varchar(50),
UF char(2),
CNPJ char(18)
) auto_increment = 100;

insert into cadastro values
(null, 'Pedro', 'M', 'pedrorangos@gmail.com', 'ghaks13IK#', '(11)942678493', 'Pedro Morangos', 'São Paulo', 'SP', '12.531.198/0001-01'),
(null, 'Vanessa', 'F', 'strawberriesfresh@gmail.com', 'fhks11LL/', '(31)92029256', 'Strawberries Fresh', 'Juiz de Fora', 'MG', '13.421.013/0298-03'),
(null, 'Valter', 'M', 'moranguinhos@hotmail.com', '@Hijs19', '(42)992874566', 'Moranguinhos', 'Ponta Grossa', 'PA', '14.421.123/0021-12'),
(null, 'Pablo', 'M', 'fresafresca@gmail.com', '/Pksd120', '(75)99280835', 'Fresa Fresca', 'São Desidério ', 'BA', '16.726.121/0972-02'),
(null, 'Alex', 'N', 'morangocarioca@outlook.com', 'Mc#10098', '(21)992590345', 'Morango Carioca', 'Rio de Janeiro', 'RJ', '12.716.111/0574-04');

-- comandos

desc cadastro;
select * from cadastro;
select * from cadastro where nome like 'V%';
select email from cadastro order by Nome desc;
select nome, UF from cadastro;

-- erro

insert into cadastro (nome, email, senha, empresa) values
('Adriane' 'G' 'redmorango#gmail.com', null);




-- TABELA DE SENSOR

create table Modelo_sensor (
idModelo int primary key auto_increment,
modelo varchar(10) not null,
medição varchar(20), constraint chkMedicao check (medição in ('Temperatura','Umidade','Temperatura/Umidade')),
serialNumber char(9) unique not null -- (SU2023001)
) auto_increment = 1;

insert into Modelo_sensor values
(null, 'DHT11', 'Temperatura/Umidade', 'SD2023001'),
(null, 'DHT11', 'Temperatura/Umidade', 'SD2023002'),
(null, 'L3RS', 'Temperatura', 'ST2023001');

-- comandos

desc Modelo_sensor;
select * from Modelo_sensor;
select * from Modelo_sensor where modelo = 'DHT11';

-- erro
insert into Modelo_sensor values
(null, 'DHTT11', 'Bloqueio', 'SB2023001');


-- tabela sensor
create table sensor(
idSensor int primary key auto_increment,
situaçao varchar(1), constraint chkSituaçao check (situaçao in ('A','I')),
qtdSensores int,
dtManutençao date
);
drop table sensor;
insert into sensor values
(null, 'I', 1, '2023-03-20' ),
(null, 'A', 3, '2023-09-15' ),
(null, 'I', 4, '2023-03-15');

-- comandos
desc sensor;
select * from sensor;
select * from sensor where situaçao = 'I';
select dtManutençao from sensor where idSensor = '3';

-- erro
insert into sensor values 
(null, 'N', 1, '2023-06-18');



create table dados_sensor(
idDados int primary key auto_increment,
temperatura varchar(6) not null,
umidade varchar(7) not null
);
insert into dados_sensor (temperatura, umidade) values
('28.50', '80.00'),
('29.00', '90.00' );

-- TABELA DE FUNCIONÁRIOS
create table funcionarios (
idFuncionario int primary key auto_increment,
nome varchar(60) not null,
matricula char(10) unique not null, -- (M202303001)
CPF char(14) not null,
cargo varchar(30) not null,
cargaHorariaSemanal int
) auto_increment = 1;

insert into funcionarios values
(null, 'Gustavo', 'M202301001','234.456.123-20', 'SAC', 30),
(null, 'Kaiky', 'M202301002','243.534.674-24', 'SAC', 30),
(null, 'Vinicius', 'M202301003','987.732.456-48', 'Manutenção TI', 25),
(null,'Samuel','M202301004','675.654.356-08','Manutenção sensor', 15),
(null,'Anna','M202301005','754.657.238-35','Manutenção sensor', 15),
(null,'Guilherme','M202301006','754.132.454-12','Análise Jurídica', 5),
(null,'Renata','M202301007','477.657.765-78','Análise Jurídica', 5),
(null,'João','M202301008','876.455.234-23','TI', 5),
(null,'Fernando','M202301009','876.434.876.24','TI', 5);

-- comandos
desc funcionarios;
select * from funcionarios;
select * from funcionarios where nome like 'G%';
select cargaHorariaSemanal from funcionarios where cargo = 'Manutenção sensor';

-- erro

insert into funcionarios values
(null, 'Gabriel', 'M202301002', '518.055.308-36', 'SAC', '12');
