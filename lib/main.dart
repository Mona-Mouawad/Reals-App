import 'package:flutter/material.dart';
import 'package:real_app/resources/color_manager.dart';
import 'package:real_app/resources/strings_manager.dart';
import 'package:real_app/resources/values_manager.dart';
import 'package:real_app/models/transaction.dart';
import 'package:real_app/widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter App', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.Flutter_App),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: ColorManager.blue,
              child: Text(AppStrings.CHART),
              elevation: AppSize.s5,
            ),
          ),
          TransactionList(transactions),
        ],
      ),
    );
  }
}
