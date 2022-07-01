import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/textinput.dart';
import './widgets/Transactions.dart';
import './models/transaction.dart';

void main() {
  runApp(Personal());
}

class Personal extends StatelessWidget {
  Widget build(BuildContext Context) {
    return MaterialApp(
      title: "MY PERSONAL EXPENSES",
      home: myhomepage(),
    );
  }
}

class myhomepage extends StatefulWidget {
  @override
  State<myhomepage> createState() => _myhomepageState();
}

class _myhomepageState extends State<myhomepage> {
  final List<Transaction> transactions = [
    Transaction('t1', 'shoes', 499.00, DateTime.now()),
    Transaction('t2', 'snacks', 200.00, DateTime.now()),
  ];

  void _addnewtransaction(String txtitle, double txamount) {
    final newtx = Transaction(
      'id',
      txtitle,
      txamount,
      DateTime.now(),
    );

    setState(() {
      transactions.add(newtx);
    });
  }

  void startAdding(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: textinput(_addnewtransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => startAdding(context), icon: Icon(Icons.add))
        ],
        centerTitle: true,
        title: Text(
          'Personal Expenses',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            chart(),
            // Usertransactions(),
            Transactions(transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAdding(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
