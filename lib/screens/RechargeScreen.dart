import 'package:flutter/material.dart';
import 'package:recharge/models/showOffers.dart';
import 'package:recharge/screens/paymentConfirmation.dart';
import 'package:recharge/widgets/TopBar.dart';
import 'package:recharge/widgets/packageInfo.dart';

import '../widgets/operatorContainer.dart';

class Recharge extends StatefulWidget {
  Recharge({Key? key}) : super(key: key);

  @override
  State<Recharge> createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  bool isfSelected = false;
  bool issSelected = false;
  bool istSelected = false;
  bool isfoSelected = false;
  bool isfiSelected = false;
  bool issxSelected = false;
  TextEditingController phoneNumber = TextEditingController();
  late String opratorlogo;
  int _radioValue = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value!;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            TopBar(),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 75,
              width: 75,
              alignment: Alignment.center,
              child: Center(
                  child: Image.asset(
                'assets/images/recharge.png',
                height: 50,
              )),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: const Text(
                'Recharge',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (isfSelected) {
                            setState(() {
                              isfSelected = false;
                              isfoSelected = false;
                              istSelected = false;
                              issSelected = false;
                              isfiSelected = false;
                              issxSelected = false;
                            });
                          } else {
                            setState(() {
                              isfSelected = true;
                              isfiSelected = false;
                              issxSelected = false;
                              isfoSelected = false;
                              istSelected = false;
                              issSelected = false;
                              opratorlogo = 'assets/images/telenor.png';
                            });
                          }
                        },
                        child: OperatorContainer(
                            bankName: 'assets/images/telenor.png',
                            isSelected: isfSelected)),
                    GestureDetector(
                        onTap: () {
                          if (issSelected) {
                            setState(() {
                              isfSelected = false;
                              isfoSelected = false;
                              istSelected = false;
                              issSelected = false;
                              isfiSelected = false;
                              issxSelected = false;
                            });
                          } else {
                            setState(() {
                              issSelected = true;
                              isfSelected = false;
                              isfoSelected = false;
                              istSelected = false;
                              isfiSelected = false;
                              issxSelected = false;
                              opratorlogo = 'assets/images/tele.png';
                            });
                          }
                        },
                        child: OperatorContainer(
                          bankName: 'assets/images/tele.png',
                          isSelected: issSelected,
                        )),
                    GestureDetector(
                        onTap: () {
                          if (istSelected) {
                            setState(() {
                              isfSelected = false;
                              isfoSelected = false;
                              istSelected = false;
                              issSelected = false;
                              isfiSelected = false;
                              issxSelected = false;
                            });
                          } else {
                            setState(() {
                              istSelected = true;
                              isfSelected = false;
                              isfoSelected = false;
                              isfiSelected = false;
                              issxSelected = false;
                              issSelected = false;
                              opratorlogo = 'assets/images/robi.png';
                            });
                          }
                        },
                        child: OperatorContainer(
                          bankName: 'assets/images/robi.png',
                          isSelected: istSelected,
                        )),
                    GestureDetector(
                        onTap: () {
                          if (isfoSelected) {
                            setState(() {
                              isfSelected = false;
                              isfoSelected = false;
                              istSelected = false;
                              issSelected = false;
                              isfiSelected = false;
                              issxSelected = false;
                            });
                          } else {
                            setState(() {
                              isfoSelected = true;
                              isfSelected = false;
                              isfiSelected = false;
                              issxSelected = false;
                              istSelected = false;
                              issSelected = false;
                              opratorlogo = 'assets/images/banglalink.png';
                            });
                          }
                        },
                        child: OperatorContainer(
                          bankName: 'assets/images/banglalink.png',
                          isSelected: isfoSelected,
                        )),
                    GestureDetector(
                        onTap: () {
                          if (isfiSelected) {
                            setState(() {
                              isfSelected = false;
                              isfoSelected = false;
                              istSelected = false;
                              issSelected = false;
                              isfiSelected = false;
                              issxSelected = false;
                            });
                          } else {
                            setState(() {
                              isfoSelected = false;
                              isfSelected = false;
                              isfiSelected = true;
                              issxSelected = false;
                              istSelected = false;
                              issSelected = false;
                              opratorlogo = 'assets/images/airtel.png';
                            });
                          }
                        },
                        child: OperatorContainer(
                          bankName: 'assets/images/airtel.png',
                          isSelected: isfiSelected,
                        )),
                    GestureDetector(
                        onTap: () {
                          if (issxSelected) {
                            setState(() {
                              isfSelected = false;
                              isfoSelected = false;
                              istSelected = false;
                              issSelected = false;
                              isfiSelected = false;
                              issxSelected = false;
                            });
                          } else {
                            setState(() {
                              isfoSelected = false;
                              isfSelected = false;
                              isfiSelected = false;
                              issxSelected = true;
                              istSelected = false;
                              issSelected = false;
                              opratorlogo = 'assets/images/skitto.png';
                            });
                          }
                        },
                        child: OperatorContainer(
                          bankName: 'assets/images/skitto.png',
                          isSelected: issxSelected,
                        )),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                  activeColor: Colors.pink,
                ),
                const Text(
                  'Prepaid',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                  activeColor: Colors.pink,
                ),
                const Text(
                  'Pospaid',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 5),
              child: const Text(
                'Enter 11 Digit Number eg: 01XXXXXXXXXXX',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneNumber,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.phone_iphone_sharp),
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
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        PaymentConfirmation(operatorLogo: opratorlogo));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => RechargeSuccess(),
                //   ),
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 5),
                  child: const Text(
                    'Recharge',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: showOffers(
                      type: 'recharge',
                      phone: phoneNumber.text,
                      isfSelected: isfSelected,
                      issSelected: issSelected,
                      istSelected: istSelected,
                      isfoSelected: isfoSelected,
                      isfiSelected: isfiSelected,
                      issxSelected: issxSelected)),
            )
          ],
        ),
      ),
    );
  }
}
