// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File myPhoto;
  bool isPhotoTaken = false;

  Future _takePhoto() async {
    var tempstorage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      myPhoto = tempstorage;
      isPhotoTaken = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Rec'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: <Widget>[
          isPhotoTaken ? 
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(myPhoto), fit: BoxFit.cover),
              ),
            ),
          ) : Container(),
          RaisedButton(
            child: Text('Take Photo'),
            onPressed: _takePhoto,
          )
        ],
      ),
    );
  }
}
