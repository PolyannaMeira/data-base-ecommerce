# Projeto de Banco de Dados - E-commerce

Este projeto consiste em um modelo de banco de dados relacional para um sistema de e-commerce, contemplando clientes, pedidos, formas de pagamento, produtos, fornecedores, estoques, entregas e vendedores terceirizados.

## Estrutura do Banco de Dados

### Entidades Principais

- **Cliente**: Armazena informações de clientes, como nome, identificação (CPF/CNPJ) e endereço.
- **FormasDePagamento**: Diversos métodos de pagamento utilizados pelos clientes.
- **Produto**: Detalhes dos produtos vendidos, como descrição, categoria e valor.
- **Fornecedor**: Fornecedores que disponibilizam os produtos.
- **TerceiroVendedor**: Vendedores terceirizados que comercializam os produtos.
- **Estoque**: Localização e gerenciamento do estoque dos produtos.
- **Pedido**: Informações dos pedidos realizados pelos clientes.
- **Entrega**: Rastreio e status das entregas dos pedidos.

### Relacionamentos

- **ProdutoPorVendedor**: Relaciona quais produtos são vendidos por quais terceiros.
- **ProdutoFornecedor**: Relaciona produtos aos fornecedores.
- **ProdutoEstoque**: Relaciona produtos aos estoques, com quantidade.
- **ProdutoPedido**: Relaciona produtos incluídos nos pedidos e suas quantidades.
- **Entrega**: Uma entrega pode ser associada a um pedido.

## Exemplo de Dados

O script SQL contém dados de exemplo como:

- Clientes.
- Vendedores e fornecedores simulados.
- Produtos de diferentes categorias.
- Pedidos contendo múltiplos produtos.
- Entregas rastreáveis associadas aos pedidos.

## Como Executar

1. Importe os arquivo `Create Table.sql`, `Save data.sql`,`Queries.sql` em um banco de dados MySQL.
2. Ele criará todas as tabelas necessárias e populá-las com dados de exemplo.

## Diagrama Conceitual

O modelo foi baseado em um diagrama E-R que mostra claramente os relacionamentos entre as tabelas e suas cardinalidades.

---

Desenvolvido para fins acadêmicos e de demonstração de modelagem relacional de sistemas de e-commerce.
