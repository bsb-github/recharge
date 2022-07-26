import 'package:flutter/material.dart';

class PaymentConfirmation extends StatelessWidget {
  final String operatorLogo;
  const PaymentConfirmation({Key? key, required this.operatorLogo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController amount = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            operatorLogo,
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: amount,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.monetization_on),
                hintText: 'Amount to recharge',
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
        ],
      )),
    );
  }
}
