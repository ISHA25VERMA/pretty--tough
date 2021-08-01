import 'package:flutter/material.dart';

class Blogs extends StatefulWidget {
  const Blogs({Key? key}) : super(key: key);

  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Will be published soon !',
          style: TextStyle(
            fontSize: 20.0,
        ),
        ),
      ),
    );
  }
}
