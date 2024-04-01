
import 'dart:math';
import 'package:flutter/material.dart';

class Oxygen extends StatefulWidget {
  const Oxygen({super.key});

  @override
  State<Oxygen> createState() => _OxygenState();
}

class _OxygenState extends State<Oxygen> {
  bool _customIcon =false;
  @override
  Widget build(BuildContext context) {
      var height=MediaQuery.of(context).size.height;
    log(height.toDouble());
    return Scaffold(
      appBar: AppBar(title: Text('     Oxygen_percentage',
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
                  child: Image.asset("images/ox5.PNG",
                  fit: BoxFit.fill,height: height*.38,width: 350)),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 90,right: 90,bottom: 2),
            child: Container(
              height: height*.11,
              child: Card(
                child: Column(
                  children: [
                    Text(' Oxygen percentage ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,)),
                    Text('-- %',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,)),
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
              leading: Image.asset("images/ox4.PNG",height: 50,),
              title:Text('What is oxygen and its function?' ,style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Oxygen plays a critical role in respiration, the energy-producing chemistry that drives the metabolisms of most living things. We humans, along with many other creatures, need oxygen in the air we breathe to stay alive. Oxygen is generated during photosynthesis by plants and many types .'
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
              leading: Image.asset("images/ox3.PNG",height: 40,),
              title:Text('What is the daily use of oxygen?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('So, as far as how much air is actually used, human beings take in about 550 liters of pure oxygen per day. A person who is exercising uses a lot more oxygen than that. To determine how much air is moving through your lungs, exhale into a plastic bag of known volume.'
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
              leading: Image.asset("images/ox.PNG",height: 50,),
              title:Text('How does oxygen work for the body?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Oxygen gets into our cells and tissues via the lungs. The lungs breathe in oxygen from the air, then pass the oxygen into the bloodstream through millions of tiny air sacs called alveoli. Hemoglobin in the red blood cells then picks up the oxygen and carries it off to the body.'
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
              leading: Image.asset("images/ox1.PNG",height: 45,),
              title:Text('How do we get oxygen?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('We get oxygen by breathing in fresh air, and we remove carbon dioxide from the body by breathing out stale air. But how does the breathing mechanism work? Air flows in via our mouth or nose. The air then follows the windpipe, which splits first into two bronchi: one for each lung.'
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
              leading: Image.asset("images/ox2.PNG",height: 40,),
              title:Text('How much oxygen do humans need?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Human beings must breathe oxygen . . . to survive, and begin to suffer adverse health effects when the oxygen level of their breathing air drops .'
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