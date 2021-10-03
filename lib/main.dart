import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import './UI/CalcuButton.dart';

void main() {
  runApp(ClacApp());
}

class ClacApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ClacAppState();
  }
}

class ClacAppState extends State<ClacApp> {
  String _expression = '';
  String _history = '';
  double num1 = 0;
  double num2 = 0;
  String operand = '';
  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allclear(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evalote(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double evel = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = evel.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF283637),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    _history,
                    style: TextStyle(fontSize: 24, color: Color(0xFF545F61)),
                    maxLines: 1,
                  ),
                  alignment: Alignment(1, 1),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  child: Text(_expression,
                      style: TextStyle(fontSize: 48, color: Colors.white),
                      maxLines: 1),
                  alignment: Alignment(1, 1),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CalcuButton(
                              text: 'AC',
                              fillColor: 0xFF6C807F,
                              textSize: 17,
                              callback: allclear,
                            ),
                            CalcuButton(
                              text: 'C',
                              fillColor: 0xFF6C807F,
                              callback: clear,
                            ),
                            CalcuButton(
                              text: '%',
                              fillColor: 0xFFFFFFFF,
                              textColor: 0xFF65BDAC,
                              callback: numClick,
                            ),
                            CalcuButton(
                              text: '/',
                              fillColor: 0xFFFFFFFF,
                              textColor: 0xFF65BDAC,
                              callback: numClick,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalcuButton(
                            text: '7',
                            fillColor: 0xFF283637,
                            callback: numClick,
                          ),
                          CalcuButton(
                            text: '8',
                            fillColor: 0xFF283637,
                            callback: numClick,
                          ),
                          CalcuButton(
                            text: '9',
                            fillColor: 0xFF283637,
                            callback: numClick,
                          ),
                          CalcuButton(
                            text: '*',
                            fillColor: 0xFFFFFFFF,
                            textColor: 0xFF65BDAC,
                            callback: numClick,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalcuButton(
                            text: '4',
                            fillColor: 0xFF283637,
                            callback: numClick,
                          ),
                          CalcuButton(
                            text: '5',
                            fillColor: 0xFF283637,
                            callback: numClick,
                          ),
                          CalcuButton(
                            text: '6',
                            fillColor: 0xFF283637,
                            callback: numClick,
                          ),
                          CalcuButton(
                            text: '-',
                            fillColor: 0xFFFFFFFF,
                            textColor: 0xFF65BDAC,
                            callback: numClick,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalcuButton(
                            text: '1',
                            fillColor: 0xFF283637,
                            callback: numClick,
                          ),
                          CalcuButton(
                            text: '2',
                            fillColor: 0xFF283637,
                            callback: numClick,
                          ),
                          CalcuButton(
                            text: '3',
                            fillColor: 0xFF283637,
                            callback: numClick,
                          ),
                          CalcuButton(
                            text: '+',
                            fillColor: 0xFFFFFFFF,
                            textColor: 0xFF65BDAC,
                            callback: numClick,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalcuButton(
                            text: '.',
                            fillColor: 0xFF283637,
                            callback: numClick,
                          ),
                          CalcuButton(
                            text: '0',
                            fillColor: 0xFF283637,
                            callback: numClick,
                          ),
                          CalcuButton(
                            text: '^2',
                            fillColor: 0xFF283637,
                            textSize: 18,
                            callback: numClick,
                          ),
                          CalcuButton(
                            text: '=',
                            fillColor: 0xFFFFFFFF,
                            textColor: 0xFF65BDAC,
                            callback: evalote,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CalcuButton(
                            text: 'cos',
                            fillColor: 0xFF283637,
                            callback: numClick,
                            textSize: 14,
                          ),
                          CalcuButton(
                            text: 'sin',
                            fillColor: 0xFF283637,
                            callback: numClick,
                            textSize: 15,
                          ),
                          CalcuButton(
                            text: 'tan',
                            fillColor: 0xFF283637,
                            callback: numClick,
                            textSize: 15,
                          ),
                          CalcuButton(
                            text: 'log',
                            textSize: 15,
                            fillColor: 0xFF283637,
                            callback: numClick,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
