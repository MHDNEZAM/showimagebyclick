//Import flutter helper library

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';
// create a class that will be our custom widget
// this class must extend the 'statlesswidget' base class

class App extends StatefulWidget{
  createState(){
    return AppState();
  }

}

class AppState extends State<App>{

  int counter = 0;
  List<ImageModel> images=[];

  void fetchImage() async{
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = new ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);

    });
    print('hi there the counter is now :'+counter.toString());
  }
// must define a 'build' method that returns
// the widgets that *this* widget will show
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Lets see some images!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add) ,
        ),
        body: ImageList(images),
      ),
    );

  }
}

