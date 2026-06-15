CREATE TABLE cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR(50) NOT NULL,
cpfCliente CHAR(11) NOT NULL UNIQUE,
email VARCHAR (50) NOT NULL,
cidade VARCHAR(50) NOT NULL, 
estado CHAR(2) NOT NULL, 
cep CHAR(8),
tipoLogradouro VARCHAR (30) NOT NULL, 
nomeLogradouro VARCHAR (50) NOT NULL, 
numero VARCHAR(7) NOT NULL,
complemento VARCHAR(30)
);
 
CREATE TABLE funcionario (
idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
nomeFuncionario VARCHAR(50) NOT NULL,
cpfFuncionario CHAR(11) NOT NULL UNIQUE,
celularFuncionario CHAR(11) NOT NULL
);
 
CREATE TABLE equipamento (
idequipamento INT PRIMARY KEY AUTO_INCREMENT,
nomeequipamento VARCHAR(50) NOT NULL,
qtd INT NOT NULL,
valorHora DECIMAL(5,2) NOT NULL
);
 
CREATE TABLE aluguel (
idaluguel INT PRIMARY KEY AUTO_INCREMENT,
idFuncionario INT NOT NULL,
idCliente INT NOT NULL,
dataHoraRetirada DATETIME NOT NULL,
dataHoraDevolucao DATETIME,
valorPagar DECIMAL (10,2),
valorPago DECIMAL (10,2),
pago BIT,
formaPagamento VARCHAR(50),
qtVezes INT,
CONSTRAINT fk_aluguel_funcionario FOREIGN KEY (idFuncionario)
REFERENCES funcionario(idFuncionario),
CONSTRAINT fk_aluguel_client FOREIGN KEY (idCliente)
REFERENCES cliente(idCliente)
);
 
CREATE TABLE aluguelEquipamento (
idaluguelEquipamento INT PRIMARY KEY AUTO_INCREMENT,
idequipamento INT NOT NULL,
idaluguel INT NOT NULL,
valorItem DECIMAL (10,2) NOT NULL,
valorUnitario DECIMAL (10,2) NOT NULL,
qtd INT,
CONSTRAINT fk_aluguelEquipamento_equipamento FOREIGN KEY (idequipamento)
REFERENCES equipamento(idequipamento),
CONSTRAINT fk_aluguelEquipamento_aluguel FOREIGN KEY (idaluguel)
REFERENCES aluguel(idaluguel)
);
 INSERT INTO cliente(nomeCliente, cpfCliente, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento) VALUES
('Donald','32165498700','donald@uol.com.br','Santos','SP','11030001','Rua','das Gaivotas','125','Casa'),
('Margarida','45612378955','margarida@uol.com.br','São Vicente','SP','11320010','Avenida','Flor de Maio','88','Apartamento 12'),
('Patinhas','78965412399','patinhas@uol.com.br','Florianópolis','SC','88015200','Rua','dos Pinhais','410','Casa'),
('Huguinho','14523698701','huguinho@gmail.com','Santos','SP','11050040','Rua','Dom Duarte','233','Apartamento 21'),
('Luizinho','25896314785','luizinho@gmail.com','Praia Grande','SP','11700450','Avenida','Atlântica','915','Apartamento 35'),
('Zezinho','96385274112','zezinho@gmail.com','São Vicente','SP','11350020','Rua','Itororó','56','Casa'),
('Pardal','35795125899','pardal@uol.com.br','Santos','SP','11040030','Rua','Pedro Lessa','725','Casa'),
('Zé Carioca','65478932177','zecarioca@uol.com.br','Rio de Janeiro','RJ','20230015','Rua','das Palmeiras','50','Casa'),
('Mickey','78541236944','mickey@hotmail.com','Recife','PE','50030020','Avenida','Boa Viagem','1420','Apartamento 402'),
('Minie','98745632170','minie@gmail.com','Recife','PE','50060230','Rua','Aurora','98','Apartamento 18'),
('Pateta','12378965420','pateta@gmail.com','Curitiba','PR','80010030','Rua','XV de Novembro','111','Apartamento 15'),
('Branca de Neve','65412398711','brancadeneve@hotmail.com','São Joaquim','SC','88600000','Rua','das Neves','74','Apartamento 03'),
('Aladin','78912365488','aladin@gmail.com','Belém','PA','66010050','Travessa','Nazaré','301','Apartamento 11'),
('Cinderela','96374125833','cinderela@hotmail.com','Goiânia','GO','74000020','Rua','dos Sonhos','400','Casa'),
('Mulan','35715948622','mulan@gmail.com','Rio das Ostras','RJ','28890000','Rua','do Luar','182','Apartamento 22'),
('Moana','85245697130','moana@gmail.com','Paraty','RJ','23970000','Avenida','das Águas','377','Apartamento 02'),
('Asnésio','95135725860','asnesio@uol.com.br','Belo Horizonte','MG','30110020','Rua','Minas Gerais','295','Apartamento 13'),
('Maga Patalógica','75395145699','magapatalogica@gmail.com','Cubatão','SP','11510050','Rua','São Paulo','55','Apartamento 24'),
('Capitão Boeing','85274196310','capitaoboeing@uol.com.br','Manaus','AM','69005100','Rua','Amazonas','101','Casa'),
('Pão Duro Mac Money','78965425871','paoduro@ig.com.br','Osasco','SP','06010120','Rua','dos Economistas','12','Apartamento 44');
 
