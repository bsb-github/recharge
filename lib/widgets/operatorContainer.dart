import 'package:flutter/material.dart';

class OperatorContainer extends StatelessWidget {
  final String bankName;
  final bool isSelected;
  const OperatorContainer(
      {Key? key, required this.bankName, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border:
                isSelected ? Border.all(color: Colors.blue, width: 2) : null,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Container(child: Image.asset(bankName)),
          ),
        ),
      ),
    );
  }
}
