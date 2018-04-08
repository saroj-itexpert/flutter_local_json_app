import 'dart:convert';

import 'package:flutter/material.dart';

void main()=>runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.teal,

  ),
  home: new HomePage(),



));


class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  List data;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Load Local JSON App"),

      ),

      body: new Container(
        child: new Center(
          child: new FutureBuilder( //used to load local json file
            future: DefaultAssetBundle.of(context).loadString('local_json/person.json'),
            builder: (context, snapshot){
              //Decode JSON
              var mydata = JSON.decode(snapshot.data.toString());

              return new ListView.builder(
                  itemCount: mydata == null ? 0 : mydata.length,
                  itemBuilder: (BuildContext context, int index){
                    return new Card(

                      elevation: 8.0,
                      child: new Column(  //to add multiple elements
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[

                          new Text("Name: " + mydata[index]['name']),
                          new Text("Age: " + mydata[index]['age']),
                          new Text("Height: " + mydata[index]['height']),
                          new Text("Gender: " + mydata[index]['gender']),
                          new Text("Hair Color: " + mydata[index]['hair_color']),


                        ],

                      ),

                    );
                  }
              );
            },
          ),
        ),
      ),


    );

  }
}