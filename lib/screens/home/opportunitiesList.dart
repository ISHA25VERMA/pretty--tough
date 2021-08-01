import 'package:flutter/material.dart';
import 'package:pretty_toughh/models/opportunities.dart';
import 'package:pretty_toughh/screens/home/oppCard.dart';
import 'package:provider/provider.dart';

class OpportunitiesList extends StatefulWidget {
  const OpportunitiesList({Key? key}) : super(key: key);

  @override
  _OpportunitiesListState createState() => _OpportunitiesListState();
}

class _OpportunitiesListState extends State<OpportunitiesList> {
  @override
  Widget build(BuildContext context) {
    final opp = Provider.of<List<Opportunities>?>(context) ?? [];

    // if (opp!=null){
    //   print(opp[0].heading);
    //   print(opp[0].description);
    // }

    // return Container();

    return ListView.builder(itemBuilder: (context, index) {
      return OppCard(opportunity: opp[index]);
    },
      itemCount: opp.length,);
  }

}


