final criandoBanco = [
  ''' 
    CREATE TABLE venda(
    id INTEGER NOT NULL PRIMARY KEY,
    nomeProduto TEXT NOT NULL,
    valorProduto TEXT NOT NULL,
    formaPagamento TEXT NOT NULL
    )
  ''',

  'INSERT INTO venda (nomeProduto, valorProduto, formaPagamento) VALUES ("Cal", "12.50", "Dinheiro")',
  'INSERT INTO venda (nomeProduto, valorProduto, formaPagamento) VALUES ("Cimento", "25.00", "Cartão de Credito")'
];