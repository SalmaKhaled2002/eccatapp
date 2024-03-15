import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccatapp/auth/signup.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';


class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newFieldKeyController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _newFieldValueController =
      TextEditingController();
    final user = FirebaseAuth.instance.currentUser;
  File? _imageFile;
  final picker = ImagePicker();
  String? urlPhoto;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  bool _isLoading = false;
  String? name;
  String? email;
  int?phone;

  @override
  void initState() {
    super.initState();
    getUserData();
   
     
       
    
  }

  Future uploadImageURL()async{
     
      final ref =await FirebaseStorage.instance.ref().child('usersImages').child('$user_name' + '.jpg');
      await ref.putFile(_imageFile!);
      urlPhoto =await ref.getDownloadURL();

      //  await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({
      //   'username':urlPhoto,
      //   });

      
    }

getUserData() async{
final user = FirebaseAuth.instance.currentUser; 
final uid = user!.uid   ;
   final DocumentSnapshot docUser = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    setState(() {
      name = docUser.get('username');
    email = docUser.get('email');
    phone = docUser.get('phone');
     _nameController.text =name! ;
        _emailController.text =email! ;
        _phoneNumberController.text ='0$phone' ;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
      
      
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
          
          child:
           SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top:25,left: 15,right: 15,bottom: 20)),
                  Text("            User Profile",style: TextStyle(fontSize: 29,fontWeight:FontWeight.bold ),),
                  Center(
                    child: CircleAvatar(
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
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      onPressed:(){ _isLoading ? null : _uploadImage();},
                      
                     
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Update Profile Picture',style: TextStyle(fontSize: 16,color: Colors.white),),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: (){},
                      //_isLoading ? null : _removeImage,
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Remove Profile Picture',style: TextStyle(fontSize: 16,color: Colors.white),),
                    ),
                  ),
              
                  Text(
                    'Name:',
                  style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your name,hintStyle: TextStyle(fontWeight: FontWeight.w500',
                     border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(30)),
                         borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,width: 2)
                      ),
                        
                      
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Email:',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email,hintStyle: TextStyle(fontWeight: FontWeight.w500',
                     border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(30)),
                         borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,width: 2)
                      ),
                        
                      
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Phone Number:',
                     style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    
                    controller: _phoneNumberController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your phone number,hintStyle: TextStyle(fontWeight: FontWeight.w500',
                     border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(30)),
                         borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,width: 2)
                      ),
                        
                      
                    ),
                  ),
          
                  const SizedBox(height: 16),
          
                  //update info
                  Center(
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      onPressed:(){},
                      //  _isLoading ? null : _updateUserInfo,
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Update Info',style: TextStyle(fontSize: 16,color: Colors.white)),
                    ),
                  ),
          
                  //change password
                  Center(
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: _isLoading ? null : _changePassword,
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Change Password',style: TextStyle(fontSize: 16,color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Add info about you',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _newFieldKeyController,
                    decoration: const InputDecoration(
                      hintText: 'Enter new field',hintStyle: TextStyle(fontWeight: FontWeight.w500),
                     border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(30)),
                         borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,width: 2)
                      ),
                        
                      
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _newFieldValueController,
                    decoration: const InputDecoration(
                      hintText: 'Enter new value of this field ',hintStyle: TextStyle(fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(30)),
                         borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,width: 2)
                      ),
                        
                      
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ),
                      onPressed:(){},
                      //  _isLoading ? null : _addNewField,
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Add Field',style: TextStyle(fontSize: 16,color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

 

  void _changePassword() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset link sent to your email')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _uploadImage() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final ref =await _storage.ref().child('usersImages').child('users/${user!.uid}/profile.png');

     UploadTask uploadTask =  ref.putFile(_imageFile!);

      // final url = await ref.getDownloadURL();
      TaskSnapshot  snapshot = await uploadTask.whenComplete(() => null);

    final url = await snapshot.ref.getDownloadURL();

      await user!.updatePhotoURL(url);

      await _firestore.collection('users').doc(user!.uid).update({
        'photoUrl': url,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile picture updated successfully')),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating profile picture: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // void _removeImage() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     // Delete the profile picture from Firebase Storage
  //     if (urlPhoto != null) {
  //       await _storage.refFromURL(urlPhoto!).delete();
  //     }

  //     // Remove the profile picture URL from the Firestore document
  //     await _firestore
  //         .collection('users')
  //         .doc(_user.uid)
  //         .update({'photoUrl': null});

  //     setState(() {
  //       _imageFile = null;
  //       urlPhoto = null;
  //       _isLoading = false;
  //     });

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Profile picture removed')),
  //     );
  //   } catch (error) {
  //     setState(() {
  //       _isLoading = false;
  //     });

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Failed to remove profile picture')),
  //     );
  //   }
  // }

  // Future<void> _updateUserInfo() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     await _user.updateDisplayName(_nameController.text);
  //     await _user.updateEmail(_emailController.text);
  //     await _firestore.collection('users').doc(_user.uid).update({
  //       'name': _nameController.text,
  //       'email': _emailController.text,
  //       'phone': _phoneNumberController.text,
  //     });

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('User info updated successfully')),
  //     );
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error updating user info: $e')),
  //     );
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  // Future<void> _addNewField() async {
  //   final newFieldKey = _newFieldKeyController.text.trim();
  //   final newFieldValue = _newFieldValueController.text.trim();
  //   if (newFieldKey.isEmpty || newFieldValue.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please enter a key and value')),
  //     );
  //     return;
  //   }

  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     await _firestore
  //         .collection('users')
  //         .doc(_user.uid)
  //         .update({newFieldKey: newFieldValue});
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('New field added successfully')),
  //     );
  //     _newFieldKeyController.clear();
  //     _newFieldValueController.clear();
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error adding new field: $e')),
  //     );
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }
 }