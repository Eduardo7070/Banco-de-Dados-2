USE bdEstoque

--a) Criar uma consulta que retorne o código do produto, o nome do produto e o nome do fabricante somente daqueles produtos que custam igual ao valor mais alto

SELECT idProduto, descricaoProduto,  nomeFabricante FROM tbProduto
INNER JOIN tbFabricante ON tbFabricante.idFabricante = tbProduto.idFabricante
WHERE valorProduto = (SELECT max(valorProduto) FROM tbProduto)

--b) Criar uma consulta que retorne o nome do produto e o nome do fabricante e o valor somente dos produtos que custem acima do valor médio dos produtos em estoque
SELECT descricaoProduto, nomeFabricante FROM tbProduto
INNER JOIN tbFabricante ON tbFabricante.idFabricante = tbProduto.idFabricante
WHERE valorProduto > (SELECT avg(valorProduto) FROM tbProduto)

--c) Criar uma consulta que retorne o nome dos clientes que tiveram vendas com valor acima do valor médio das vendas
SELECT nomeCliente FROM tbCliente
INNER JOIN  tbVendas ON tbCliente.idCliente = tbVendas.idCliente
WHERE valorTotalVenda > (SELECT avg(valorTotalVenda) FROM tbVendas)

--d)  Criar uma consulta que retorno o nome e o preço dos produtos mais carosSELECT descricaoProduto, valorProduto FROM tbProdutoWHERE valorProduto = (SELECT max(valorProduto) FROM tbProduto)--e) Criar uma consulta que retorne o nome e o preço do produto mais baratoSELECT descricaoProduto, valorProduto FROM tbProdutoWHERE valorProduto = (SELECT min(valorProduto) FROM tbProduto)
