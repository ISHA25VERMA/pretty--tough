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
        color: Colors.pink[100],
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(opportunity.heading,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(opportunity.description,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[800]
                ),
              ),
            ),
          ),
        )
      ),
    );

  }
}
