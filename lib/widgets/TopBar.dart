import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recharge/models/UserModel.dart';

class TopBar extends StatefulWidget {
  TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  bool revealBalance = false;
  bool revealCommision = false;
  File? image;
  String imgeUrl = '';
  updateImage() async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef =
          storageRef.child('images/${UserList.user.first.username}');
      await imageRef.putFile(image!).then((p0) {
        const SnackBar snackBar = SnackBar(content: Text('Image Uploaded'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }).onError((error, stackTrace) {
        const SnackBar snackBar =
            SnackBar(content: Text('Error Uploading Image'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
      imgeUrl = await imageRef.getDownloadURL();
    } on FirebaseException catch (e) {
      const SnackBar snackBar = SnackBar(content: Text('Error'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
      await updateImage();
      print(imgeUrl);
      DatabaseReference ref = FirebaseDatabase.instance
          .ref("users/${UserList.user.first.phone}recharge");
      await ref.update({
        'image': imgeUrl,
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        //  gradient: LinearGradient(colors: [Colors.purple, Colors.purpleAccent]),
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(bottom: 1),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              pickImage();
                            },
                            child: Container(
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(500),
                                    image: DecorationImage(
                                        image: UserList.user[0].imageUrl.isEmpty
                                            ? const AssetImage(
                                                'assets/images/user_icon.jpg')
                                            : NetworkImage(UserList.user.first
                                                .imageUrl) as ImageProvider,
                                        fit: BoxFit.cover),
                                    color: Colors.white),
                                child: Center()),
                          )),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: Text(
                              UserList.user.first.username,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(
                              UserList.user.first.phone,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            revealBalance = !revealBalance;
                          });
                        },
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          width: 180,
                          child: Center(
                            child: !revealBalance
                                ? Text(AppLocalizations.of(context)!
                                    .revealRechargeBalance)
                                : Text(
                                    '৳' + UserList.user.first.rechargeBalance),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            revealCommision = !revealCommision;
                          });
                        },
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          width: 180,
                          child: Container(
                            alignment: Alignment.center,
                            child: !revealCommision
                                ? Text(AppLocalizations.of(context)!
                                    .revealDriveBalance)
                                : Text('৳ ' + UserList.user.first.driveBalance),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
