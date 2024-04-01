import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Help_Screen extends StatefulWidget {
  const Help_Screen ({super.key});

  @override
  State<Help_Screen> createState() => _ChatbotState();
}


class _ChatbotState extends State<Help_Screen> {
  ChatUser myself =ChatUser(id: "1",firstName: "Salma");
  ChatUser bot =ChatUser(id: "2",firstName: "ChatBoot");
  List<ChatMessage> allMessage=[];
  List<ChatUser> typing=[];
  final oururl='https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyCYULQ2mmYj0IQrRDmq8VvhQayyJGnI-J8';
  final header={
    'Content-Type' : 'application/json'
  };
  getData(ChatMessage m)async{
    typing.add(bot);
    allMessage.insert(0, m);
    setState(() {
    });

    var data={"contents":[{"parts":[{"text":m.text}]}]};

    await http.post(Uri.parse(oururl),headers: header,body:jsonEncode(data)).then((value) {
      if(value.statusCode == 200){
        var result=jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);
        ChatMessage m1=ChatMessage(
          text: result['candidates'][0]['content']['parts'][0]['text'],
          user: bot,
          createdAt: DateTime.now(),
        );
        allMessage.insert(0, m1);
        setState(() {

        });

      }else{
        print("Error occurred");
      }
    }).
    catchError((e){});
    typing.remove(bot);
    setState(() {

    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashChat(
          messageOptions: MessageOptions(
              showTime: true,
              textColor: Colors.blue,
              containerColor: Colors.black
          ),
          typingUsers: typing,
          currentUser: myself,
          onSend: (ChatMessage m) {
            getData(m);
          },
          messages:allMessage ),
    );
  }
}