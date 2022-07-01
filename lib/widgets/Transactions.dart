import 'package:flutter/material.dart';
import 'package:intl/intl.dart ';
import '../models/transaction.dart';

class Transactions extends StatelessWidget {
  @override
  List<Transaction> _usertransactions;
  Transactions(@required this._usertransactions);

  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: _usertransactions.map(
          (tx) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy').format(tx.date),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 131, 131, 135),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    //width: double.infinity, this will create an error message
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        width: 2,
                        color: Colors.indigo,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Text(
                      tx.amount.toStringAsFixed(2),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
