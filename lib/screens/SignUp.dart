import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recharge/screens/LoginScreen.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  String phone = '';
  bool termState = false;
  bool passwrdvisible = true;
  String countryCode = '880';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
          child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [Colors.blue, Colors.white]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Create  new  account!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/images/rhc_logo_p.png',
                      height: 224,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field cannot be empty';
                          }
                          return null;
                        },
                        controller: fullName,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Full Name',
                          filled: true,
                          hintStyle: TextStyle(fontWeight: FontWeight.w600),
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 0.5),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: userName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'User Name',
                          filled: true,
                          hintStyle: TextStyle(fontWeight: FontWeight.w600),
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 0.5),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phoneNumber,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field cannot be empty';
                          } else if (value.length < 10) {
                            return 'Invalid Phone Number';
                          }
                          return null;
                        },
                        maxLength: 10,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Colors.white),
                          prefixIcon: Container(
                            padding: EdgeInsets.only(left: 8.0),
                            child: CountryPickerDropdown(
                              iconSize: 18,
                              initialValue: 'BD',
                              // itemBuilder: _buildDropdownItem,
                              onValuePicked: (Country country) {
                                setState(() {
                                  countryCode = country.phoneCode;
                                });
                              },
                            ),
                          ),
                          hintText: 'Phone Number',
                          filled: true,
                          hintStyle: TextStyle(fontWeight: FontWeight.w600),
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 0.5),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: password,
                        obscureText: passwrdvisible,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  passwrdvisible = !passwrdvisible;
                                });
                              },
                              child: !passwrdvisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Password',
                          filled: true,
                          hintStyle: TextStyle(fontWeight: FontWeight.w600),
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 0.5),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            fillColor: MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.blue;
                              }
                              return Colors.white;
                            }),
                            value: termState,
                            onChanged: (val) {
                              setState(() {
                                termState = !termState;
                              });
                            }),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('I accept '),
                        Text(
                          'Privacy and Terms',
                          style: TextStyle(color: Colors.orangeAccent[700]),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate() && termState) {
                          setState(() {
                            phone = countryCode + phoneNumber.text;
                          });
                          DatabaseReference ref = FirebaseDatabase.instance
                              .ref()
                              .child('users')
                              .child(phone + 'recharge');
                          ref.get().then((value) async {
                            if (value.exists) {
                              Get.snackbar(
                                'User Already Exist',
                                'Phone Number Already Registered',
                                colorText: Colors.white,
                                backgroundColor: Colors.red,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else {
                              await FirebaseDatabase.instance
                                  .ref()
                                  .child('users')
                                  .child(phone + 'recharge')
                                  .set({
                                'name': fullName.text,
                                'username': userName.text,
                                'phone': phone,
                                'password': password.text,
                                'pin': '1234',
                                'image': '',
                                'rechargeBalance': '00.00',
                                'driveBalance': ' 00.01',
                              });

                              Get.snackbar(
                                  'Registration Success', 'You can now Login',
                                  colorText: Colors.white,
                                  backgroundColor: Colors.green,
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          });
                        }
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.97,
                        child: const Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
