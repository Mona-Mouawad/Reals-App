import 'package:flutter/material.dart';
import 'package:real_app/resources/color_manager.dart';
import 'package:real_app/resources/values_manager.dart';

class NewTransaction extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

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
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextButton(
              onPressed: () {
                addTx(
                    titleController.text, double.parse(amountController.text));
              },
              child: Text('Add Transaction',style: TextStyle(color: ColorManager.purple),),

            )
          ],
        ),
      ),
    );
  }
}
