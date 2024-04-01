import 'dart:math';

import 'package:flutter/material.dart';
class Heart_Rate extends StatefulWidget {
  const Heart_Rate({super.key});

  @override
  State<Heart_Rate> createState() => _Heart_RateState();
}

class _Heart_RateState extends State<Heart_Rate> {
  bool _customIcon =false;
  @override
  Widget build(BuildContext context) {
      var height=MediaQuery.of(context).size.height;
    log(height.toDouble());
    return Scaffold(
      appBar: AppBar(title: Text('          Heart Rate',
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
                  child: Image.asset("images/heart3.PNG",
                  fit: BoxFit.fill,height: height*.38,width: 350)),
              ),
            ),
          ),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text('Your result',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,
          //     fontStyle: FontStyle.italic),),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 90,right: 90,bottom: 2),
            child: Container(
              height: height*.13,
              child: Card(
                child: Column(
                  children: [
                    Text('Heart Rate',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,)),
                    Text('-- BPM',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,)),
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
              leading: Image.asset("images/heart5.PNG",height: 50,),
              title:Text('What is Heart Rate?' ,style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Heart rate (or pulse rate)is the frequency of the heartbeat measured by the number of contractions of the heart per minute (beats per minute, or bpm). The heart rate at which it can vary according to the body physical needs, including the need to absorb oxygen and excrete carbon dioxide, but is also modulated by numerous factors, including (but not limited to) genetics, physical fitness, stress or psychological status, diet, drugs, hormonal status, environment, and disease/illness as well as the interaction between and among these factors.'
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
              leading: Image.asset("images/heart1.PNG",height: 40,),
              title:Text('What is the normal heart rate?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('A normal resting heart rate for adults ranges from 60 to 100 beats per minute. Generally, a lower heart rate at rest implies more efficient heart function and better cardiovascular fitness. For example, a well-trained athlete might have a normal resting heart rate closer to 40 beats per minute.'
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
              leading: Image.asset("images/heart2.PNG",height: 50,),
              title:Text('What is a good to bad heart rate?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('A  normal heart rate is usually stated as 60 to 100 beats per minute. Slower than 60 is bradycardia ("slow heart"); faster than 100 is tachycardia ("fast heart"). But some experts believe that an ideal resting heart rate is closer to 50 to 70.'
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
              leading: Image.asset("images/heart3.PNG",height: 45,),
              title:Text('Does heart rate tell you anything?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Your heart rate is how many times your heart beats in 60 seconds. This number can go up or down as you go through your day. It can be low when you are sitting still and go up when you are walking the dog. You can use your heart rate to find out if the physical activity you are doing is at the ideal level for your heart .'
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
              leading: Image.asset("images/heart4.PNG",height: 40,),
              title:Text('What is an alarming heart rate?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Abnormal Heart Rates or Heart Beats reflect the cardiac conditions of the body. If unnoticed and untreated, this can sometimes be fatal. Conditions when the heartbeat goes beyond 120-140 beats per minute or falls below 60 beats per minute, can be considered dangerous, and immediate doctor is intervention is a must.'
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