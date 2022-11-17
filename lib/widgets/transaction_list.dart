import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_app/models/transaction.dart';
import 'package:real_app/resources/assets_manager.dart';
import 'package:real_app/resources/color_manager.dart';
import 'package:real_app/resources/strings_manager.dart';
import 'package:real_app/resources/values_manager.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
        height: mediaQuery.size.height - 345,
        child: transactions.isNotEmpty
            ? ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: AppSize.s5,
                    margin: EdgeInsets.symmetric(
                      vertical: AppMargin.m8,
                      horizontal: AppMargin.m5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: AppSize.s30,
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
                      trailing: mediaQuery.size.width < 456
                          ? IconButton(
                              icon: Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                              onPressed: () => deleteTx(transactions[index].id),
                            )
                          : TextButton.icon(
                              onPressed: () => deleteTx(transactions[index].id),
                              icon: Icon(Icons.delete),
                              label: Text(AppStrings.Delete)),
                    ),
                  );
                },
                itemCount: transactions.length,
              )
            : LayoutBuilder(builder: (context, constraints) {
                return Column(children: [
                  Text(
                    AppStrings.No_transactions,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: AppSize.s20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      ImageAssets.waiting,
                      fit: BoxFit.cover,
                    ),
                  ),
                ]);
              }));
  }
}
