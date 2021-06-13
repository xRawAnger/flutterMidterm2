import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:midterm2/data/models/items_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection('notes');

class Database {
  static String? userID;

  //save data to database
  static Future<void> addItem(MyItems myItems) async {
    DocumentReference documentReference =
        _collectionReference.doc(userID).collection('items').doc();

    var data = <String, dynamic>{
      'title': myItems.title,
      'expenseAmount': myItems.expenseAmount,
      'description': myItems.description,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("item has been added to database"))
        .catchError((e) => print(e));
  }

  //read data
  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesReference =
        _collectionReference.doc(userID).collection('items');
    return notesReference.snapshots();
  }

  //update data

  static Future<void> updateItems(MyItems myItems, docID) async {
    DocumentReference documentReference =
        _collectionReference.doc(userID).collection('items').doc(docID);

    var data = <String, dynamic>{
      'title': myItems.title,
      'expenseAmount': myItems.expenseAmount,
      'description': myItems.description,
    };

    await documentReference
        .update(data)
        .whenComplete(() => print("updated sucessfuly"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItems({required String docID}) async {
    DocumentReference documentReference =
        _collectionReference.doc(userID).collection('items').doc(docID);
    await documentReference
        .delete()
        .whenComplete(() => print("delete Sucessful"))
        .catchError((e) => print(e));
  }
}
