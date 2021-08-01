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

    final info = Provider.of<List<details>?>(context)??[];


    return Container();
  }
}
