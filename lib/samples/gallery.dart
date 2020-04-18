import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  @override
  GalleryState createState() => GalleryState();
}

class GalleryState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery Demo"),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(50, (index) {
          return GridTile(
            child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 6.0,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            "assets/images/om.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Image title ${index + 1}"))
                      ],
                    ))),
          );
        }),
      ),
    );
  }
}
