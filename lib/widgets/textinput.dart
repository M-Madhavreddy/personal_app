import 'package:flutter/material.dart';
import './Transactions.dart';

class textinput extends StatefulWidget {
  @override
  final Function tx;
  textinput(@required this.tx);
  @override
  State<textinput> createState() => _textinputState();
}

class _textinputState extends State<textinput> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.tx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

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
              onPressed: /*(() {
                // print(titleinput);
                // print(amountinput);
                /*return widget.tx(
                  titleController.text,
                  double.parse(amountController.text),
                );*/
              }),*/
                  submitData,
              child: Text(
                "ADD TRANSACTION",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
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
