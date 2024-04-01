
import 'dart:math';
import 'package:flutter/material.dart';

class Blood_Pressure extends StatefulWidget {
  const Blood_Pressure({super.key});

  @override
  State<Blood_Pressure> createState() => _OxygenState();
}

class _OxygenState extends State<Blood_Pressure> {
  bool _customIcon =false;
  @override
  Widget build(BuildContext context) {
      var height=MediaQuery.of(context).size.height;
    log(height.toDouble());
    return Scaffold(
      appBar: AppBar(title: Text('       Blood_Pressure',
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
                   borderRadius:BorderRadius.circular(150),
                  child: Image.asset("images/pres5.PNG",
                  fit: BoxFit.fill,height: height*.38,width: 350)),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 90,right: 90,bottom: 2),
            child: Container(
              height: height*.12,
              child: Card(
                child: Column(
                  children: [
                    Text(' Blood_Pressure  ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,)),
                    Text('-- mm Hg',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,)),
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
              leading: Image.asset("images/pres3.PNG",height: 50,),
              title:Text('What is blood pressure?' ,style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Blood pressure is the pressure of blood pushing against the walls of your arteries. Arteries carry blood from your heart to other parts of your body. Your blood pressure normally rises and falls throughout the day.'
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
              leading: Image.asset("images/pres1.PNG",height: 40,),
              title:Text('What is meant by mean blood pressure?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('The definition of mean arterial pressure (MAP) is the average arterial pressure throughout one cardiac cycle, systole, and diastole.'
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
              leading: Image.asset("images/pres2.PNG",height: 35,),
              title:Text('What are the 3 types of blood pressure?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('There are different types of blood pressures, namely, basal, systolic, diastolic, maximum, mean arterial pressure, and simply blood pressure.'
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
              leading: Image.asset("images/heart2.PNG",height: 45,),
              title:Text('What is the formula for blood pressure?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Therefore, mean blood pressure (MBP) is usually calculated with a standard formula (SF) as follows: MBP = diastolic blood pressure (DBP) + 1/3 [systolic blood pressure (SBP) – DBP]. However, during exercise this proportion is lost because of tachycardia, which shortens diastole more than systole.'
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
              leading: Image.asset("images/heart3.PNG",height: 40,),
              title:Text('What is high blood pressure (hypertension)?',style: TextStyle(fontSize: 12)) ,
              trailing: Icon(
                _customIcon ?Icons.arrow_drop_down_circle :Icons.arrow_drop_down,
              ),
              children: [
                ListTile(
                  title: Text('Blood Pressure Levels  1. Normal: systolic: less than 120 mm Hg ,diastolic: less than 80 mm Hg.   2.At Risk (prehypertension):systolic: 120–139 mm Hg diastolic: 80–89 mm Hg.   3.High Blood Pressure (hypertension) :systolic: 140 mm Hg or higher diastolic: 90 mm Hg or higher .'
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