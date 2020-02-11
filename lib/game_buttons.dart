//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameButtons{
  final id;
  String text;
  Color bg;
  bool enabled;
  GameButtons(
    {
      this.id,this.text="",this.bg=Colors.deepPurple,this.enabled=true
    }
  );
}
