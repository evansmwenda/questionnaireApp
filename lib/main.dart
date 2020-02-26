import 'package:flutter/material.dart';
import 'package:peponi_app/widgets/bottom_sheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Swalika'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              height: 150.0,
              child: ClipPath(
                clipper: ClippingClass(),
                child: MyContainer(),
              ),
            ),

          ],
        )// This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.symmetric(vertical:40.0,horizontal: 20.0),
      child: GestureDetector(
        child: Text(
          "Who among the following was the first president of Uganda?",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        onTap: (){
          showBottomSheet(
              context: context,
              builder: (context) => MyBottomSheet(),);
        },
      ),
    );
  }
}


class ClippingClass extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height-40);
//    path.quadraticBezierTo(x1, y1, x2, y2);
    path.quadraticBezierTo(size.width/4, size.height, size.width/2, size.height);
    path.quadraticBezierTo(size.width - (size.width/4), size.height, size.width, size.height-40);
    path.lineTo(size.width,0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}