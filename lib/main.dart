import 'package:flutter/material.dart';
import 'package:real_app/resources/color_manager.dart';
import 'package:real_app/resources/strings_manager.dart';
import 'package:real_app/resources/values_manager.dart';
import 'package:real_app/models/transaction.dart';
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
    return MaterialApp(title: 'Flutter App', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.Flutter_App),
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
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
