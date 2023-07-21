



import 'package:flutter/material.dart';
import 'package:basic_calculator/color.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var input='';
  var output='';
  var operation='';
  var hideinput=false;
  var outputsize=34.0;



  onButtonClick(value){
    if(value=="AC")
    {
      input='';
      output='';
    }
    else if(value=="⌫")
    {
      if(input.isNotEmpty)
      {
        input=input.substring(0,input.length-1);
      }
    }
    else if(value=="=")
    {
      if(input.isNotEmpty)
      {
        var userinput=input;
        userinput=input.replaceAll("x", "*");
        Parser p=Parser();
        Expression expression=p.parse(userinput);
        ContextModel cm=ContextModel();
        var finalvalue=expression.evaluate(EvaluationType.REAL, cm);
        output=finalvalue.toString();
        if(output.endsWith(".0"))
        {
          output=output.substring(0,output.length-2);
        }
        input=output;
        hideinput=false;
        outputsize=52.0;
      }
    }
    else{
      input=input+value;
      hideinput=false;
      outputsize=34.0;

    }


  }




  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
  
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.0),

              
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                  input,
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 48.0,
                  )
                  ),
                  SizedBox(height: 20,),

                  Text(
                    output,
                  style:TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: outputsize,
                  )
                  ),

                  SizedBox(height: 30.0,),


                ],
            
              ),
            ),
          ),
          Row(
            children: [
              button(
                text: "AC",
                buttonBgcolor: operatorColor,
                tColor: orangeColor,
              ),
              button(
                text: "⌫",
                 buttonBgcolor: operatorColor,
                tColor: orangeColor,),
                
              button(
                text: "",buttonBgcolor: Colors.transparent,
              ),
              button(
                text: "/",
                 buttonBgcolor: operatorColor,
                tColor: orangeColor,
              ),
              
              
            ],
          ),
          Row(
            children: [
              button(
                text: "7",
              ),
              button(
                text: "8",),
                
              button(
                text: "9",
              ),
              button(
                text: "x",
                 buttonBgcolor: operatorColor,
                tColor: orangeColor,
              ),
              
              
            ],
          ),
          Row(
            children: [
              button(
                text: "4",
              ),
              button(
                text: "5",),
                
              button(
                text: "6",
              ),
              button(
                text: "-",
                 buttonBgcolor: operatorColor,
                tColor: orangeColor,
              ),
              
              
            ],
          ),
          Row(
            children: [
              button(
                text: "1",
              ),
              button(
                text: "2",),
                
              button(
                text: "3",
              ),
              button(
                text: "+",
                 buttonBgcolor: operatorColor,
                tColor: orangeColor,
              ),
              
              
            ],
          ),
          Row(
            children: [
              button(
                text: "%",
              ),
              button(
                text: "0",),
                
              button(
                text: ".",
              ),
              button(
                text: "=",
                 buttonBgcolor: orangeColor,
                tColor: Colors.white,
              ),
              
              
            ],
          ),
         

          
          
          

            

          
        ],
      ),

    );
  }

  Widget button({
    text,tColor=Colors.white,
    buttonBgcolor=buttonColor,
  }) {
    return Expanded(
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),



                      padding: EdgeInsets.all(22.0),
                      primary: buttonBgcolor,
                    ),
                    onPressed: () =>onButtonClick(text),  
                    child: Text(
                      text,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: tColor,
                      fontWeight: FontWeight.bold,
                    ),
                    
                    ))),
    );
              

  }
}

