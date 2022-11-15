import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_app/models/transaction.dart';
import 'package:real_app/resources/color_manager.dart';
import 'package:real_app/resources/values_manager.dart';

class TransactionList   extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:  MediaQuery.of(context).size.height - 345,
      child: ListView.builder(
        itemCount:transactions.length ,
        itemBuilder:(context, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: AppMargin.m10, horizontal: AppMargin.m15),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorManager.purple, width: AppSize.s2),
                  ),
                  padding: EdgeInsets.all(AppPadding.p10),
                  child: Text(
                    '\$${transactions[index].amount}',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: AppSize.s20,
                        color: ColorManager.purple),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
    ) ;
  }
}
