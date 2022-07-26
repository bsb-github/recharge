import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recharge/bottomsheets/PinBottomSheet.dart';
import 'package:recharge/models/UserModel.dart';
import 'package:recharge/screens/ForgotPassword.dart';
import 'package:recharge/screens/HomeScreen.dart';
import 'HomeScreen.dart';
import 'SignUp.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pin = TextEditingController();

  String countryCode = '880';
  bool passwrdvisible = true;

  final _formKey = GlobalKey<FormState>();
  final _FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/rhc_logo_p.png', height: 225),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: phone,
                      maxLength: 10,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'field cannot be empty';
                        } else if (value.length < 10) {
                          return 'invalid phone number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
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
                        hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 0.5),
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
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                passwrdvisible = !passwrdvisible;
                              });
                            },
                            child: !passwrdvisible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)),
                        hintText: 'Password',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 0.5),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()));
                      },
                      child: Text(
                        'Forgot password !',
                        style: TextStyle(
                          color: Colors.red[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          await FirebaseDatabase.instance
                              .ref()
                              .child('users')
                              .child(countryCode + phone.text + 'recharge')
                              .get()
                              .then((value) {
                            if (value.exists) {
                              var data = value.children;
                              var datalist = data
                                  .map(
                                    (e) => e.value.toString(),
                                  )
                                  .toList();
                              print(datalist);
                              if (datalist[3] == password.text &&
                                  datalist[5].isNotEmpty) {
                                UserList.user = [
                                  UserModel(
                                    username: datalist[7],
                                    phone: datalist[4],
                                    name: datalist[2],
                                    imageUrl: datalist[1],
                                    rechargeBalance: datalist[6],
                                    driveBalance: datalist[0],
                                    pin: datalist[5],
                                  )
                                ];

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              } else if (datalist[5] == "") {
                                UserList.user = [
                                  UserModel(
                                    username: datalist[7],
                                    phone: datalist[4],
                                    name: datalist[2],
                                    imageUrl: datalist[1],
                                    rechargeBalance: datalist[6],
                                    driveBalance: datalist[0],
                                    pin: datalist[5],
                                  )
                                ];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Form(
                                              key: _FormKey,
                                              child: Scaffold(
                                                backgroundColor: Colors.white,
                                                body: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    const Text(
                                                      'Add Your Pin',
                                                      style: TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextFormField(
                                                        controller: pin,
                                                        obscureText: true,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please enter your pin';
                                                          }
                                                          return null;
                                                        },
                                                        maxLength: 4,
                                                        decoration:
                                                            InputDecoration(
                                                          suffixIcon:
                                                              const Icon(
                                                                  Icons.pin),
                                                          hintText:
                                                              'Pin Number',
                                                          filled: true,
                                                          hintStyle:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                          fillColor:
                                                              Colors.grey[200],
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .blue,
                                                                    width: 0.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        if (_formKey
                                                            .currentState!
                                                            .validate()) {
                                                          await FirebaseDatabase
                                                              .instance
                                                              .ref()
                                                              .child('users')
                                                              .child(countryCode +
                                                                  phone.text +
                                                                  'recharge')
                                                              .update({
                                                            "pin": pin.text
                                                          });
                                                          Get.snackbar(
                                                            'Pin Added',
                                                            'Please dont share this pin with others',
                                                            colorText:
                                                                Colors.white,
                                                            backgroundColor:
                                                                Colors.green,
                                                            snackPosition:
                                                                SnackPosition
                                                                    .BOTTOM,
                                                          );

                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          Home()));
                                                        }
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: const Center(
                                                            child: Text(
                                                              'Submit',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                          height: 50,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )));
                              } else {
                                Get.snackbar('Invalid Password',
                                    'Check Your Password and Try Again',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red,
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            } else {
                              print(countryCode + phone.text + 'recharge');
                              Get.snackbar('Invalid Phone Number',
                                  'User Doesn\'t exist ',
                                  colorText: Colors.white,
                                  backgroundColor: Colors.red,
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.97,
                      child: const Center(
                        child: Text(
                          'LOG IN',
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
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.97,
                      child: const Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blue[400],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
