import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pretty_toughh/models/details.dart';
import 'package:pretty_toughh/models/details.dart';
import 'package:pretty_toughh/models/details.dart';


class DatabaseService{

  final String? uid ;
  DatabaseService({this.uid});
  //
  final CollectionReference information = Firestore.instance.collection('opportunities');

  Future updateUser(String contact, String description, String age) async{
    return await information.document(uid).setData({
      'contact' : contact,
      'description' : description,
      'age': age
    });
  }

  //get info list

  List<details> _listOfInfoFromUser(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return details(
          contact:doc.data["name"],
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
}