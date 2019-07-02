import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';
class MomoGlow extends StatefulWidget {
  @override
  _MomoGlowState createState() => _MomoGlowState();
}

class _MomoGlowState extends State<MomoGlow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: RaisedButton(child:Text('Glow'),onPressed: (){Lamp.turnOn();})),
    );
  }
}
