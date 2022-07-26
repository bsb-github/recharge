import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:recharge/screens/changePassword.dart';

class OtpVerification extends StatefulWidget {
  final String phone;
  OtpVerification({Key? key, required this.phone}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  String _verificationID = '';
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    verifyPhone();
  }

  verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+' + widget.phone,
        verificationCompleted: (AuthCredential credential) {
          //  print(widget.phone);
        },
        verificationFailed: (FirebaseAuthException exception) {
          //print(exception.message);
        },
        codeSent: (String verificarionID, int? resendToken) {
          setState(() {
            _verificationID = verificarionID;
          });
          print(verificarionID + ' ' + 'sent');
        },
        codeAutoRetrievalTimeout: (String verificarionID) {
          setState(() {
            _verificationID = verificarionID;
          });
          print(verificarionID);
        },
        timeout: const Duration(seconds: 60));
  }

  final defaultPinTheme = PinTheme(
    width: 60,
    height: 64,
    textStyle: TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
    decoration: BoxDecoration(
      color: Colors.grey[600],
      borderRadius: BorderRadius.circular(24),
    ),
  );

  final cursor = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 21,
      height: 1,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'OTP Verification',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Verify +${widget.phone}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Pinput(
          length: 6,
          controller: controller,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          separator: SizedBox(width: 16),
          onSubmitted: (pin) async {},
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05999999865889549),
                  offset: Offset(0, 3),
                  blurRadius: 16,
                )
              ],
            ),
          ),
          showCursor: true,
          cursor: cursor,
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () async {
            try {
              await FirebaseAuth.instance
                  .signInWithCredential(PhoneAuthProvider.credential(
                      verificationId: _verificationID,
                      smsCode: controller.text))
                  .then((value) async {
                DatabaseReference ref = FirebaseDatabase.instance
                    .ref()
                    .child('users')
                    .child(widget.phone + 'recharge');
                await ref.get().then((value) {
                  if (value.exists) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePassword(
                            phoneNumber: widget.phone,
                          ),
                        ));
                    FirebaseAuth.instance.signOut();
                  } else {
                    print('fail');
                  }
                });
              });
            } catch (e) {
              FocusScope.of(context).unfocus();
              print(e);
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'verify',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    )));
  }
}
