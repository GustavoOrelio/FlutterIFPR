final criandoBanco = [
  ''' 
    CREATE TABLE venda(
    id INTEGER NOT NULL PRIMARY KEY,
    nomeProduto TEXT NOT NULL,
    valorProduto TEXT NOT NULL,
    formaPagamento TEXT NOT NULL,
    vendedor_id INTEGER,
    FOREIGN KEY (vendedor_id) REFERENCES vendedor (id)
    )
  ''',
  ''' 
    CREATE TABLE vendedor(
    id INTEGER NOT NULL PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL
    )
  ''',
];