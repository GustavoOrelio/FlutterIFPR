class Juros{
  double calcular(double valorProduto, double  percentualJuros){

    var percentual = percentualJuros / 100;

    var resultado = valorProduto * percentual;

    var total = resultado + valorProduto;
    return total;
  }
}