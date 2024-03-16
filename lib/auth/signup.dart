import 'dart:io';
import 'dart:js_interop';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:eccatapp/components/custombuttonauth.dart';
import 'package:eccatapp/components/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

void main() {
  runApp(Signup());
}

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _MyHome();
}

TextEditingController user_name = TextEditingController();
TextEditingController useremail = TextEditingController();
TextEditingController userpassword = TextEditingController();
TextEditingController userPhone_Number = TextEditingController();
TextEditingController username_patient = TextEditingController();
TextEditingController age_patient = TextEditingController();
TextEditingController Disease_patient = TextEditingController();
TextEditingController Medicine_patient = TextEditingController();

//final databaseReference = FirebaseDatabase.instance.ref("StoreData");
class _MyHome extends State<Signup> {
  late User _user;
  File? _imageFile;
  final picker = ImagePicker();
  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  bool status = false;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final firestore = FirebaseFirestore.instance;
  bool isPassword = true;
  _MyHome() {
    _selectedval = diseases[3];
  }

  Future addUserDetails(
      String username,
      String email,
      int phone,
      String username_patient,
      int age,
      String Dieases,
      String Medicine,
      String uid,
      String url) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'username': username,
      'email': email,
      'phone': phone,
      'username_patient': username_patient,
      'age': age,
      'Dieases': Dieases,
      'Medicine': Medicine,
      'uid': uid,
      'ImageUrl': url,
    });
  }

  bool loading = false;
  final diseases = ["Pressure disease", "Diabetes", "Heart disease", "Nothing"];
  String _selectedval = "";

  late String urlPhoto;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
                padding: const EdgeInsets.only(right: 35, left: 35),
                child: ListView(
                  children: [
                    Text("        SignUp",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent)),
                    Container(
                        padding: EdgeInsets.only(top: 8),
                        child: Lottie.asset(
                          "assets/wel.json",
                          height: 200,
                          width: 300,
                        )),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : urlPhoto != null
                              ? NetworkImage(urlPhoto!) as ImageProvider
                              : null,
                      child: GestureDetector(
                        onTap: _getImage,
                        child: (urlPhoto == null || urlPhoto!.isEmpty)
                            ? const Icon(Icons.person, size: 60)
                            : SizedBox(),
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
                            if (val == null) {
                              return ("Can't to be empty!");
                            }
                          },
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                          )),
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
                          if (val == null) {
                            print("Can't to be empty!");
                          }
                        },
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.deepPurple,
                        )),
                    Container(
                      height: 10,
                    ),
                    CustomTextForm(
                        labelText: "Password",
                        hinttext: "Enter your password",
                        mycontroller: userpassword,
                        obscuretext: isPassword,
                        validator: (val) {
                          if (val == "") {
                            return ("Can't to be empty!");
                          }
                        },
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.deepPurple,
                        ),
                        suffixIcon: togglePassword()),
                    Container(
                      height: 10,
                    ),
                    CustomTextForm(
                        labelText: "Phone_Number",
                        hinttext: "Enter your number",
                        obscuretext: false,
                        mycontroller: userPhone_Number,
                        validator: (val) {
                          if (val == "") {
                            return ("Can't to be empty!");
                          }
                        },
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.deepPurple,
                        )),
                    const Text(
                      "  Patient_information",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.orangeAccent),
                    ),
                    Container(
                      height: 10,
                    ),
                    CustomTextForm(
                        labelText: "User_name",
                        hinttext: "Enter his patient_name ",
                        mycontroller: username_patient,
                        obscuretext: false,
                        validator: (val) {
                          if (val == "") {
                            return ("Can't to be empty!");
                          }
                        },
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.deepPurple,
                        )),
                    Container(
                      height: 10,
                    ),
                    CustomTextForm(
                        labelText: "Age",
                        hinttext: "Enter his age",
                        mycontroller: age_patient,
                        obscuretext: false,
                        validator: (val) {
                          if (val == "") {
                            return ("Can't to be empty!");
                          }
                        },
                        prefixIcon: Icon(
                          Icons.calendar_month,
                          color: Colors.deepPurple,
                        )),
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
                          setState(
                            () {
                              _selectedval = val as String;
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.deepPurple,
                        ),
                        dropdownColor: Colors.deepPurple.shade50,
                        decoration: InputDecoration(
                          hintText: "Diseases",
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
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
                        labelText: "Medicine",
                        hinttext: "Write the medicine his use",
                        mycontroller: Medicine_patient,
                        obscuretext: false,
                        validator: (val) {
                          if (val == "") {
                            return ("Can't to be empty!");
                          }
                        },
                        prefixIcon: Icon(
                          Icons.medication,
                          color: Colors.deepPurple,
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 20),
                      child: Column(children: [
                        CheckboxListTile(
                            value: status,
                            activeColor: Colors.green,
                            checkColor: Colors.black,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text(
                                "I agree to privacy policy and Terms of use.",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                            onChanged: (val) {
                              setState(() {
                                status = val!;
                              });
                            }),
                        Container(
                          padding:
                              EdgeInsets.only(bottom: 10, right: 30, left: 30),
                        ),
                        CustomButtonAuth(
                            title: "  Create Account  ",
                            onPressed: () async {
                              try {
                                loading = true;
                                setState(() {});
                                UserCredential? userCredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                  email: useremail.text,
                                  password: userpassword.text,
                                );

                                final ref = FirebaseStorage.instance
                                    .ref()
                                    .child('usersImages')
                                    .child(user_name.text + '.jpg');

                                await ref.putFile(_imageFile!);
                                urlPhoto = ref.getDownloadURL() as String;


                                addUserDetails(
                                    user_name.text.trim(),
                                    useremail.text.trim(),
                                    int.parse(userPhone_Number.text.trim()),
                                    username_patient.text.trim(),
                                    int.parse(age_patient.text.trim()),
                                    _selectedval,
                                    Medicine_patient.text.trim(),
                                    

                                    FirebaseAuth.instance.currentUser!.uid,urlPhoto!,);

                                loading = false;
                                setState(() {});

                                Navigator.of(context)
                                    .pushReplacementNamed("test");
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
                            }),
                      ]),
                    ),
                  ],
                ))));
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
              ));
  }
}
