import 'package:flutter/material.dart';
import 'package:peponi_app/widgets/bottom_sheet.dart';
import 'package:peponi_app/widgets/my_container.dart';
import 'package:peponi_app/widgets/question_categories.dart';

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
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              height: 250.0,
              child: ClipPath(
                clipper: ClippingClass(),
                child: MyContainer(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0,horizontal: 20.0),
              child: Text("Select a category below to start quiz",
              style: TextStyle(
                fontSize: 19.0,
                color: Colors.white,
              ),),
            ),
            QuestionCategories(),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 40);
//    path.quadraticBezierTo(x1, y1, x2, y2);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
