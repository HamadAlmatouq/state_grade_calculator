import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();
  //to store result and then print it
  String result = "";

  //A funcation that uses if to convert entered double to string letters ex A,B,C,D
  String calculateGrade(double score) {
    if (score >= 90) {
      return "A";
    } else if (score >= 80) {
      return "B";
    } else if (score >= 70) {
      return "C";
    } else if (score >= 60) {
      return "D";
    } else {
      return "F";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Grade Calculator",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink.shade200,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                //Text field with hint text to type score
                padding: EdgeInsets.all(60),
                child: TextField(
                  controller: textController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Type your score",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                //elevated button when pressed displays grade with a letter
                padding: EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade200,
                  ),
                  onPressed: () {
                    setState(() {
                      double score = double.parse(textController.text);

                      result = calculateGrade(score);
                    });
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              // Displays grade
              Text(
                result,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
