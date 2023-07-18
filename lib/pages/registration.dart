

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  CollectionReference users = FirebaseFirestore.instance.collection('users').doc('user1').collection('notes');



  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
 final TextEditingController _dateController = TextEditingController();
 final TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _commentsController = TextEditingController();

 // Country _selectedCountry;

  String? get source => null;
  bool isValidDateKey(String dateKey) {
    // Define the date key pattern (YYYY-MM-DD)
    final RegExp dateKeyPattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');

    if (!dateKeyPattern.hasMatch(dateKey)) {
      // Date key format is invalid
      return false;
    }

    try {
      // Attempt to parse the date key
      DateTime.parse(dateKey);
      return true;
    } catch (e) {
      // Date key is not a valid date
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Form'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(

            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'CLIENT NAME',
                    icon:Icon(Icons.drive_file_rename_outline),
                    enabledBorder:OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5),
                      borderRadius: BorderRadius.circular(50.0)),

                  ),
                  validator: (value) {
                    if (value==null || value.trim().length<3) {
                      return 'please enter more than three characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'DATE',
                    icon:Icon(Icons.calendar_today_rounded),
                    enabledBorder:OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5),
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                  onTap: () async{
                    DateTime? today = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    if (today != null){
                      setState( (){
                        _dateController.text=DateFormat('yyyy-MM-dd').format(today);
                      });
                    }

                  },
                  validator: (value) {

                    if (value==null ||!isValidDateKey(value!)) {
                      return 'Please enter the date';
                    }
                    return null;
                  },
                ),//lok
                SizedBox(height: 16.0),
                IntlPhoneField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'PHONE NUMBER',
                    icon: Icon(Icons.phone),
                    enabledBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 5),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  initialCountryCode: 'US',


                validator: (value) {
                    bool isvalid = RegExp(r'^\+\d{1,3}\s?\d{3,14}$').hasMatch(value!);

                  //return mobileNumberPattern.hasMatch(phoneNumber);
                  if (value == null|| !isvalid) {
                    return 'Please enter the date';
                  }
                  return null;
                },
                ),






                SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'EMAIL ID',
                    icon:Icon(Icons.email),
                    enabledBorder:OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5),
                        borderRadius: BorderRadius.circular(50.0)),
                  ),

                  validator: (value) {
                    final bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+").hasMatch(value!);
                    if (value== null ||!emailValid ) {
                      return 'Please enter valid email ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'PRICE',
                    icon:Icon(Icons.attach_money),
                    enabledBorder:OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5),
                        borderRadius: BorderRadius.circular(50.0)),


                  ),
                  validator: (value) {
                    bool isvalid  = RegExp(r'^\d+(\.\d+)?$').hasMatch(value!);
                    if (value == null || !isvalid) {
                      return 'Please enter only digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _commentsController,
                  decoration: InputDecoration(
                    labelText: 'COMMENTS',
                    icon:Icon(Icons.comment),
                    enabledBorder:OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5),
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                ),
                SizedBox(height:40),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[200],
                    foregroundColor: Colors.black,

                  ),
                  onPressed: ()async {

                    if (_formKey.currentState!.validate()) {
                      // Process the form data
                      String name = _nameController.text;
                      String date = _dateController.text;
                      String phone = _phoneController.text;
                      String email = _emailController.text;
                      String price = _priceController.text;
                      String comments = _commentsController.text;


                      // Print or use the form data
                      await users.add({'name':name,
                        'date':date,
                        'phone':phone,
                        'email':email,
                        'price':price,
                        'comments':comments,
                      }).then((value){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Submitted successfully!'),
                          ),
                        );
                        print("User Added");
                        _nameController.text="";
                        _dateController.text="";
                        _phoneController.text="";
                        _emailController.text="";
                        _priceController.text="";
                        _commentsController.text="";




                      }).catchError((error) => print("Failed to add user: $error"));
                      print('Client Name: $name');
                      print('Date: $date');
                      print('Phone Number: $phone');
                      print('Email ID: $email');
                      print('Price: $price');
                      print('Comments: $comments');
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


