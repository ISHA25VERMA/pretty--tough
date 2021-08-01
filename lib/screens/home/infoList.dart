import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pretty_toughh/models/details.dart';
import 'package:provider/provider.dart';

class infoList extends StatefulWidget {
  const infoList({Key? key}) : super(key: key);

  @override
  _infoListState createState() => _infoListState();
}

class _infoListState extends State<infoList> {
  @override
  Widget build(BuildContext context) {

    final info = Provider.of<List<details>?>(context);

    if (info!= null){
      info.forEach((element) {
        print(element.description);
        print(element.contact);
        print(element.age);
      });
    }

    
    // if (info != null){
    //   for (var doc in info.documents){
    //     print(doc.data);
    //   }
    // }
    // for (var doc in info!.docs) {
    //   print(doc.data);
    // }

    return Container();
  }
}
