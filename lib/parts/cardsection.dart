import 'package:aol_progress_timeline/data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CardSection extends StatefulWidget {

  @override
  _CardSectionState createState() => _CardSectionState();
}

class _CardSectionState extends State<CardSection> {
  int _counter = 0;

  String manager = "null";

  String pro_progress="null";

  String pro_start="null";

  String pro_end="null";

  String pro_name="null";

  String trial="40";
  double progress=0.0;

  void initState(){
    _databaseTest();
    _counter++;
    progress = double.parse(trial)/100;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      progress = double.parse(trial)/100;
    });
  }

  void _databaseTest() {
    FirebaseDatabase db = FirebaseDatabase.instance;
    DatabaseReference dbRef = db.reference().child("project");
    dbRef.once().then((DataSnapshot snapshot) {
      debugPrint(snapshot.value.toString());
      setState(() {
        manager = snapshot.value['projectManager'];
        pro_progress = snapshot.value['projectProgress'].toString();
        pro_start = snapshot.value['projectStartDate'];
        pro_end = snapshot.value['projectEndDate'];
        pro_name = snapshot.value['projectName'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.topLeft,
          child: Text('Project Section',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
          ),
        ),
        Expanded(
          flex: 2,
          child:
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: customShadow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 150,
                      bottom: -100,
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: customShadow,
                            shape:BoxShape.circle,
                            color:Colors.white38
                        ),
                      ),
                    ),
                    Positioned.fill(
                      left: -300,
                      top: -100,
                      bottom: -100,
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: customShadow,
                            shape:BoxShape.circle,
                            color:Colors.white38
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircularPercentIndicator(
                                        radius: 120.0,
                                        lineWidth: 13.0,
                                        animation: true,
                                        percent: progress,
                                        center: new Text(
                                            '$pro_progress',
                                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                        ),
                                        circularStrokeCap: CircularStrokeCap.round,
                                        progressColor: Colors.deepPurple,
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                          height: 50,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              boxShadow: customShadow,
                                              borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: IconButton(
                                              color: Colors.deepPurple,
                                              icon: Icon(Icons.navigate_next),
                                              onPressed: () {
                                                _databaseTest();
                                                _incrementCounter();
                                              },
                                          ),
                                        ),
                                    ),
                                ],
                            ),
                          ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 120,left: 10),
                        child: Container(
                          width: 300,
                          child: Text(
                            'Project Name: $pro_name',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30,left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Project Manager: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  '$manager',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Date: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  '$pro_start to $pro_end',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              )
                ],
                ),
              )
        ),
        Expanded(
          flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,i){
                return Container(
                  width: 250,
                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    boxShadow: customShadow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Align(),
                    ],
                  ),
                );
              },
          ),
        ),
      ],
    );
  }
}





