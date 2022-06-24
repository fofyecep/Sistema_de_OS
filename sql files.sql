-- comentários

show databases;

-- a linha abaixo cria um banco de dados
create database dbinfox;
-- a linha abaixo escolhe o banco de dados
use dbinfox;
-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
-- o comando abaixo descreve a tabela
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- create --> insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'Carlos Eduardo Pinto','98553-5165','carlos','123');
-- a linha abaixo exibe os dados da tabela (CRUD)
-- read --> select
select * from tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'Karina DIasi Terra','98778-9343','karina','123');

insert into tbusuarios(iduser,usuario,fone,login,senha,perfil)
values(3,'Haidee DIasi Terra Pinto','0000-0000','haidee','123','user');


-- a linha abaixo modifica dados na tabela (CRUD)
-- update --> update
update tbusuarios set fone='8888-8888' where iduser=3;

-- a linha abaixo apaga um registro da tabela (CRUD)
-- delete --> delete
delete from tbusuarios where iduser=3;

select * from tbusuarios;

-- cria a tabela de clientes
create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fone varchar(50) not null,
emailcli varchar(50) 
);

describe tbclientes;



insert into tbclientes(nomecli,endcli,fone,emailcli)
values('linus torvalds','rua tux, 2015','999-999','linux@linux.com');

select * from tbclientes;

-- o sistema vai gerar automaticamente a os
create table tbos(
-- cria o numero da os automatico com incremento crescente
os int primary key auto_increment,
-- puxa a data do sistema
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
-- impede que haja um equipamento sem cliente vinculado
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

-- inserindo registro na tabela os
insert into tbos (equipamento,defeito,servico,tecnico,valor,idcli)
values('impressora','enrosca papel','lubrificação','carlos','120.00','2');

select * from tbos;

-- o codigo abaixo traz informaçoes de duas tabelas unidas
select
-- criando variaveis
O.os,equipamento,defeito,servico,valor,
C.nomecli,fone
-- da onde
from tbos as O
-- junte com
inner join tbclientes as C
-- onde a chave estrangeira da tabela os seja igual a chave primaria da tabela cliente
on(O.idcli = C.idcli);

-- a linha abaixo adiciona um campo a tabela
alter table tbusuarios add column perfil varchar(20) not null;
-- a linha abaixo remove um campo de uma tabela
-- alter table tbusuarios drop column perfil;
-- a linha a baixo adiciona o perfil de administrador no usuario 1
update tbusuarios set perfil = "admin" where iduser = 1;
update tbusuarios set perfil = "admin" where iduser = 2;
update tbusuarios set perfil = "user" where iduser = 3;

select * from tbusuarios where iduser=2;
-- busca com filtro a partir da informação requerida
select * from tbclientes where nomecli like 'b%';




select * from tbclientes;
-- seleciona id, nome e telefone da tabela clientes com filtro "jo"
select idcli,nomecli,fone from tbclientes where nomecli like 'jo%';

-- a instruçao "as" coloca um apelido nas variaveis da tabela
select idcli as Id,nomecli as Nome,fone as Telefone from tbclientes where nomecli like 'jo%';

-- mostra a tabela de os
describe tbos;
-- a linha abaixo altera a tabela adicionando um campo em uma determinada posição
alter table tbos add tipo varchar(15) not null after data_os;
-- a linha abaixo altera a tabela adicionando um campo em uma determinada posição
alter table tbos add situacao varchar(20) not null after tipo;
-- mostra a tabela de os
describe tbos;
-- verifica se existem registros inseridos na tabela os
select * from tbos;

-- a instrução abaixo seleciona e ordeno por nome todos os clientes cadastrados - copiar essa linha no ireport
select * from tbclientes order by nomecli;

-- o bloco de instruções abaixo faz a seleção e uniao de dados de duas tabelas
-- OSER é uma variavel que contem os campos desejados da tabela OS
-- CLI é outra variavel que contem os campos desejados da tabela clientes
-- copiar esse bloco no ireport
select
OSER.os,data_os,tipo,situacao,equipamento,valor,
CLI.nomecli,fone
from tbos as OSER
inner join tbclientes as CLI
on (CLI.idcli = OSER.idcli);

select * from tbos;
select * from tbos where os=5;

