final criandoBanco = [
  ''' 
    CREATE TABLE venda(
    id INTEGER NOT NULL PRIMARY KEY,
    nomeProduto TEXT NOT NULL,
    valorProduto TEXT NOT NULL,
    formaPagamento TEXT NOT NULL
    )
  ''',
];