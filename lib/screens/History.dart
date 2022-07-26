import 'package:flutter/material.dart';
import 'package:recharge/widgets/HistoryCard.dart';
import 'package:recharge/widgets/TopBar.dart';

class HistoryTracker extends StatefulWidget {
  HistoryTracker({Key? key}) : super(key: key);

  @override
  State<HistoryTracker> createState() => _HistoryTrackerState();
}

class _HistoryTrackerState extends State<HistoryTracker> {
  bool isDaily = true;
  bool isMonthly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            TopBar(),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDaily = !isDaily;
                          isMonthly = !isMonthly;
                        });
                      },
                      child: Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: isDaily ? Colors.blue : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Daily',
                            style: TextStyle(
                              color: !isDaily ? Colors.blue : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDaily = !isDaily;
                          isMonthly = !isMonthly;
                        });
                      },
                      child: Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: isMonthly ? Colors.blue : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Monthly',
                            style: TextStyle(
                              color: !isMonthly ? Colors.blue : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            HistoryCard()
          ],
        ),
      ),
    );
  }
}
