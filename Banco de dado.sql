aula 30/10

criar um usuario no postgree - por padrao liberado para tudo
create user fernando with password 'segredo123'


dar permissao somente leitura em uma tabela
grant select on agencia to fernando;


dar permissao total a uma tabela
grant all privileges on agencia to public;


***ferramenta sql power architect

1-Mostre as idades e os salários de todos os vendedores.
select 
select idade, salario from vendedor;


2- Mostre os nomes de todos os vendedores com menos de 30 anos.
select nome_vendedor from vendedor where idade<30;


3- Mostre os nomes de todos os vendedores que têm um pedido com o cliente Leonardo Costa.
"
select
case matricula_vendedor
when '1' then 'paulo'
when '2' then 'ana'
when '3' then 'pedro'
when '4' then 'felipe'
when '5' then 'jose'
when '6' then 'rodrigo'
else 'desconhecido' end 
from pedido where codigo cliente='1'
"

select v.nome_vendedor 
from vendedor v
inner join pedido p on p.matricula_vendedor=v.matricula_vendedor
inner join clientes c on c.codigo_cliente=p.codigo_cliente
where c.nome_cliente ilike 'Leonardo Costa';


4- Mostre os   nomes e salários de todos os vendedores que não têm um pedido com a Leonardo Costa, em ordem ascendente de salário.

select v.nome_vendedor, v.salario 
from pedido p
inner join vendedor v on v.matricula_vendedor=p.matricula_vendedor
where (p.codigo_cliente<>1)
group by v.matricula_vendedor
having count (p.matricula_vendedor)>1;


5- Calcule o número de pedidos.
select count(*) as numero_pedido from pedido;

6- Calcule o número de clientes diferentes que têm um pedido.
select count (distinct codigo_cliente) from pedido;

7- Calcule a idade média dos vendedores.
select avg(idade) from vendedor;


8- Mostre o nome do vendedor mais velho.
select nome_vendedor, max(idade) as maximo_idade from vendedor
group by nome_vendedor order by maximo_idade desc;


9- Calcule o número de pedidos para cada vendedor.
select v.nome_vendedor, count(*) as qtd_vendas 
from pedido p
inner join vendedor v on v.matricula_vendedor=p.matricula_vendedor
group by v.nome_vendedor;

10-Calcule o número de pedidos para cada vendedor, considerando somente pedidos com valor superior a 500.
select v.nome_vendedor, count(*) as qtd_pedidos
from pedido p
inner join vendedor v on v.matricula_vendedor=p.matricula_vendedor
where valor_total>500
group by v.nome_vendedor;


11-Mostre as idades dos vendedores que têm um pedido com Leonardo Costa, em ordem decrescente de idade

select v.nome_vendedor, max(idade) as maximo_idade 
from vendedor v
inner join pedido p on p.matricula_vendedor=v.matricula_vendedor
inner join clientes c on c.codigo_cliente=p.codigo_cliente
where c.nome_cliente ilike 'Leonardo Costa' 
group by nome_vendedor order by maximo_idade desc;


12- Mostre as idades dos vendedores que têm um pedido com um cliente em Goiânia