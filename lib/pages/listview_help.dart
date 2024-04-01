import 'package:flutter/material.dart';

class List_help extends StatefulWidget {
  const List_help ({super.key});

  @override
  State<List_help> createState() => _ChatbotState();
}


class _ChatbotState extends State<List_help> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 85, 70, 70)),
      child: ListView(
        children: [
          Card(
            child: ListTile(
              onTap: (){
                       showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        
                       title: Text("What is application support?"),
                         content: Text("Application support is an IT service provided to users within an organization. It enables the IT processes needed to run a successful business."),
                        actions: 
                        [
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Close"))],
                      );
                  });
              },
              
              title: Text('What is application support?'),
            ),
          ),
           Card(
            child: ListTile(
              onTap: (){
                       showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        
                       title: Text("How can I change my profile picture?"),
                         content: Text("To change your profile picture,go to User Profile and click on the Edit_Profile button."),
                        actions: 
                        [
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Close"))],
                      );
                  });
              },
              
              title: Text('How can I change my profile picture?'),
            ),
          ),
            Card(
            child: ListTile(
              onTap: (){
                       showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        
                       title: Text(" Individuals with special needs encounter challenges in accessing healthcare services, including physical accessibility and lack of specialized care.  "),
                         content: Text("Solution: Improve healthcare facilities' accessibility, train healthcare providers in disability awareness, and ensure availability of specialized services."),
                        actions: 
                        [
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Close"))],
                      );
                  });
              },
              
              title: Text(' Individuals with special needs encounter challenges in accessing healthcare services, including physical accessibility and lack of specialized care.  '),
            ),
          ),

         
          Card(
            child: ListTile(
              onTap: (){
                       showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        
                       title: Text("People with special needs face social stigma and discrimination, leading to exclusion and marginalization."),
                         content: Text("Solution: Raise awareness, promote diversity and inclusion initiatives, and advocate for equal rights and opportunities for individuals with disabilities."),
                        actions: 
                        [
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Close"))],
                      );
                  });
              },
              
              title: Text('People with special needs face social stigma and discrimination, leading to exclusion and marginalization. '),
            ),
          ),
        
          Card(
            child: ListTile(
              onTap: (){
                       showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        
                       title: Text("Many individuals with special needs face barriers in accessing quality education due to lack of resources and inclusive policies. "),
                         content: Text("Solution - Implement inclusive education practices, provide specialized resources and support, and train educators to address diverse learning needs."),
                        actions: 
                        [
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Close"))],
                      );
                  });
              },
              
              title: Text('Many individuals with special needs face barriers in accessing quality education due to lack of resources and inclusive policies. '),
            ),
          ),
         
          Card(
            child: ListTile(
              onTap: (){
                       showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        
                       title: Text("What services does the application provide?"),
                         content: Text("This application provide Security services, healthcare services, AI services and IOT services."),
                        actions: 
                        [
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Close"))],
                      );
                  });
              },
              
              title: Text('What services does the application provide?'),
            ),
          ),
           Card(
            child: ListTile(
              onTap: (){
                       showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        
                       title: Text("How do I reset my password?"),
                         content: Text("To reset your password, go to the login page and click on the [Forget Password] link."),
                        actions: 
                        [
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Close"))],
                      );
                  });
              },
              
              title: Text('How do I reset my password?'),
            ),
          ),
          Card(
            child: ListTile(
              onTap: (){
                       showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        
                       title: Text("What Healthcare services does the application provide?"),
                         content: Text("Health tracking for patient in the Wheel_Chair to keep track of Heart rate,Temperature,Oximeter,Display these vital values on application and give alert if any value is abnormal ."),
                        actions: 
                        [
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Close"))],
                      );
                  });
              },
              
              title: Text('What Healthcare services does the application provide?'),
            ),
          ),
           Card(
            child: ListTile(
              onTap: (){
                       showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        
                       title: Text("People with special needs often struggle to find employment due to discrimination and lack of accommodation in the workplace. "),
                         content: Text("Solution: Enforce anti-discrimination laws, offer vocational training programs, promote inclusive hiring practices, and provide workplace accommodations."),
                        actions: 
                        [
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Close"))],
                      );
                  });
              },
              
              title: Text('People with special needs often struggle to find employment due to discrimination and lack of accommodation in the workplace. '),
            ),
          ),
         Card(
            child: ListTile(
              onTap: (){
                       showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        
                       title: Text(" Limited access to assistive technology and digital platforms hinders the independence and participation of individuals with special needs. "),
                         content: Text("Solution: Develop and distribute accessible technology solutions, provide training in technology usage, and advocate for digital accessibility standards."),
                        actions: 
                        [
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Close"))],
                      );
                  });
              },
              
              title: Text(' Limited access to assistive technology and digital platforms hinders the independence and participation of individuals with special needs.  '),
            ),
          ),
           
           Card(
            child: ListTile(
              onTap: (){
                       showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        
                       title: Text("Individuals with special needs encounter challenges navigating complex legal and bureaucratic processes. "),
                         content: Text("Solution:  Provide legal assistance and advocacy services, simplify procedures, and ensure accessibility of legal documents and information."),
                        actions: 
                        [
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Close"))],
                      );
                  });
              },
              
              title: Text('Individuals with special needs encounter challenges navigating complex legal and bureaucratic processes. '),
            ),
          ),
           Card(
            child: ListTile(
              onTap: (){
                       showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        
                       title: Text("Financial challenges often burden individuals with special needs and their families, including high healthcare costs and limited employment opportunities.  "),
                         content: Text("Solution:Expand financial assistance programs, provide tax incentives for disability-related expenses, and ensure equal access to financial services."),
                        actions: 
                        [
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Close"))],
                      );
                  });
              },
              
              title: Text('Financial challenges often burden individuals with special needs and their families, including high healthcare costs and limited employment opportunities. '),
            ),
          ),
        ],
      ),
    );
  }
}