import 'package:aol_progress_timeline/data.dart';
import 'package:aol_progress_timeline/parts/cardsection.dart';
import 'package:aol_progress_timeline/parts/header.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProgressPage(),
    debugShowCheckedModeBanner: false,

  ));
}

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 120,
            child: Header(),
          ),
          Expanded(
            flex: 2,
            child: CardSection(),
          ),
        ],
      ),
    );
  }
}
