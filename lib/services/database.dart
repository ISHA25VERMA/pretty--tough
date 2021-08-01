import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


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

  //get steams  //notifies whenever information is changed
  Stream<QuerySnapshot> get personalInfo {
    return information.snapshots();
  }
}