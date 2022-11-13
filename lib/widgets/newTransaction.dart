import 'package:flutter/material.dart';
import 'package:real_app/resources/color_manager.dart';
import 'package:real_app/resources/values_manager.dart';


class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();


  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle,enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s5,
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
              onFieldSubmitted: (_)=>submitData(),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              onFieldSubmitted: (_)=>submitData(),
            ),
            TextButton(
              onPressed:submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(color: ColorManager.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
