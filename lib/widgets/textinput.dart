import 'package:flutter/material.dart';
import './Transactions.dart';

class textinput extends StatelessWidget {
  @override
  final Function tx;

  textinput(@required this.tx);

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              /*onChanged: (val) {
                titleinput = val;
              },*/
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              // onChanged: (amt) => amountinput = amt,
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              onPressed: (() {
                // print(titleinput);
                // print(amountinput);
                return tx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              }),
              child: Text(
                "ADD TRANSACTION",
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
