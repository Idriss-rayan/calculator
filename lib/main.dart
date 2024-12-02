import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> buttons =
  [
    'C' , 'DEL' , '%' , '/' ,
    '9' , '8' , '7' , 'x' ,
    '6' , '5' , '4' , '-' ,
    '3' , '2' , '1' , '+' ,
    '0' , '.' , 'ANS' , '=' ,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context , int index){
                    if (index == 0) {
                          return MyButton(
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white,
                          );
                    }else if( index == 1) {
                            return MyButton(
                                buttonText: buttons[index],
                                color: Colors.red,
                                textColor: Colors.white,
                            );
                    }else {
                        return MyButton(buttonText: buttons[index],
                        color: isOperator(buttons[index]) ? Colors.grey[900] : Colors.grey[100],
                        textColor: isOperator(buttons[index]) ? Colors.white : Colors.grey[900],
                      );
                    }
                  }
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '='|| x == '+') {
      return true;
    }
    return false;
  }

}
