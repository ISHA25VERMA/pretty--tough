import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pretty_toughh/models/details.dart';
import 'package:pretty_toughh/models/details.dart';
import 'package:pretty_toughh/models/opportunities.dart';
import 'package:pretty_toughh/models/user.dart';


class DatabaseService {

  final String? uid;

  DatabaseService({this.uid});

  //
  final CollectionReference information = Firestore.instance.collection(
      'information');

  Future updateUser(String contact, String description, String age) async {
    return await information.document(uid).setData({
      'contact': contact,
      'description': description,
      'age': age
    });
  }

  //get info list

  List<details> _listOfInfoFromUser(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return details(
          contact: doc.data["name"],
          age: doc.data['age'],
          description: doc.data['description']
      );
    }).toList();
  }

  //get steams  //notifies whenever information is changed
  Stream<List<details>> get personalInfo {
    return information.snapshots()
        .map(_listOfInfoFromUser);
  }


  // sae for opportunities
  final CollectionReference opportunities = Firestore.instance.collection('blogs');

  List<Opportunities> _listOfOpportunities(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Opportunities(
          heading: doc.data["Heading"], description: doc.data["Description"]);
    }).toList();
  }

  Stream<List<Opportunities>> get allOpportunities {
    return opportunities.snapshots()
      .map(_listOfOpportunities);
  }
  //database return
  Stream<UserData> get userData{
    return information.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

  //user data from snapshot
  UserData _userDataFromSnapshot (DocumentSnapshot snapshot){
    return UserData(age: snapshot.data['age'], contact: snapshot.data['contact'], description: snapshot.data['description'], uid: uid) ;
  }
}
