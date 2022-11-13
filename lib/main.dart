import 'package:flutter/material.dart';
import 'package:real_app/resources/color_manager.dart';
import 'package:real_app/resources/strings_manager.dart';
import 'package:real_app/resources/values_manager.dart';
import 'package:real_app/models/transaction.dart';
import 'package:real_app/widgets/newTransaction.dart';
import 'package:real_app/widgets/transaction_list.dart';
import 'package:real_app/widgets/userTransactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter App',theme: ThemeData(
      primarySwatch: Colors.purple,
      accentColor: Colors.amber,
    ), home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void addNewTransaction(String txTitle, double txAmount) {
    final newTX = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTX);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_)
    {
      return GestureDetector(
        onTap: (){},
        child: NewTransaction(addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.Flutter_App),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: ()=>_startAddNewTransaction(context),
      child: Icon(Icons.add)),
    );
  }


}
