-- Selecionar nome de todos os clientes, associados com seu pedido
-- nome das pizzas e clientes que não pediram nenhuma pizza
select tb_cliente.nome, tb_pedido_pizza.id_pedido, tb_pizza.nome 
from tb_cliente
left join tb_pedido on tb_pedido.id_cliente = tb_cliente.id_cliente
left join tb_pedido_pizza on tb_pedido_pizza.id_pedido = tb_pedido.id_pedido
left join tb_pizza on tb_pedido_pizza.id_pizza = tb_pizza.id_pizza
order by tb_pedido_pizza.id_pedido

-- Selecionar o nome de todos os clientes que dizeram pedidos
-- valor gasto por cada um até hoje na pizzaria
select tb_cliente.nome, sum(tb_pedido.preco) as valor_total_gasto
from tb_cliente
inner join tb_pedido on tb_pedido.id_cliente = tb_cliente.id_cliente
group by tb_cliente.nome
order by sum(tb_pedido.preco);

--Valor em vendas de todas as pizzas zero lactose
select tb_pizza.nome, sum(tb_pedido.preco) from tb_pizza
inner join tb_pedido_pizza on tb_pedido_pizza.id_pizza = tb_pizza.id_pizza
inner join tb_pedido on tb_pedido.id_pedido = tb_pedido_pizza.id_pedido
where lower (nome) like '%zero%'
group by tb_pizza.nome;

-- Valor e quantidade vendas pizzas zero
select tb_pizza.nome, sum(tb_pedido.preco), count(tb_pizza.nome) from tb_pizza
inner join tb_pedido_pizza on tb_pedido_pizza.id_pizza = tb_pizza.id_pizza
inner join tb_pedido on tb_pedido.id_pedido = tb_pedido_pizza.id_pedido
where lower (nome) like '%zero%'
group by tb_pizza.nome;


-- Selecionar nome de todas as pizzas, associar com os pedidos, os nomes dos clientes que escolheram
-- e verificar quais pizzas nunca foram pedidas
select tb_cliente.nome, tb_pedido_pizza.id_pedido, tb_pizza.nome 
from tb_cliente
inner join tb_pedido on tb_pedido.id_cliente = tb_cliente.id_cliente
left join tb_pedido_pizza on tb_pedido_pizza.id_pedido = tb_pedido.id_pedido
right join tb_pizza on tb_pedido_pizza.id_pizza = tb_pizza.id_pizza
order by tb_pedido_pizza.id_pedido desc;

