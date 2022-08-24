import 'dart:ffi';

class Venda{
  final dynamic id;
  final String nomeProduto;
  final String valorProduto;
  final String formaPagamento;

  Venda({this.id, required this.nomeProduto, required this.valorProduto, required this.formaPagamento});
}