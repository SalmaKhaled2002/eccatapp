import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccatapp/components/custombuttonauth.dart';
import 'package:eccatapp/components/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Patient_information extends StatefulWidget {
   Patient_information({Key? key,}) : super(key: key);


  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<Patient_information> {
  bool loading = false;
  TextEditingController username_patient = TextEditingController();
  TextEditingController age_patient = TextEditingController();
  TextEditingController Disease_patient = TextEditingController();
  TextEditingController Medicine_patient = TextEditingController();

  final List <String> diseases = ["Pressure disease", "Diabetes", "Heart disease", "Nothing"];
  String _selectedval = "Nothing";

  final firestore = FirebaseFirestore.instance;
  bool isEdit = false;
  final user = FirebaseAuth.instance;
  int selectedindex = 0;
  String? username;
  String? email;
  String? role;
  String? uid;
  int? phone;
  String? gender;
  String? name_patient;
  int? age;
  String? disease;
  String? medicine;

  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    uid = user.currentUser!.uid;
    final DocumentSnapshot docUser =
    await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (docUser.exists) {
      setState(() {
        uid = docUser.get('uid');
        username = docUser.get('username');
        email = docUser.get('email');
        phone = docUser.get('phone');
        gender = docUser.get('gender');
        role = docUser.get('role');
        name_patient = docUser.get('username_patient');
        age = docUser.get('age');
        disease = docUser.get('Diseases');
        medicine = docUser.get('Medicine');

      });

    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
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
          ])),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 15, right: 15, bottom: 20)),
                  Text(
                    "         Patient Profile",
                    style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 10,
                  ),
                  CustomTextForm(readOnly: !isEdit,
                    labelText: name_patient==null || name_patient=='' ? username??'Patient name' : name_patient??'Patient name',
                    hinttext: "Enter  patient name",
                    mycontroller: username_patient,
                    obscuretext: false,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Can't to be empty!";
                      }
                    },
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  CustomTextForm(readOnly: !isEdit,
                    labelText: age==null || age==0 ? 'Age' : age.toString(),
                    hinttext: "Enter his age",
                    mycontroller: age_patient,
                    obscuretext: false,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Can't to be empty!";
                      }
                    },
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 5),
                    child: DropdownButtonFormField(
                      value: disease == null || disease == "" ? "Nothing" : disease,
                      items: diseases
                          .map((e) => DropdownMenuItem(enabled: isEdit,
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedval = val as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.deepPurple,
                      ),
                      dropdownColor: Colors.deepPurple.shade50,
                      decoration: InputDecoration(
                        hintText: "Diseases",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                        labelText: "Diseases",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                        prefixIcon: Icon(
                          Icons.medical_information,
                          color: Colors.deepPurple,
                        ),
                        border: UnderlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90),
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide(
                              color: Colors.green,
                            )),
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2)),
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  CustomTextForm(
                    readOnly: !isEdit,
                    labelText: medicine==null || medicine=="" ? "Medicine" : medicine.toString(),
                    hinttext: "Write the medicine his use",
                    mycontroller: Medicine_patient,
                    obscuretext: false,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Can't to be empty!";
                      }
                    },
                    prefixIcon: Icon(
                      Icons.medication,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25),
                  ),
                  if(isEdit)
                  CustomButtonAuth(
                    title: "  Done  ",
                    onPressed: () async {
                      loading = true;
                      setState(() {});
                      await  firestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                        "username_patient":username_patient.text.trim(),
                        "age":int.parse(age_patient.text.trim()),
                        "Diseases":_selectedval,
                        "Medicine":Medicine_patient.text.trim(),
                      });
                      setState(() {
                        isEdit = !isEdit;
                      });

                    },
                  ),if(isEdit)
                  Container(
                    padding: EdgeInsets.only(top: 25),
                  ),
                  CustomButtonAuth(
                    title: "  Edit  ",
                    onPressed: () async {
                     setState(() {
                       isEdit = !isEdit;
                     });

                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}