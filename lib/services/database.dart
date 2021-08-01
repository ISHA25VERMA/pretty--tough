import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class DatabaseService{

  final String uid ;
  DatabaseService({required this.uid});
  //
  final CollectionReference opportunitis = Firestore.instance.collection('opportunities');

  Future updateUser(String contact, String description, String age) async{
    return await opportunitis.document(uid).setData({
      'contact' : contact,
      'description' : description,
      'age': age
    });
  }
}