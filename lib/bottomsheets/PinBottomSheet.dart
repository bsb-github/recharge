import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recharge/screens/HomeScreen.dart';

class PinBottomSheet extends StatelessWidget {
  final String phone;
  const PinBottomSheet({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController pin = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Add Your Pin',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: pin,
                obscureText: true,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your pin';
                  }
                  return null;
                },
                maxLength: 4,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.pin),
                  hintText: 'Pin Number',
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
            GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await FirebaseDatabase.instance
                      .ref()
                      .child('users')
                      .child(phone + 'recharge')
                      .update({"pin": pin.text});
                  Get.snackbar(
                    'Pin Added',
                    'Please dont share this pin with others',
                    colorText: Colors.white,
                    backgroundColor: Colors.green,
                    snackPosition: SnackPosition.BOTTOM,
                  );

                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
