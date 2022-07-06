//import 'dart:js';

import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/textinput.dart';
import './widgets/Transactions.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext Context) {
    return MaterialApp(
      title: "MY PERSONAL EXPENSES",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        //  accentColor: Colors.indigoAccent,
        fontFamily: 'Quicksand',
        textTheme: Theme.of(Context).textTheme.copyWith(
              titleMedium: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(Context).primaryColor,
              ),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
    // Transaction('t1', 'shoes', 499.00, DateTime.now()),
    // Transaction('t2', 'snacks', 200.00, DateTime.now()),
  ];

  void _addnewtransaction(String txtitle, double txamount) {
    final newtx = Transaction(
      txtitle,
      txamount,
      DateTime.now(),
    );
    setState(() {
      transactions.add(newtx);
    });
  }

  List<Transaction> get gettransactions {
    return transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
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
            chart(gettransactions),
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
