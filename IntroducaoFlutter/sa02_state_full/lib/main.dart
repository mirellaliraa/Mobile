import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Galeria()));
}

class Galeria extends StatefulWidget{
 @override
 GaleriaAppState createState() => _GaleriaAppState();
}

@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text("Galeria"), centerTitle: true,),
    body: Padding(padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        
      ],
    ),
    ),
  )
}