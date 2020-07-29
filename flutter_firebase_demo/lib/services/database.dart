import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_demo/models/brew.dart';
import 'package:flutter_firebase_demo/models/user.dart';


class DBService {

  final CollectionReference brewCollection = Firestore.instance.collection('Brew');
  final String uid;

  DBService({this.uid});

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name':name,
      'strength':strength
    });
  }

  // snapshot to brew List
  List<Brew> brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Brew(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  // get brew streams
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(
        brewListFromSnapshot
    );
  }

  // snapshot to UserData
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        sugars: snapshot.data['sugars'],
        strength: snapshot.data['strength']
    );
  }


  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(
        _userDataFromSnapshot
    );
  }

}