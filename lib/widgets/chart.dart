import 'package:flutter/material.dart';
import 'package:personall_app/models/transaction.dart';
import 'package:intl/intl.dart';

class chart extends StatelessWidget {
  final List<Transaction> gettransactions;

  chart(this.gettransactions);

  List<Map<String, Object>> get recenttransaction {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(Duration(days: index));
        double totalsum = 0.0;

        for (int i = 0; i < gettransactions.length; i++) {
          if (gettransactions[i].date.day == weekday.day &&
              gettransactions[i].date.month == weekday.month &&
              gettransactions[i].date.year == weekday.year) {
            totalsum += gettransactions[i].amount;
          }
        }
        return {"day": DateFormat.E().format(weekday), "amount": totalsum};
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(recenttransaction);
    return Container(
      width: double.infinity,
      height: 100,

      // color: Color.fromARGB(255, 122, 186, 238),
      child: Card(
        color: Color.fromARGB(255, 99, 179, 246),
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
