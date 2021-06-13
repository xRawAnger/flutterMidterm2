import 'package:flutter/material.dart';
import 'package:midterm2/data/dataBaseHelper.dart';
import 'package:midterm2/data/models/items_model.dart';

import 'home_screen.dart';

final _form1Key = GlobalKey<FormState>();

class UpdateScreen extends StatefulWidget {
  UpdateScreen({Key? key,
    required this.title,
    required this.expenseAmount,
    required this.description,
    required this.docID})
      : super(key: key);

  final String title;
  final int expenseAmount;
  final String description;
  final String docID;

  static const routeName = "/add-new-item-screen";

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _expenseAmountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _expenseAmountController =
        TextEditingController(text: widget.expenseAmount.toString());
    _descriptionController = TextEditingController(text: widget.description);
  }

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
                      Database.updateItems(
                          MyItems(title: _titleController.text,
                              expenseAmount: int.parse(_expenseAmountController.text),
                              description: _descriptionController.text),
                        widget.docID,
                      );
                      Navigator.pushNamed(context, HomeScreen.routeName);
                      setState(() {});
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
