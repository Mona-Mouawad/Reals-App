import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_app/resources/color_manager.dart';
import 'package:real_app/resources/values_manager.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => NewTransactionState();
}

class NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime? _selectedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicer() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      setState(() {
        _selectedDate = value;
      });
    });
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
              onFieldSubmitted: (_) => submitData(),
            ),
            SizedBox(
              height: AppSize.s10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              onFieldSubmitted: (_) => submitData(),
            ),
            SizedBox(
              height: AppSize.s10,
            ),
            Container(
              height: AppSize.s60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_selectedDate == null
                      ? 'No Date Chosen!'
                      : 'Picked Date ${DateFormat.yMd().format(_selectedDate!)}'),
                  TextButton(
                    onPressed: _presentDatePicer,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(color: ColorManager.primary),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
              //  style: TextStyle(color: ColorManager.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
