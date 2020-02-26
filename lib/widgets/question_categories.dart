import 'package:flutter/material.dart';
import 'package:peponi_app/widgets/bottom_sheet.dart';

class QuestionCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(top: 120.0, left: 10.0, right: 10.0),
          child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 15.0,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(8, (index) {
              return GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.green,
                  ),
                  child: GridTile(
                    child: Image.network(
                      "https://via.placeholder.com/150",
                      fit: BoxFit.cover,
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.black38,
                      title: Center(child: Text("CATEGORY $index"),),
                    ),
                  ),
                ),
                onTap: (){
                  showBottomSheet(
                    context: context,
                    builder: (context) => MyBottomSheet(),
                  );
                },
              );
            }),
          ),
    );
  }
}