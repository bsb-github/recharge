import 'package:flutter/material.dart';
import 'package:recharge/screens/BankTransfer.dart';
import 'package:recharge/screens/DriveOffer.dart';
import 'package:recharge/screens/History.dart';
import 'package:recharge/screens/Profile.dart';
import 'package:recharge/screens/RechargeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/TopBar.dart';
import '../widgets/homeWidgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            TopBar(),
            Container(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DriveOffer(),
                                      ),
                                    );
                                  },
                                  child: HomeWidgets(
                                    ImagePath: 'assets/images/discount.png',
                                    title: AppLocalizations.of(context)!
                                        .driveOffer,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BankTransfer(
                                                  phoneNumber: '',
                                                  ammount: '',
                                                  OfferName: '',
                                                  OfferOriginalPrice: '',
                                                  OfferPrice: '',
                                                  duration: '',
                                                )));
                                  },
                                  child: HomeWidgets(
                                    ImagePath: 'assets/images/transfer.png',
                                    title: 'Send Money',
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Recharge()));
                                  },
                                  child: HomeWidgets(
                                    ImagePath: 'assets/images/recharge.png',
                                    title:
                                        AppLocalizations.of(context)!.recharge,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HistoryTracker()));
                                  },
                                  child: HomeWidgets(
                                    ImagePath: 'assets/images/history.png',
                                    title:
                                        AppLocalizations.of(context)!.history,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                HomeWidgets(
                                  ImagePath: 'assets/images/timetable.png',
                                  title: 'TimeTable',
                                ),
                                HomeWidgets(
                                  ImagePath: 'assets/images/timetable.png',
                                  title: 'TimeTable',
                                ),
                                HomeWidgets(
                                  ImagePath: 'assets/images/timetable.png',
                                  title: 'TimeTable',
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile()));
                                  },
                                  child: HomeWidgets(
                                    ImagePath: 'assets/images/profile.png',
                                    title:
                                        AppLocalizations.of(context)!.profile,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
