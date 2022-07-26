import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recharge/provider/locale_provider.dart';
import 'package:recharge/widgets/TopBar.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool english = true;
  bool bangali = false;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TopBar(),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.bottomRight,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    if (english) {
                      setState(() {
                        bangali = true;
                        english = false;
                      });
                    } else {
                      setState(() {
                        bangali = false;
                        english = true;
                      });
                    }
                    LocaleProvider p = LocaleProvider();
                    p.setLocale(const Locale('en'));
                  },
                  child: Container(
                    width: 100,
                    child: Center(
                      child: Text(
                        'English',
                        style: TextStyle(
                            color: english ? Colors.white : Colors.blue),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: english ? Colors.blue : Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if (bangali) {
                      setState(() {
                        bangali = false;
                        english = true;
                      });
                    } else {
                      setState(() {
                        bangali = true;
                        english = false;
                      });
                    }
                    final p =
                        Provider.of<LocaleProvider>(context, listen: false);
                    p.setLocale(const Locale('bn'));
                  },
                  child: Container(
                    width: 100,
                    child: Center(
                      child: Text(
                        'বাঙালি',
                        style: TextStyle(
                            color: bangali ? Colors.white : Colors.blue),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: bangali ? Colors.blue : Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
