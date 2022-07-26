import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:recharge/models/Offers.dart';
import 'package:recharge/widgets/TopBar.dart';
import 'package:recharge/widgets/packageInfo.dart';

import '../models/showOffers.dart';
import '../widgets/operatorContainer.dart';

class DriveOffer extends StatefulWidget {
  DriveOffer({Key? key}) : super(key: key);

  @override
  State<DriveOffer> createState() => _DriveOfferState();
}

class _DriveOfferState extends State<DriveOffer> {
  bool isfSelected = false;
  bool issSelected = false;
  bool istSelected = false;
  bool isfoSelected = false;
  bool isfiSelected = false;
  bool issxSelected = false;
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
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
            const SizedBox(
              height: 20,
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
                  hintText: 'Phone Number',
                  filled: true,
                  hintStyle: TextStyle(fontWeight: FontWeight.w600),
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            showOffers(
                isfSelected: isfSelected,
                istSelected: istSelected,
                isfiSelected: isfiSelected,
                isfoSelected: isfoSelected,
                issSelected: issSelected,
                type: '',
                phone: phoneNumber.text,
                issxSelected: issxSelected),
          ],
        ),
      )),
    );
  }
}
