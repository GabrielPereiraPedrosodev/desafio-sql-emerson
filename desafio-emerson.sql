CREATE DATABASE DB_ROBLOX;
USE DB_ROBLOX;


CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    nickname VARCHAR(100) NULL,
    jogoFavorito VARCHAR(100) NULL
);

INSERT INTO usuarios (id_usuario, nickname, jogoFavorito) VALUES
(1, 'ch_schuengue', 'BloxFruits'),
(2, 'joomr', 'Futbool Proibido'),
(3, 'estevin007', 'doors'),
(4, 'Pedro_S4t0s', 'roube um brainhot'),
(5, 'Xbrgames012', 'sccp123'),
(6, 'Gondo_leo', 'cars tycoon'),
(7, 'brsilva1213', 'grand piece'),
(8, 'bpsproen', 'Raze piece'),
(9, 'patomaloka4552', 'bedwars'),
(10, 'leleo12312', 'animefights simuleitor');


CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100) NULL,
    preco DECIMAL(10, 2) NULL
);

INSERT INTO produtos (id_produto, nome_produto, preco) VALUES
(101, 'Dragon perm', 179.90),
(102, 'Camiseta Supreme', 45.00),
(103, 'Skip Fase', 19.90),
(104, '2x speed', 129.90),
(105, 'Base save', 99.90),
(106, 'seepd cars combo', 980.90),
(107, 'Dark root', 95.00),
(108, '2x Experiencie', 89.90),
(109, 'Fusao suprema', 300.00),
(110, '2x Sorte', 119.90);

select * from usuarios;
select * from produtos;

CREATE TABLE pedidosreembolso (
    id_pedido INT PRIMARY KEY,
    id_usuario INT NULL,
    id_produto INT NULL,
    email VARCHAR(100) NULL,
    data_compra DATE NULL,

    FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario),

    FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto)
);

INSERT INTO pedidosreembolso
(id_pedido, id_usuario, id_produto, email, data_compra)
VALUES
(1001, 1, 101, '@shuengue12345.com.br', '2026-03-01'),
(1002, 2, 103, '@loudjoaozinho123.com.br', '2026-03-02'),
(1003, 3, 102, '@estevin007.com.br', '2026-03-02'),
(1004, 4, 104, '@pedrosantos04.com.br', '2026-03-03'),
(1005, 5, 105, '@brxgames2012com.br', '2026-03-04'),
(1006, 6, 106, '@leonardogondo21.com.br', '2026-03-05'),
(1007, 7, 107, '@brsilvaa1213.com.br', '2026-03-06'),
(1008, 8, 108, '@proenbps1.com.br', '2026-03-07'),
(1009, 9, 109, '@felipinho54321.com.br', '2026-03-08'),
(1010, 10, 110, '@leofeliz1212.com.br', '2026-03-09');

select * from pedidosreembolso;
--1 
select u.nickname, p.nome_produto
from usuarios u
inner join pedidosreembolso pr on u.id_usuario = pr.id_usuario
inner join produtos p on pr.id_produto = p.id_produto;

-- ex 2
select u.nickname, p.nome_produto, p.preco
from usuarios u
inner join pedidosreembolso pr on u.id_usuario = pr.id_usuario
inner join produtos p on pr.id_produto = p.id_produto;


-- ex 3
select u.nickname, p.nome_produto, 'Reembolso Solicitado' as status_relacionamento
from usuarios u
inner join pedidosreembolso pr on u.id_usuario = pr.id_usuario
inner join produtos p on pr.id_produto = p.id_produto;

-- ex 4
select u.nickname, pr.email, p.nome_produto
from usuarios u
inner join pedidosreembolso pr on u.id_usuario = pr.id_usuario
inner join produtos p on pr.id_produto = p.id_produto;
-- ex 5
select u.nickname, p.nome_produto, pr.data_compra
from usuarios u
inner join pedidosreembolso pr on u.id_usuario = pr.id_usuario
inner join produtos p on pr.id_produto = p.id_produto;
-- ex 6
select u.nickname, p.nome_produto
from usuarios u
inner join pedidosreembolso pr on u.id_usuario = pr.id_usuario
inner join produtos p on pr.id_produto = p.id_produto
where pr.data_compra = '2026-03-02';
-- ex 7
select u.nickname, p.nome_produto
from usuarios u
left join pedidosreembolso pr on u.id_usuario = pr.id_usuario
left join produtos p on pr.id_produto = p.id_produto;

-- ex 8
select u.nickname, pr.email, p.nome_produto
from usuarios u
left join pedidosreembolso pr on u.id_usuario = pr.id_usuario
left join produtos p on pr.id_produto = p.id_produto;

-- ex 9
select p.nome_produto, u.nickname
from produtos p
left join pedidosreembolso pr on p.id_produto = pr.id_produto
left join usuarios u on pr.id_usuario = u.id_usuario;
-- ex10
select u.nickname, p.nome_produto, 'Reembolso Solicitado' as status_relacionamento
from usuarios u
left join pedidosreembolso pr on u.id_usuario = pr.id_usuario
left join produtos p on pr.id_produto = p.id_produto;
-- ex 11
select u.nickname, u.jogoFavorito
from usuarios u
left join pedidosreembolso pr on u.id_usuario = pr.id_usuario
where pr.id_pedido is null;

-- ex 12
select p.nome_produto, p.preco, u.nickname, pr.data_compra
from produtos p
left join pedidosreembolso pr on p.id_produto = pr.id_produto
left join usuarios u on pr.id_usuario = u.id_usuario;
-- ex 13
select p.nome_produto, u.nickname
from pedidosreembolso pr
right join produtos p on pr.id_produto = p.id_produto
left join usuarios u on pr.id_usuario = u.id_usuario;
-- exercicio 14
select p.nome_produto, p.preco, pr.data_compra
from produtos p
left join pedidosreembolso pr on p.id_produto = pr.id_produto;
-- ex 15
select p.nome_produto,u.nickname
from usuarios u
inner join produtos p
right join pedidosreembolso pr on u.id_usuario = pr.id_usuario and p.id_produto = pr.id_produto;
-- ex 16
select p.id_produto, p.nome_produto, p.preco
from pedidosreembolso pr
right join produtos p on pr.id_produto = p.id_produto
where pr.id_pedido is null;
-- ex 17
select u.nickname, p.nome_produto, p.preco
from pedidosreembolso pr
inner join usuarios u on pr.id_usuario = u.id_usuario
inner join produtos p on pr.id_produto = p.id_produto
where p.preco > 100.00;
