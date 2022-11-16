import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_app/models/transaction.dart';
import 'package:real_app/resources/assets_manager.dart';
import 'package:real_app/resources/color_manager.dart';
import 'package:real_app/resources/values_manager.dart';

class TransactionList   extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:  MediaQuery.of(context).size.height - 345,
      child: transactions.isNotEmpty ? ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('\$${transactions[index].amount}'),
                  ),
                ),
              ),
              title: Text(
                transactions[index].title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transactions[index].id),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ) : Column(
        children: [
          Text('No transactions added yet!',
            style: Theme.of(context).textTheme.titleMedium,),

          SizedBox(
            height: AppSize.s20,
          ),
          Container(
              height: AppSize.s200,
              child: Image.asset(
                ImageAssets.waiting,
                fit: BoxFit.cover,
              )),
        ],
      )
    ) ;
  }
}
