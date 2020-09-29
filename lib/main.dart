import 'models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final _transactions = [
    //Lista com modelo de Transações
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        // Column recebe um conjunto de elementos
        mainAxisAlignment:
            MainAxisAlignment.spaceAround, // Eixo de cima para baixo
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Eixo de baixo para o lado
        children: <Widget>[
          // Lista
          Container(
            //Container que envolve toda a parte superior
            child: Card(
              color: Colors.blue,
              child: Text('Gráfico'),
              elevation: 5, //Ideia de elemento 3D
            ),
          ),
          Column(
            //Mostrar transações criadas em lista
            children: _transactions.map((tr) {
              //Converter objeto do tipo Transaction em um componente visual
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,

                        )
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',//Interpolação com String
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,

                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                                                    
                          tr.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        Text(
                          
                          DateFormat('d MMM y').format(tr.date), // Data formatada
                          style: TextStyle(
                            color: Colors.grey,
                          ))
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
