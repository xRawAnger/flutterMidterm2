import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:midterm2/data/dataBaseHelper.dart';
import 'package:midterm2/screens/add_new_item_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home-screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Database.readItems(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("oops! something went wrong!");
            } else if (snapshot.hasError || snapshot.data != null) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    String title = snapshot.data!.docs[index].get('title');
                    String expenseAmount =
                        snapshot.data!.docs[index].get('expenseAmount');
                    String description =
                        snapshot.data!.docs[index].get('description');
                    return ListTile(
                      onLongPress: ()=> Database.deleteItems(docID: snapshot.data!.docs[index].id),
                      title: Text(title),
                      subtitle: Text(expenseAmount),
                      isThreeLine: true,
                      trailing: Text(description),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 15.0,
                      ),
                  itemCount: snapshot.data!.docs.length);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Navigator.pushNamed(context, AddNewItem.routeName).then((_) {
          setState(() {});
        }),
      ),
    );
  }
}
