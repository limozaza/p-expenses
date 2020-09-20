import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> tranasctions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Shoes bis', amount: 19.45, date: DateTime.now()),
  ];
  //String titleInput;
  //String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                        controller: titleController,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Amount',
                        ),
                        controller: amountController,
                      ),
                      FlatButton(
                        child: Text(
                          'Add Transaction',
                        ),
                        textColor: Colors.purple,
                        onPressed: () {
                          print(titleController.text);
                          // print(titleInput);
                          // print(amountInput);
                        },
                      )
                    ],
                  ),
                )),
            Column(
              children: tranasctions
                  .map((tx) => Card(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.purple,
                                  width: 2,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '\$${tx.amount} ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tx.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DateFormat('dd-MM-yyyy').format(tx.date),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ));
  }
}
