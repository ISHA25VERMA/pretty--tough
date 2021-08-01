import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_toughh/models/opportunities.dart';

class OppCard extends StatelessWidget {

  final Opportunities opportunity;
  OppCard({required this.opportunity});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(opportunity.heading),
          subtitle: Text(opportunity.description),
        )
      ),
    );

  }
}
