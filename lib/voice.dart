
//import 'package:eccatapp/auth/signup.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:eccatapp/myprofile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';


class Voice extends StatefulWidget {


  @override
  State<Voice> createState() => _MyHome_State();
}
final DatabaseReference =FirebaseDatabase.instance.ref("StoreVoice");
class _MyHome_State extends State<Voice> {
  
  final SpeechToText _speechToText= SpeechToText();
  

   bool _speechEnabled=false;
   String _wordSpoken="";
   double _confidenceLevel=0;
  late String Construction= _wordSpoken;
  
   
  @override
  void initState() {
    super.initState();
    initSpeech();
  }
  void initSpeech() async{
    _speechEnabled =await _speechToText.initialize();
    setState(() {
      
    });
  }
  void _startListening ()async{
    await _speechToText.listen(onResult: _OnSpeechResult);
    setState(() {
      _confidenceLevel=0;
    });
  }
  void _stopListening ()async{
    await _speechToText.stop();
    setState(() {
      
    });
  }
  void _OnSpeechResult(result){
    setState(() {
       _wordSpoken="${result.recognizedWords}";
       _confidenceLevel=result.confidence; 
     DatabaseReference.child(DateTime.now().microsecond.toString()).set({
         'Construcion':_wordSpoken.toString(),
      });
    });
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 223, 193, 203), 
        title: Text("  Confidence :${(_confidenceLevel*100).toStringAsFixed(1)}% ",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300)
      ),
      
      ),
      
        
      
      body:Container(
         decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin:Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [
            0.1,
            0.4,
            1,
          ],
          colors: [
            Color.fromARGB(255, 107, 105, 105),
            Color.fromARGB(255, 214, 214, 235),
            Color.fromARGB(255, 223, 193, 203),
          ]
        )
      ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
             
              Container(
                padding:EdgeInsets.only(top: 15,right: 10,left: 10),
                child: Text(_speechToText.isListening ?"Listening....":_speechEnabled?"Press the button and Start Speaking":
                "Speech not available"
                ,style: TextStyle(fontSize: 28.0,color: Colors.black),),
              ),
              
              Expanded(
                
                child: Container(
                //padding: EdgeInsets.only(bottom: 10),
                child:Text(_wordSpoken,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),) ,)),
                 Padding(
                   padding: const EdgeInsets.only(bottom: 25),
                   child: SizedBox(
                    
                    height: 150,width: 90,
                     child: FloatingActionButton( onPressed: _speechToText.isListening? _stopListening :_startListening,
                           tooltip: "Listen",
                           child:  Icon(_speechToText.isNotListening ?Icons.mic_off :Icons.mic,
                           color: Colors.white,size: 90,)
                           ,backgroundColor: Colors.black,
                           ),
                   ),
                 ) ,
             
                
              
            ],
            
          ),
          
        ),
      )  );
  }
  }
  
 