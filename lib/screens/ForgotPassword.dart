import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:recharge/screens/OtpVerification.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController phoneNumber = TextEditingController();
  String countryCode = '+880';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/forgotpassword.jpg',
                height: 300,
                width: 300,
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
                    borderSide: BorderSide(color: Colors.blue, width: 0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtpVerification(
                                phone: countryCode + phoneNumber.text,
                              )));
                }
              },
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
