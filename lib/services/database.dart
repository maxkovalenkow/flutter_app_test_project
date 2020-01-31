import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_test_project/models/item.dart';
import 'package:flutter_app_test_project/models/user.dart';

class DatabaseService {

  final String uid;

  DatabaseService({this.uid});

  final CollectionReference itemsCollection = Firestore.instance.collection('items');

  final CollectionReference itemsBasketCollection = Firestore.instance.collection('itemsBasket');

  final CollectionReference itemsHistoryCollection = Firestore.instance.collection('itemsHistory');

  Future updateUserData(String sugars, String name, int strenght) async {
    itemsBasketCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strenght': strenght,
    });
    itemsHistoryCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strenght': strenght,
    });
    return await itemsCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strenght': strenght,
    });
  }

  List<Item> _itemListFromSnaphot(QuerySnapshot querySnapshot) {
    return querySnapshot.documents.map((doc) {
      return Item(
        name: doc.data['name'] ?? '',
        strenght: doc.data['strenght'] ?? 0,
        sugars: doc.data['sugars'] ?? '0',
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strenght: snapshot.data['strenght'],
    );
  }

  Stream<List<Item>> get items {
    return itemsCollection.snapshots().map(_itemListFromSnaphot);
  }

  Stream<List<Item>> get itemsBasket {
    return itemsBasketCollection.snapshots().map(_itemListFromSnaphot);
  }

  Stream<List<Item>> get itemsHistory {
    return itemsHistoryCollection.snapshots().map(_itemListFromSnaphot);
  }

  Stream<UserData> get userData {
    return itemsCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}