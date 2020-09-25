import 'package:flutter/material.dart';

main() => runApp(DespesasPessoais());

//Classe principal
class DespesasPessoais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage()); // Instancia da página principal home
  }
}

//Classe criada para instanciar o texto central
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column( // Column recebe um conjunto de elementos
        children:<Widget> [ // Lista
          Container( //Container que envolve toda a parte superior
            width: double.infinity, //Maximo possivel para expandir o card
            child: Card(
              color: Colors.blue,
              child: Text('Gráfico'),
              elevation: 5, //Ideia de elemento 3D 
            ),
          ),
          Card(
            child: Text('Lista de transações'),
          )
        ],
      ),
    );
  }
}
