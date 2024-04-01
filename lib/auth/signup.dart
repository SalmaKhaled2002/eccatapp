import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccatapp/components/custombuttonauth.dart';
import 'package:eccatapp/components/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  State<Signup> createState() => _MyHome();
}

class _MyHome extends State<Signup> {
  TextEditingController user_name = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController userpassword = TextEditingController();
  TextEditingController userPhone_Number = TextEditingController();
  TextEditingController gender_person = TextEditingController();
  TextEditingController role_person = TextEditingController();
  TextEditingController age_patient = TextEditingController();
  TextEditingController Disease_patient = TextEditingController();
  TextEditingController Medicine_patient = TextEditingController();

  final diseases = ["Pressure disease", "Diabetes", "Heart disease", "Nothing"];
  String _selectedval = "Nothing";

  final gender = ["select your gender", "Male", "Female"];
  String genderval = "select your gender";

  final role = ["select your role", "Patient", "Relative"];
  String roleval = "select your role";

  bool loading = false;

  var formkey = GlobalKey<FormState>();

  bool status = false;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final firestore = FirebaseFirestore.instance;
  bool isPassword = true;

  Future<void> addUserDetails({
    String? uid,
    String? username,
    String? email,
    int? phone,
    String? gender,
    String? role,
    String? username_patient,
    int?  age,
    String? Dieases,
    String? Medicine,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'uid': uid,
      'username': username,
      'email': email,
      'phone': phone,
      'gender': gender,
      'role': role,
      'username_patient': username_patient,
      'age': age,
      'Diseases': Dieases,
      'Medicine': Medicine,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.1, 0.4, 1],
            colors: [
              Color.fromARGB(255, 107, 105, 105),
              Color.fromARGB(255, 214, 214, 235),
              Color.fromARGB(255, 223, 193, 203),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.only(right: 35, left: 35),
            child: ListView(
              children: [
                Text(
                  "        SignUp",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8),
                  child: Lottie.asset(
                    "assets/wel.json",
                    height: 200,
                    width: 300,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: CustomTextForm(
                    labelText: "User_name",
                    hinttext: "Enter your username",
                    mycontroller: user_name,
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
                ),
                Container(
                  height: 10,
                ),
                CustomTextForm(
                  labelText: "Email",
                  hinttext: "Enter your email",
                  mycontroller: useremail,
                  obscuretext: false,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Can't to be empty!";
                    }
                  },
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.deepPurple,
                  ),
                ),
                Container(
                  height: 10,
                ),
                CustomTextForm(
                  labelText: "Password",
                  hinttext: "Enter your password",
                  mycontroller: userpassword,
                  obscuretext: isPassword,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Can't to be empty!";
                    }
                  },
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.deepPurple,
                  ),
                  suffixIcon: togglePassword(),
                ),
                Container(
                  height: 10,
                ),
                CustomTextForm(
                  keyboardType: TextInputType.phone,

                  labelText: "Phone_Number",
                  hinttext: "Enter your number",
                  obscuretext: false,
                  mycontroller: userPhone_Number,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Can't to be empty!";
                    }
                  },
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.deepPurple,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: DropdownButtonFormField(
                    value: genderval,
                    items: gender
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        genderval = val as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.deepPurple,
                    ),
                    dropdownColor: Colors.deepPurple.shade50,
                    decoration: InputDecoration(
                      hintText: "Gender",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      labelText: "Gender",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person,
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
                          borderSide: BorderSide(color: Colors.blue, width: 2)),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: DropdownButtonFormField(
                    value: roleval,
                    items: role
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        roleval = val as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.deepPurple,
                    ),
                    dropdownColor: Colors.deepPurple.shade50,
                    decoration: InputDecoration(
                      hintText: "Role",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      labelText: "Role",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person,
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
                          borderSide: BorderSide(color: Colors.blue, width: 2)),
                    ),
                  ),
                ),
                if (roleval == "Patient")
                  const Text(
                    "  Patient_information",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.orangeAccent,
                    ),
                  ),
                if (roleval == "Patient")
                  Container(
                    height: 10,
                  ),
                if (roleval == "Patient")
                  CustomTextForm(
                    keyboardType: TextInputType.number,
                    labelText: "Age",
                    hinttext: "Enter his age",
                    mycontroller: age_patient,
                    obscuretext: false,
                    validator: (val) {
                      if (val!.isEmpty && roleval == "Patient") {
                        return "Can't to be empty!";
                      }
                    },
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: Colors.deepPurple,
                    ),
                  ),
                if (roleval == "Patient")
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 5),
                    child: DropdownButtonFormField(
                      value: _selectedval,
                      items: diseases
                          .map((e) => DropdownMenuItem(
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
                if (roleval == "Patient")
                  Container(
                    height: 10,
                  ),
                if (roleval == "Patient")
                  CustomTextForm(
                    labelText: "Medicine",
                    hinttext: "Write the medicine his use",
                    mycontroller: Medicine_patient,
                    obscuretext: false,
                    validator: (val) {
                      if (val!.isEmpty && roleval == "Patient") {
                        return "Can't to be empty!";
                      }
                    },
                    prefixIcon: Icon(
                      Icons.medication,
                      color: Colors.deepPurple,
                    ),
                  ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        value: status,
                        activeColor: Colors.green,
                        checkColor: Colors.black,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          "I agree to privacy policy and Terms of use.",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        onChanged: (val) {
                          setState(() {
                            status = val!;
                          });
                        },
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(bottom: 10, right: 30, left: 30),
                      ),
                      CustomButtonAuth(
                        title: "  Create Account  ",
                        onPressed: () async {
                          if (formkey.currentState!.validate() ) {
                            try {
                              loading = true;
                              setState(() {});
                              UserCredential? userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                email: useremail.text,
                                password: userpassword.text,
                              );

                              addUserDetails(
                                  uid: FirebaseAuth.instance.currentUser!.uid,
                                  username: user_name.text.trim(),
                                  email: useremail.text.trim(),
                                  phone: int.parse(userPhone_Number.text.trim()),
                                  gender: genderval,
                                  role: roleval,
                                  username_patient: '',
                                  age: int.parse(  age_patient.text.isEmpty ? '0' : age_patient.text.trim()),
                                  Dieases: _selectedval == 'Nothing' ? '' : _selectedval,
                                  Medicine:Medicine_patient.text.isEmpty ? '' : Medicine_patient.text.trim());

                              Navigator.of(context)
                                  .pushReplacementNamed("home_page");

                              loading = false;
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.leftSlide,
                                  showCloseIcon: true,
                                  title: "Error!",
                                  desc: "The password provided is too weak.",
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    'The account already exists for that email.');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.leftSlide,
                                  showCloseIcon: true,
                                  title: "Error!",
                                  desc:
                                  "The account already exists for that email.",
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                              }
                            } catch (e) {
                              print(e);
                            }
                          }

                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          isPassword = !isPassword;
        });
      },
      icon: isPassword
          ? Icon(
              Icons.visibility_off,
              color: Colors.deepPurple,
            )
          : Icon(
              Icons.visibility,
              color: Colors.green,
            ),
    );
  }
}