INSERT INTO funcionario(nomeFuncionario, cpfFuncionario, celularFuncionario) VALUES
('Cebolinha','32165498711','91030001'),
('Cascão','32165498701','98030001'),
('Chico Bento','32165498702','18030001');
 
INSERT INTO equipamento(nomeequipamento, qtd, valorHora) VALUES
('Cadeira 02 posições','50','2.00'),
('Cadeira 04 posições','100','3.50'),
('Guarda Sol P','40','2.00'),
('Guarda Sol G','60','3.00'),
('Mesinha','30','1.50');


INSERT INTO cliente
(nomeCliente, cpfCliente, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)
VALUES
('Fulano Teste','11122233344','fulano@test.com','Santos','SP','11000000','Rua','Teste','10',NULL),
('Beltrano Exemplo','22233344455','beltrano@test.com','São Vicente','SP','11300000','Avenida','Exemplo','20','Casa');

INSERT INTO funcionario (nomeFuncionario, cpfFuncionario, celularFuncionario)
VALUES
('Funcionário Teste','99988877766','99999999'),
('Atendente Extra','88877766655','88888888');

INSERT INTO equipamento (nomeequipamento, qtd, valorHora)
VALUES
('Prancha de Surf','15', 5.00),
('Caiaque','8', 12.00);


