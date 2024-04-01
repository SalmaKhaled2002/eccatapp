import 'package:eccatapp/pages/keyword_response.dart';
import 'package:flutter/material.dart';
import 'package:ikchatbot/ikchatbot.dart';



class Chat_Bot extends StatefulWidget {
  const Chat_Bot({Key? key}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}


class _UserInfoPageState extends State<Chat_Bot> {


 
  @override
  Widget build(BuildContext context) { 
    final chatBotConfig = IkChatBotConfig(
    //SMTP Rating to your mail Settings
    ratingIconYes: const Icon(Icons.star),
    ratingIconNo: const Icon(Icons.star_border),
    ratingIconColor: Colors.black,
    ratingBackgroundColor: Colors.white,
    ratingButtonText: 'Submit Rating',
    thankyouText: 'Thanks for your rating!',
    ratingText: 'Rate your experience:',
    ratingTitle: 'Thank you for using the chatbot!',
    body: 'This is a test email sent from Flutter and Dart.',
    subject: 'Test Rating',
    recipient: 'recipient@example.com',
    isSecure: false,
    senderName: 'Your Name',
    smtpUsername: 'Your Email',
    smtpPassword: 'your password',
    smtpServer: 'stmp.gmail.com',
    smtpPort: 587,
    //Settings to your system Configurations
    sendIcon: const Icon(Icons.send, color: Colors.black),
    userIcon: const Icon(Icons.person, color: Colors.white),
    botIcon: const Icon(Icons.android, color: Colors.white),
    botChatColor: const Color.fromARGB(255, 81, 80, 80),
    delayBot: 100,
    closingTime: 1,
    delayResponse: 1,
    userChatColor: Colors.blue,
    waitingTime: 1,
    keywords: keywords,
    responses: responses,
    backgroundColor: Colors.white,
    backgroundImage: 'https://i.pinimg.com/originals/26/88/9f/26889fb85cb76049f09b4ca91ef42a4d.jpg',
    initialGreeting:
    "👋 Hello! \nWelcome to IkBot\nHow can I assist you today?   what is your name?   How can I change my profile picture?   How do I reset my password?   What services does the application provide?",
    defaultResponse: "Sorry, I didn't understand your response.",
    inactivityMessage: "Is there anything else you need help with?",
    closingMessage: "This conversation will now close.",
    inputHint: 'Send a message',
    waitingText: 'Please wait...',
    useAsset: false,
    backgroundAssetimage: "lib/assets/bg.jpeg",
  );

    return Scaffold(
      appBar: AppBar(title: Text('Chat_Bot'),),
      body: ikchatbot(config: chatBotConfig),
    );
  }
}