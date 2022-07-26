import 'package:flutter/material.dart';
import 'package:recharge/models/UserModel.dart';
import 'package:recharge/widgets/packageInfo.dart';

import '../widgets/TopBar.dart';
import '../widgets/operatorContainer.dart';

class BankTransfer extends StatefulWidget {
  final String phoneNumber;
  final String ammount;
  final String OfferName;
  final String OfferPrice;
  final String OfferOriginalPrice;
  final String duration;
  BankTransfer(
      {Key? key,
      required this.phoneNumber,
      required this.ammount,
      required this.OfferName,
      required this.OfferPrice,
      required this.OfferOriginalPrice,
      required this.duration})
      : super(key: key);

  @override
  State<BankTransfer> createState() => _BankTransferState();
}

class _BankTransferState extends State<BankTransfer> {
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  bool isfSelected = true;
  bool issSelected = false;
  bool istSelected = false;
  bool isfoSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: ListView(
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
                          });
                        } else {
                          setState(() {
                            isfSelected = true;

                            isfoSelected = false;
                            istSelected = false;
                            issSelected = false;
                          });
                        }
                      },
                      child: OperatorContainer(
                          bankName: 'assets/images/ic_1.png',
                          isSelected: isfSelected)),
                  GestureDetector(
                      onTap: () {
                        if (issSelected) {
                          setState(() {
                            isfSelected = false;
                            isfoSelected = false;
                            istSelected = false;
                            issSelected = false;
                          });
                        } else {
                          setState(() {
                            issSelected = true;
                            isfSelected = false;
                            isfoSelected = false;
                            istSelected = false;
                          });
                        }
                      },
                      child: OperatorContainer(
                        bankName: 'assets/images/ic_1.png',
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
                          });
                        } else {
                          setState(() {
                            istSelected = true;
                            isfSelected = false;
                            isfoSelected = false;

                            issSelected = false;
                          });
                        }
                      },
                      child: OperatorContainer(
                        bankName: 'assets/images/ic_1.png',
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
                          });
                        } else {
                          setState(() {
                            isfoSelected = true;
                            isfSelected = false;

                            istSelected = false;
                            issSelected = false;
                          });
                        }
                      },
                      child: OperatorContainer(
                        bankName: 'assets/images/ic_2.png',
                        isSelected: isfoSelected,
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: widget.phoneNumber != ''
                      ? Center(
                          child: Text(
                            'Activate Offer to ' + widget.phoneNumber,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : Center(),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: accountNumberController,
                        keyboardType: TextInputType.number,
                        maxLength: 17,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Account Number',
                          filled: true,
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w600),
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 0.5),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    widget.ammount == ''
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.monetization_on_sharp),
                                hintText: 'Amount to Transfer (1000 - 5000)',
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w600),
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 0.5),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              enabled: false,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.monetization_on_sharp),
                                hintText:
                                    'Amount to Transfer = ৳ ${widget.ammount}',
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w600),
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 0.5),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                    widget.ammount == ''
                        ? Container()
                        : PkgInfo(
                            type: 'recharge',
                            OfferName: widget.OfferName,
                            OfferPrice: widget.OfferPrice,
                            OfferOriginalPrice: widget.OfferOriginalPrice,
                            duration: widget.duration,
                            phoneNumber: widget.phoneNumber),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: pinController,
                        maxLength: 4,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.pin),
                          hintText: 'Pin',
                          filled: true,
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w600),
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 0.5),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: widget.ammount != ''
                          ? () {
                              if (UserList.user.first.pin !=
                                  pinController.text) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Wrong Pin'),
                                        content:
                                            Text('Please enter correct pin'),
                                        actions: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: const Center(
                                                    child: Text(
                                                  'Ok',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    });
                              } else {}
                            }
                          : () {},
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            'Transfer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
