import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_app/resources/color_manager.dart';
import 'package:real_app/resources/strings_manager.dart';
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
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Card(
        elevation: AppSize.s5,
        child: Padding(
          padding: EdgeInsets.only(
              right: AppPadding.p10,
              left: AppPadding.p10,
              top: AppPadding.p10,
              bottom: mediaQuery.viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: titleController,
                decoration: InputDecoration(labelText: AppStrings.Title),
                onFieldSubmitted: (_) => submitData(),
              ),
              SizedBox(
                height: AppSize.s10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: amountController,
                decoration: InputDecoration(labelText: AppStrings.Amount),
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
                        ? AppStrings.No_Date_Chosen
                        : AppStrings.Picked_Date +
                            DateFormat.yMd().format(_selectedDate!)),
                    TextButton(
                      onPressed: _presentDatePicer,
                      child: Text(
                        AppStrings.Choose_Date,
                        style: TextStyle(color: ColorManager.primary),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: submitData,
                child: Text(
                  AppStrings.Add_Transaction,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
