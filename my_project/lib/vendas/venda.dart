import 'dart:ffi';

import 'package:my_project/vendas/vendedor.dart';

class Venda {
  final dynamic id;
  final String nomeProduto;
  final String valorProduto;
  final String formaPagamento;

  final Vendedor? vendedor;

  Venda(
      {this.id,
      required this.nomeProduto,
      required this.valorProduto,
      required this.formaPagamento,
        this.vendedor});
}
