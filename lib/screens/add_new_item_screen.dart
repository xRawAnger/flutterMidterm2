import 'package:flutter/material.dart';
import 'package:midterm2/data/dataBaseHelper.dart';
import 'package:midterm2/data/models/items_model.dart';
import 'package:midterm2/screens/home_screen.dart';

final _form1Key = GlobalKey<FormState>();
class AddNewItem extends StatefulWidget {
  AddNewItem({Key? key}) : super(key: key);

  static const routeName = "/add-new-item-screen";

  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _expenseAmountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new item"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Form(
            key: _form1Key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: "Title"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter title";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: TextFormField(
                    controller: _expenseAmountController,
                    decoration: InputDecoration(hintText: "expense"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter expense amount";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(hintText: "description"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter description";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: ElevatedButton(
                    child: Text("add Item"),
                    onPressed: () {
                      Database.addItem(MyItems(
                          title: _titleController.text,
                          expenseAmount: int.parse(_expenseAmountController.text),
                          description: _descriptionController.text));
                      Navigator.pushNamed(context, HomeScreen.routeName);
                      setState(() {
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
