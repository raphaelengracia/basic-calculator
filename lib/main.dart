import 'package:flutter/material.dart';


void main(){

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Home(),

    );

  }
}
// New Dart named Home
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int num1 =0, num2=0;
  String operand ='';
  String result = "",text = "";

  void button_click(String button_text) {
    if (button_text == "C") {
      result = "";
      text = "";
      num1 = 0;
      num2 = 0;
    }
    else if (button_text == "+" || button_text == "_" ||
        button_text == "*" || button_text == "/" || button_text == "M" ||
        button_text == "%") {
      num1 = int.parse(text);
      result = "";
      operand = button_text;
    }
    else if (button_text == "=") {
      num2 = int.parse(text);

      if (operand == "+") {
        result = (num1 + num2).toString();
      }
      else if (operand == "_") {
        result = (num1 - num2).toString();
      }
      else if (button_text == "*") {
        result = (num1 * num2).toString();
      }
      else if (button_text == "/") {
        result = (num1 / num2).toString();
      }
      else if (button_text == "M") {
        result = (num1 % num2).toString();
      }
      else if (button_text == "%") {
        result = ((num1 / num2)*100).toString();
      }
    }
    else{
      result = int.parse(text + button_text).toString();
    }
    setState(() {
      text = result;
    });
  }


  Widget customOutlineButton(String value){
    return Expanded(
        child: OutlinedButton(
            onPressed: () => button_click(value),
            child: Padding(
                padding:const EdgeInsets.all(20),
                child: Text(value,
                    style: const TextStyle (fontSize: 30 )
                )
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Basic Calculator')),
        body: Column(
          children: [
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.bottomLeft,
                    child: Text (text,
                        style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color:Colors.lightBlue)


                    )
                )


            ),
            Row(
              children: [
                customOutlineButton("M"),
                customOutlineButton("%"),
                customOutlineButton("C"),

              ],
            ),
            Row(
              children: [
                customOutlineButton("7"),
                customOutlineButton("8"),
                customOutlineButton("9"),
                customOutlineButton("/"),

              ],
            ),
            Row(
              children: [
                customOutlineButton("4"),
                customOutlineButton("5"),
                customOutlineButton("6"),
                customOutlineButton("*"),

              ],
            ),
            Row(
              children: [
                customOutlineButton("1"),
                customOutlineButton("2"),
                customOutlineButton("3"),
                customOutlineButton("_"),

              ],
            ),
            Row(
              children: [
                customOutlineButton("0"),
                customOutlineButton("."),
                customOutlineButton("="),
                customOutlineButton("+"),

              ],
            ),


          ],


        )



    );
  }
}
