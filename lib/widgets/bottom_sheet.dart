import 'package:flutter/material.dart';

class MyBottomSheet extends StatefulWidget {
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  String _selectedQuestion;
  String _selectedDifficulty;
  Color _normalColor = Colors.grey;
  Color _selectedColor = Colors.blue;


  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(false, '10'));
    sampleData.add(new RadioModel(false, '20'));
    sampleData.add(new RadioModel(false, '30'));
    sampleData.add(new RadioModel(false, '40'));
    sampleData.add(new RadioModel(false, '50'));
  }
  void _rebuildScreen() {
    setState(() {
      //do nothing but rebuildp
      sampleData.forEach((element) => element.isSelected = false);
      print(" ai am rebuilding");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20.0,left: 20.0),
        width: double.infinity,
        height: 300.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Category",textAlign: TextAlign.start,style: TextStyle(fontSize: 22.0,),),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom:10.0),
                  child: Text("Select number of questions"),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MyGestureDetector(0,sampleData[0].buttonText,sampleData,_rebuildScreen),
                      MyGestureDetector(1,sampleData[1].buttonText,sampleData,_rebuildScreen),
                      MyGestureDetector(2,sampleData[2].buttonText,sampleData,_rebuildScreen),
                      MyGestureDetector(3,sampleData[3].buttonText,sampleData,_rebuildScreen),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom:10.0),
                  child: Text("Select Difficulty"),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Any",style: TextStyle(color: Colors.white),),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color:  Colors.grey,
                          ),

                        ),
                        onTap: (){
                          print("clicked any");
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Easy",style: TextStyle(color: Colors.white),),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color:  Colors.grey,
                          ),

                        ),
                        onTap: (){
                          print("clicked Easy");
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Medium",style: TextStyle(color: Colors.white),),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color:  Colors.grey,
                          ),

                        ),
                        onTap: (){
                          print("clicked Medium");
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Hard",style: TextStyle(color: Colors.white),),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color:  Colors.grey,
                          ),

                        ),
                        onTap: (){
                          print("clicked Hard");
                        },
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
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 3.0),
                child: FlatButton(
                  child: Text("Start Quiz"),
                  onPressed: (){
                    print("starting quiz");
                  },
                ),
              ),
            ),

          ],
        )
//                FlatButton(
//                  child: Text('click me'),
//                  onPressed: (){
//                    Navigator.pop(context);
//                  },
//                ),
    );
  }
}

class MyGestureDetector extends StatefulWidget {
  @override
  _MyGestureDetectorState createState() => _MyGestureDetectorState();
  String buttonText;
  int index;
  List<RadioModel> sampleData;
  Function rebuildCallback;
  MyGestureDetector(this.index,this.buttonText,this.sampleData,this.rebuildCallback);
}

class _MyGestureDetectorState extends State<MyGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 35.0,
        padding: EdgeInsets.all(8.0),
        child: Text(widget.buttonText,style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: widget.sampleData[widget.index].isSelected ? Colors.blue:  Colors.grey,
        ),

      ),
      onTap: (){
        setState(() {
          widget.rebuildCallback();
          widget.sampleData.forEach((element) => element.isSelected = false);
          widget.sampleData[0].isSelected = false;
          widget.sampleData[1].isSelected = false;
          widget.sampleData[2].isSelected = false;
          widget.sampleData[3].isSelected = false;
          widget.sampleData[widget.index].isSelected = true;
        });
      },
    );
  }
}



class RadioModel{
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}


