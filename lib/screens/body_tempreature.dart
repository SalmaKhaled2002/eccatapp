import 'dart:math';

import 'package:flutter/material.dart';
class Body_Tempreature extends StatefulWidget {
  const Body_Tempreature({super.key});

  @override
  State<Body_Tempreature> createState() => _Body_TempreatureState();
}

class _Body_TempreatureState extends State<Body_Tempreature> {
  bool _customIcon =false;
  @override
  Widget build(BuildContext context) {
      var height=MediaQuery.of(context).size.height;
    log(height.toDouble());
    return Scaffold(
      appBar: AppBar(title: Text('       Body_ Temperature',
      style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold),),),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.9),
            child: FittedBox(
              child: Container(
                alignment: Alignment.center,
                child: ClipRRect(
                   borderRadius:BorderRadius.circular(650),
                  child: Image.asset("images/temp3.PNG",
                  fit: BoxFit.fill,height: height*.3,width: 300)),
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
                    Text('Body temperature ',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,)),
                    Text('-- °C',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,)),
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
              leading: Image.asset("images/temp2.PNG",height: 50,),
              title:Text('What is in body temperature?' ,style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('The average normal body temperature is generally accepted as 98.6°F (37°C). Some studies have shown that the "normal" body temperature can have a wide range, from 97°F (36.1°C) to 99°F (37.2°C). A temperature over 100.4°F (38°C) most often means you have a fever caused by an infection or illness.'
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
              leading: Image.asset("images/temp4.PNG",height: 40,),
              title:Text('What is normal temperature of human body?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Normal body temperature is considered to be 37°C (98.6°F); however, a wide variation is seen. Among normal individuals, mean daily temperature can differ by 0.5°C (0.9°F), and daily variations can be as much as 0.25 to 0.5°C.'
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
              leading: Image.asset("images/temp5.PNG",height: 50,),
              title:Text('How to measure body temperature?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Ways to Take a Temperature :                             1.The thermometer is placed in the child is bottom.     2.The thermometer is placed in the mouth under the tongue.    3.The thermometer is placed in the armpit.    4.The thermometer is placed in the ear.    5.The thermometer scans the surface of the forehead.'
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
              leading: Image.asset("images/temp.PNG",height: 45,),
              title:Text('Can a low temperature mean you are sick?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('You may have a serious illness like hypothermia or sepsis that requires immediate attention. You may have taken your temperature incorrectly. Or you may have another underlying factor contributing to the lower temperature, like advanced age, medication use, or hypothyroidism.'
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
              leading: Image.asset("images/temp1.PNG",height: 40,),
              title:Text('What temperature is too low for a person?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('If your temperature is near or dipping below 95 degrees, it is too low and it indicates hypothermia. People with hypothermia can lose consciousness or go into shock. If you or someone else has signs of hypothermia, seek emergency medical care immediately. Call 911 or go to the ER at once.'
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