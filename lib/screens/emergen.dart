import 'dart:math';

import 'package:flutter/material.dart';


class Emergency_information extends StatefulWidget {
  const Emergency_information({super.key});

  @override
  State<Emergency_information> createState() => Emergency_informationState();
}

class Emergency_informationState extends State<Emergency_information> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    log(height.toDouble());
    return Scaffold(
      appBar: AppBar(title: Text('Edit emergency information')),
      body: ListView(
        children: [
           Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('PERSONAL')),
                 ),
               InkWell(
                onTap:(){
                  showModalBottomSheet(context: context,
                   builder: (BuildContext context){
                    return Container (
                     // padding: EdgeInsets.only(bottom: 50),
                      height: height*.19,
                      width: 330,
                      child:Column(
                        children:[
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text('Full name')),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration:InputDecoration(),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){
                                     Navigator.pop(context);
                                  },
                                  child: Text('CANCEL')),
                              ),
                                VerticalDivider(
                                 color: Colors.red,
                                thickness: 2,
                                
                                ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){
                                     Navigator.pop(context);
                                  },
                                  child: Text('OK')),
                              )
                            ],
                          )
                          // Center(
                          //   child: Row(
                          //     children: [
                          //       ElevatedButton(onPressed: (){
                          //         Navigator.pop(context);
                          //       }, child: Text('CANCEL')),
                            
                          //        ElevatedButton(onPressed: (){
                          //         Navigator.pop(context);
                          //       }, child: Text('OK')),
                          //     ],
                          //   ),
                          // )
                        ]
                      )
                   ) ;
                   
                   }
                   );
                },
                child:Row(
                  children: [
                    Padding(
                          padding: const EdgeInsets.only(left: 8),
                   child: Icon(Icons.person,size: 29),),
                    Text('Full name'),

                  ],
                ),
               ),
                 const Divider(
                    color: Color.fromARGB(255, 232, 226, 226),
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                   
                       Row(
                                         
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.location_on_rounded,size: 29),
                        ),
                      Column(
                        children: [
                            Text('  None specified'),
                        Padding(
                              padding:EdgeInsets.only(right: 38),
                              child:Text('Address',style: TextStyle(color: Colors.grey))
                       )
                        ],
                      )
              ],
            ),
        ])),
        Container(
        decoration: BoxDecoration(color: Colors.grey[100],
        borderRadius:BorderRadius.all(Radius.circular(0))),
        height: 5,
        ),
         Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('MEDICAL')),
                ),
                Row(
                  children: [
                    Padding(
                          padding: const EdgeInsets.only(left: 8),
                   child: Icon(Icons.water_drop_outlined,size: 29),),
                    Column(
                      children: [
                        Text(' None specified'),
                        Padding(
                              padding:EdgeInsets.only(right: 26),
                              child:Text('Blood type',style: TextStyle(color: Colors.grey),)
                        )
                      ],
                    )
                  ],
                ),
                 const Divider(
                    color:  Color.fromARGB(255, 232, 226, 226),
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                   
                       Row(
                                         
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.cancel,size: 29),
                        ),
                      Column(
                         children: [
                            Text('  None specified'),
                            Padding(
                              padding:EdgeInsets.only(right: 35),
                              child:
                            Text('Allergies',style: TextStyle(color: Colors.grey),)
                            )
                         ],
                      )
                       
              ],
            ),
             const Divider(
                    color:  Color.fromARGB(255, 232, 226, 226),
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                   
                       Row(
                                         
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.medication_outlined,size: 29),
                        ),
                      Column(
                         children: [
                            Text('  None specified'),
                            Padding(
                              padding:EdgeInsets.only(right: 10),
                              child: Text('Medications',style: TextStyle(color: Colors.grey),),
                            )
                         ],
                      )
                      
              ],
            ),
            const Divider(
                    color:  Color.fromARGB(255, 232, 226, 226),
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                   
                       Row(
                                         
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.medical_services_outlined,size: 29,),
                        ),
                      Column(
                         children: [
                            Padding(
                              padding:EdgeInsets.only(right: 150),
                              child: Text('  None specified')),
                            Text('  Medical conditions and additional info',style: TextStyle(color: Colors.grey),)
                         ],
                      )
                      
              ],
            ),
        //      Container(
        // decoration: BoxDecoration(color: Colors.grey[100],
        // borderRadius:BorderRadius.all(Radius.circular(0))),
        // height: 5,
        // ),

        ]))
           ]) );
  }
}