-- aluguel pago em DEZ/24
INSERT INTO aluguel (idFuncionario,idCliente,dataHoraRetirada,dataHoraDevolucao,
valorPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES
(1, 1, '2024-12-05 09:00','2024-12-05 15:00', 20.00, 20.00, 1, 'Crédito', 1);

INSERT INTO aluguelequipamento (idequipamento, idaluguel, valorItem, valorUnitario, qtd)
VALUES
(1, LAST_INSERT_ID(), 10.00, 2.00, 1);

-- aluguel não pago em DEZ/24
INSERT INTO aluguel (idFuncionario,idCliente,dataHoraRetirada,dataHoraDevolucao,
valorPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES
(2, 2, '2024-12-18 10:30','2024-12-18 14:00', 45.00, NULL, 0, NULL, NULL);

INSERT INTO aluguelequipamento (idequipamento, idaluguel, valorItem, valorUnitario, qtd)
VALUES
(3, LAST_INSERT_ID(), 15.00, 3.00, 1);

-- aluguel no período Natal-Ano Novo (para consulta 5)
INSERT INTO aluguel (idFuncionario,idCliente,dataHoraRetirada,dataHoraDevolucao,
valorPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES
(3, 3, '2024-12-27 11:00','2024-12-27 16:00', 60.00, 60.00, 1, 'Pix', 1);

INSERT INTO aluguelequipamento (idequipamento, idaluguel, valorItem, valorUnitario, qtd)
VALUES
(4, LAST_INSERT_ID(), 30.00, 3.00, 1);

-- aluguel em NOV/25 para vários funcionários (consulta 2)
INSERT INTO aluguel (idFuncionario,idCliente,dataHoraRetirada,dataHoraDevolucao,
valorPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES
(1, 4, '2025-11-10 09:00','2025-11-10 13:00', 30.00, 30.00, 1, 'Dinheiro', 1);

INSERT INTO aluguelequipamento (idequipamento, idaluguel, valorItem, valorUnitario, qtd)
VALUES
(2, LAST_INSERT_ID(), 7.00, 3.50, 2);


-- aluguel pago em DEZ/24
INSERT INTO aluguel (idFuncionario,idCliente,dataHoraRetirada,dataHoraDevolucao,
valorPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES
(1, 1, '2024-12-05 09:00','2024-12-05 15:00', 20.00, 20.00, 1, 'Crédito', 1);

INSERT INTO aluguelequipamento (idequipamento, idaluguel, valorItem, valorUnitario, qtd)
VALUES
(1, LAST_INSERT_ID(), 10.00, 2.00, 1);

-- aluguel não pago em DEZ/24
INSERT INTO aluguel (idFuncionario,idCliente,dataHoraRetirada,dataHoraDevolucao,
valorPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES
(2, 2, '2024-12-18 10:30','2024-12-18 14:00', 45.00, NULL, 0, NULL, NULL);

INSERT INTO aluguelequipamento (idequipamento, idaluguel, valorItem, valorUnitario, qtd)
VALUES
(3, LAST_INSERT_ID(), 15.00, 3.00, 1);

-- aluguel no período Natal-Ano Novo (para consulta 5)
INSERT INTO aluguel (idFuncionario,idCliente,dataHoraRetirada,dataHoraDevolucao,
valorPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES
(3, 3, '2024-12-27 11:00','2024-12-27 16:00', 60.00, 60.00, 1, 'Pix', 1);

INSERT INTO aluguelequipamento (idequipamento, idaluguel, valorItem, valorUnitario, qtd)
VALUES
(4, LAST_INSERT_ID(), 30.00, 3.00, 1);

-- aluguel em NOV/25 para vários funcionários (consulta 2)
INSERT INTO aluguel (idFuncionario,idCliente,dataHoraRetirada,dataHoraDevolucao,
valorPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES
(1, 4, '2025-11-10 09:00','2025-11-10 13:00', 30.00, 30.00, 1, 'Dinheiro', 1);

INSERT INTO aluguelequipamento (idequipamento, idaluguel, valorItem, valorUnitario, qtd)
VALUES
(2, LAST_INSERT_ID(), 7.00, 3.50, 2);



INSERT INTO aluguel (idFuncionario,idCliente,dataHoraRetirada,dataHoraDevolucao,
valorPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES
(2, 5, '2024-12-12 08:00','2024-12-12 16:00', 50.00, 50.00, 1, 'Débito', 1),
(3, 6, '2024-12-14 09:30','2024-12-14 18:00', 80.00, 80.00, 1, 'Crédito', 2),
(1, 7, '2024-12-20 10:00','2024-12-20 15:00', 40.00, NULL, 0, NULL, NULL);


-- Equipamento raramente alugado
INSERT INTO aluguelequipamento (idequipamento, idaluguel, valorItem, valorUnitario, qtd)
VALUES
(5, 1, 1.50, 1.50, 1); -- Mesinha (um único aluguel)












-- 1.Criar um aluguel de equipamento para o mês de novembro (qualquer data e hora), qualquer equipamento, 
-- qualquer funcionário e qualquer cliente, mas cujo pagamento não tenha sido feito (ficou em aberto).
INSERT INTO aluguel(idFuncionario,idCliente,dataHoraRetirada,dataHoraDevolucao,valorPagar,valorPago,pago,formaPagamento,qtVezes) 
VALUES (1,1,'2025-11,15 10:00',' 2025-11,15 16:00',36.00,NULL,0,NULL,NULL);

INSERT INTO aluguelequipamento(idEquipamento,idaluguel,valorItem,valorUnitario,qtd)
VALUES (1,LAST_INSERT_ID(),12.00,2.00,2),(3,LAST_INSERT_ID(),24.00,2.00,1);

-- 2.Listar nome de todos os funcionários, cpf e os aluguéis feitos por ele (apenas a data e que equipamento alugou). 
SELECT nomeFuncionario,cpfFuncionario,dataHoraRetirada,nomeequipamento 
FROM funcionario f LEFT JOIN aluguel a 
ON f.idFuncionario = a.idFuncionario
LEFT JOIN aluguelequipamento ae 
ON a.idaluguel = ae.idaluguel
LEFT JOIN equipamento e 
ON ae.idequipamento = e.idequipamento
ORDER BY nomeFuncionario,dataHoraRetirada;


-- 3.Listar nome do cliente, cpf, datas que ele esteve na praia, quem atendeu este cliente, tudo isto, 
-- ordenado por data, da mais nova para a mais antiga, apenas no mês de DEZ24.  
SELECT nomeCliente,cpfCliente,dataHoraRetirada,nomeFuncionario 
FROM cliente c JOIN aluguel a
ON c.idCliente = a.idCliente
JOIN funcionario f 
ON a.idFuncionario = f.idFuncionario
WHERE YEAR(a.dataHoraRetirada) = 2024 AND MONTH (a.dataHoraRetirada) = 12
ORDER BY dataHoraRetirada DESC; 

-- 4.Lista do nome dos equipamentos que foram mais alugados em ordem decrescente, do equipamento mais alugado para o menos alugado. 
-- Equipamentos não alugados devem sair no relatório. 
SELECT nomeequipamento, COALESCE(SUM(ae.qtd),0)total_alugado
FROM equipamento e JOIN aluguelequipamento ae 
ON e.idequipamento = ae.idequipamento
GROUP BY e.idequipamento,e.nomeequipamento
ORDER BY total_alugado DESC;

-- 5. Listar a arrecadação bruta da barraca de praia entre Natal e Ano Novo.

SELECT COALESCE(SUM(a.valorPago), 0) as arrecadacao_bruta
FROM aluguel a
WHERE a.dataHoraRetirada BETWEEN '2024-12-24' AND '2024-12-31 23:59:59'
AND a.pago = 1;



-- 6. Reajustar preço por hora de todos os equipamentos em 10%.



UPDATE equipamento
SET valorHora = valorHora * 1.10;

SELECT * FROM equipamento



-- 7. Listar a quantidade de clientes que pagaram utilizando determinada forma de pagamento,
-- em ordem crescente, do método mais usado para o menos usado.
-- Também é necessário que pagamentos não realizados sejam apontados.



SELECT COALESCE(formaPagamento, 'Não realizado') as forma_pagamento, COUNT(*) as quantidade FROM aluguel
GROUP BY formaPagamento
ORDER BY quantidade DESC;



-- 8. Listar quanto a barraca faturou por dia, em cada um dos dias do mês de dezembro apenas.

SELECT DATE(dataHoraRetirada) as dia,
COALESCE(SUM(valorPago), 0) as faturamento_dia
FROM aluguel
WHERE YEAR(dataHoraRetirada) = 2024 AND MONTH(dataHoraRetirada) = 12
AND pago = 1
GROUP BY DATE(dataHoraRetirada)
ORDER BY dia;
-- Primeiro excluir da tabela aluguelEquipamento (tabela filha)
DELETE FROM aluguelEquipamento
WHERE idaluguel = (SELECT idaluguel FROM aluguel WHERE idFuncionario = 1 AND idCliente = 1 AND dataHoraRetirada = '2024-11-15 10:00:00');
 
-- Depois excluir da tabela aluguel (tabela pai)
DELETE FROM aluguel
WHERE idFuncionario = 1 AND idCliente = 1 AND dataHoraRetirada = '2024-11-15 10:00:00';
 
/*
RESPOSTA: Se tentar excluir direto da tabela aluguel teremos um erro de violação de chave estrangeira.
Isto ocorre porque existem registros na tabela aluguelEquipamento que referenciam o registro na tabela aluguel.
Para resolver, devemos primeiro excluir os registros filhos (aluguelEquipamento) e depois os registros pais (aluguel).
*/
 
-- 10. Listar todos os equipamentos que tiveram a quantidade de aluguéis inferiores a 5 unidades, durante o mês de DEZ24.
 
SELECT e.nomeequipamento, COALESCE(SUM(ae.qtd), 0) as total_alugado
FROM equipamento e
LEFT JOIN aluguelEquipamento ae ON e.idequipamento = ae.idequipamento
LEFT JOIN aluguel a ON ae.idaluguel = a.idaluguel
WHERE (YEAR(a.dataHoraRetirada) = 2024 AND MONTH(a.dataHoraRetirada) = 12) OR a.idaluguel IS NULL
GROUP BY e.idequipamento, e.nomeequipamento
HAVING COALESCE(SUM(ae.qtd), 0) < 5;