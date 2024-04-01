import 'dart:math';
import 'package:flutter/material.dart';

class Weight_Body extends StatefulWidget {
  const Weight_Body({super.key});

  @override
  State<Weight_Body> createState() => _Weight_BodyState();
}

class _Weight_BodyState extends State<Weight_Body> {
  bool _customIcon =false;
  @override
  Widget build(BuildContext context) {
      var height=MediaQuery.of(context).size.height;
    log(height.toDouble());
    return Scaffold(
      appBar: AppBar(title: Text('       Body_Weight',
      style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold),),),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Container(
                alignment: Alignment.center,
                child: ClipRRect(
                   borderRadius:BorderRadius.circular(350),
                  child: Image.asset("images/weight1.PNG",
                  fit: BoxFit.fill,height: height*.38,width: 350)),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 90,right: 90,bottom: 2),
            child: Container(
              height: height*.13,
              child: Card(
                child: Column(
                  children: [
                    Text(' Body weight ',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,)),
                    Text('-- Kg',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,)),
                    ],
                ),
              ),
            ),
          ),
         
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Info & Knowledge",
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF674AEF)),
                    )
                  ],
                ),
           ),
        
                 Card(
             child: ExpansionTile(
              leading: Image.asset("images/weight3.PNG",height: 50,),
              title:Text('What do you measure body weight?' ,style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('BMI is used to work out if you are a healthy weight. It is calculated by taking a person  weight in kg and dividing it by their height squared. The higher the figure, the more overweight you are and the greater your health risks .'
                  ,style: TextStyle(fontSize: 13),),
                )
              ],
              onExpansionChanged: (bool expanded){
                setState(() => _customIcon =expanded);    
              },
             ),
           ), Card(
             child: ExpansionTile(
              leading: Image.asset("images/weight.PNG",height: 40,),
              title:Text('What is body weight measurement?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Body Mass Index is a simple calculation using a person height and weight. The formula is BMI = kg/m2 where kg is a person weight in kilograms and m2 is their height in metres squared. A BMI of 25.0 or more is overweight, while the healthy range is 18.5 to 24.9.'
                  ,style: TextStyle(fontSize: 13),),
                )
              ],
              onExpansionChanged: (bool expanded){
                setState(() => _customIcon =expanded);    
              },
             ),
           ),
            Card(
             child: ExpansionTile(
              leading: Image.asset("images/weight5.PNG",height: 40,),
              title:Text('How is body weight calculated?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('To determine body weight in pounds, the desired BMI is multiplied by 5 and then add BMI/5 lb for each inch >5 ft in height. For instance, for a BMI of 20, start with 100 lb for a height of 5 ft and add 4 lb for each additional inch of height.'
                  ,style: TextStyle(fontSize: 13),),
                )
              ],
              onExpansionChanged: (bool expanded){
                setState(() => _customIcon =expanded);    
              },
             ),
           ),
           
           Card(
             child: ExpansionTile(
              leading: Image.asset("images/weight1.PNG",height: 50,),
              title:Text('What is body weight analysis?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('The analysis of body composition by bioelectrical impedance produces estimates of total body water (TBW), fat-free mass (FFM), and fat mass by measuring the resistance of the body as a conductor to a very small alternating electrical current.'
                  ,style: TextStyle(fontSize: 13),),
                )
              ],
              onExpansionChanged: (bool expanded){
                setState(() => _customIcon =expanded);    
              },
             ),
           ),
           Card(
             child: ExpansionTile(
              leading: Image.asset("images/weight2.PNG",height: 45,),
              title:Text('How can I calculate my body weight at home?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Body Mass Index is a simple calculation using a person height and weight. The formula is BMI = kg/m2 where kg is a person weight in kilograms and m2 is their height in metres squared. A BMI of 25.0 or more is overweight, while the healthy range is 18.5 to 24.9. BMI applies to most adults 18-65 years.'
                  ,style: TextStyle(fontSize: 13),),
                )
              ],
              onExpansionChanged: (bool expanded){
                setState(() => _customIcon =expanded);    
              },
             ),
           ),

             
          ] ));
  
  }
}