

import 'package:flutter/material.dart';

class CalcuButton extends StatelessWidget{
  final String text;
  final int textColor;
   final int fillColor;
    final double textSize;
    final Function callback;
  const CalcuButton({Key key , this.text, this.textColor=0xFFFFFFFF, this.fillColor, 
  this.textSize=24,this.callback}) : super(key:key);
  @override
  Widget build(BuildContext context) {
 return Container(
   margin: EdgeInsets.all(10),
    child: new SizedBox(
     width: 65,
     height: 65,
          child: new RaisedButton(
            padding: EdgeInsets.all(20.0),
          child: new Text(text,style:TextStyle(fontSize:textSize)),
          shape: CircleBorder(),
          onPressed: (){
            callback(text);
          },
          color: fillColor != null? Color(fillColor):null,
          textColor: Color(textColor),
              ),
            ),
 );
  }

} 