import 'package:flutter/material.dart';

class MyBottomSheet extends StatefulWidget {
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  List<RadioModel> sampleQuestions = new List<RadioModel>();
  List<RadioModel> sampleDifficulty = new List<RadioModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //for the sample questions
    sampleQuestions.add(new RadioModel(false, '10'));
    sampleQuestions.add(new RadioModel(false, '20'));
    sampleQuestions.add(new RadioModel(false, '30'));
    sampleQuestions.add(new RadioModel(false, '40'));
    sampleQuestions.add(new RadioModel(false, '50'));

    //for the sample difficulty
    sampleDifficulty.add(new RadioModel(false, 'Any'));
    sampleDifficulty.add(new RadioModel(false, 'Easy'));
    sampleDifficulty.add(new RadioModel(false, 'Medium'));
    sampleDifficulty.add(new RadioModel(false, 'Hard'));
  }

  void _rebuildScreen() {
    setState(() {
      //do nothing but rebuildp
      sampleQuestions.forEach((element) => element.isSelected = false);
      print(" am questios rebuilding");
    });
  }
  void _rebuildDifficultyScreen() {
    setState(() {
      //do nothing but rebuildp
      sampleDifficulty.forEach((element) => element.isSelected = false);
      print("am dfiificult rebuilding");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 20.0),
      width: double.infinity,
      height: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Category",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text("Select number of questions"),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MyGestureDetector(
                      group: '0',
                      index: 0,
                      buttonText: sampleQuestions[0].buttonText,
                      sampleQuestions: sampleQuestions,
                      rebuildCallback: _rebuildScreen,),
                    MyGestureDetector(
                      group: '0',
                      index: 1,
                      buttonText: sampleQuestions[1].buttonText,
                      sampleQuestions: sampleQuestions,
                      rebuildCallback: _rebuildScreen,),
                    MyGestureDetector(
                      group: '0',
                      index: 2,
                      buttonText: sampleQuestions[2].buttonText,
                      sampleQuestions: sampleQuestions,
                      rebuildCallback: _rebuildScreen,),
                    MyGestureDetector(
                      group: '0',
                      index: 3,
                      buttonText: sampleQuestions[3].buttonText,
                      sampleQuestions: sampleQuestions,
                      rebuildCallback: _rebuildScreen,),
                    MyGestureDetector(
                      group: '0',
                      index: 4,
                      buttonText: sampleQuestions[4].buttonText,
                      sampleQuestions: sampleQuestions,
                      rebuildCallback: _rebuildScreen,),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text("Select Difficulty"),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MyGestureDetector(
                      group: '1',
                      index: 0,
                      buttonText: sampleDifficulty[0].buttonText,
                      sampleQuestions: sampleDifficulty,
                      rebuildCallback: _rebuildDifficultyScreen,
                    ),
                    MyGestureDetector(
                      group: '1',
                      index: 1,
                      buttonText: sampleDifficulty[1].buttonText,
                      sampleQuestions: sampleDifficulty,
                      rebuildCallback: _rebuildDifficultyScreen,
                    ),
                    MyGestureDetector(
                      group: '1',
                      index: 2,
                      buttonText: sampleDifficulty[2].buttonText,
                      sampleQuestions: sampleDifficulty,
                      rebuildCallback: _rebuildDifficultyScreen,
                    ),
                    MyGestureDetector(
                      group: '1',
                      index: 3,
                      buttonText: sampleDifficulty[3].buttonText,
                      sampleQuestions: sampleDifficulty,
                      rebuildCallback: _rebuildDifficultyScreen,
                    ),

                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.pinkAccent,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              child: FlatButton(
                child: Text("Start Quiz"),
                onPressed: () {
                  Navigator.of(context).pop();
                  //print("$selectedQuestions -> $selectedDifficulty quiz");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyGestureDetector extends StatefulWidget {
  @override
  _MyGestureDetectorState createState() => _MyGestureDetectorState();
  String buttonText;
  int index;
  List<RadioModel> sampleQuestions;
  Function rebuildCallback;
  Function rebuildDifficultyCallback;
  String _questions;
  String group;
  String selectedQuestions;
  String selectedDifficulty;

  MyGestureDetector(
      {this.group,
      this.index,
      this.buttonText,
      this.sampleQuestions,
      this.rebuildCallback});
}

class _MyGestureDetectorState extends State<MyGestureDetector> {
  String _selectedQuestions;
  String _selectedDifficulty;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(
          widget.buttonText,
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: widget.sampleQuestions[widget.index].isSelected
              ? Colors.blue
              : Colors.grey,
        ),
      ),
      onTap: () {
        setState(() {
          widget.rebuildCallback();
          widget.sampleQuestions[widget.index].isSelected = true;
          //widget.sampleDifficulty[widget.index].isSelected = true;
          widget._questions = widget.sampleQuestions[widget.index].buttonText;
          if(widget.group == '0'){
            //this is a number of questions answer
            _selectedQuestions = (widget._questions).toString();
          }else{
            //this is a difficulty answer
            _selectedDifficulty = (widget._questions).toString();
          }
          //print("selected ->" + (widget._questions).toString());
        });
      },
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}
