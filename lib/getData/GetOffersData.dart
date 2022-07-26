import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recharge/models/Offers.dart';

void grameenOffers() async {
  var data = await FirebaseFirestore.instance.collection('grameenOffers').get();
  OffersList.grameenOffers =
      List.from(data.docs.map((e) => Offers.fromSnapshot(e)));
  //print(OffersList.grameenOffers.first.offerName);
}

void banglaLinkOffers() async {
  var data = await FirebaseFirestore.instance.collection('banglaLink').get();
  OffersList.banglaLinkOffers =
      List.from(data.docs.map((e) => Offers.fromSnapshot(e)));
  //print(OffersList.banglaLinkOffers.first.offerName);
}

void airtelOffers() async {
  var data = await FirebaseFirestore.instance.collection('airtelOffers').get();
  OffersList.airtelOffers =
      List.from(data.docs.map((e) => Offers.fromSnapshot(e)));
  //print(OffersList.airtelOffers.first.offerName);
}

void robiOffers() async {
  var data = await FirebaseFirestore.instance.collection('robiOffers').get();
  OffersList.robiOffers =
      List.from(data.docs.map((e) => Offers.fromSnapshot(e)));
  //print(OffersList.robiOffers.first.offerName);
}

void skittoOffers() async {
  var data = await FirebaseFirestore.instance.collection('skittoOffers').get();
  OffersList.skittoOffers =
      List.from(data.docs.map((e) => Offers.fromSnapshot(e)));
  //print(OffersList.skittoOffers.first.offerName);
}

void teleOffers() async {
  var data = await FirebaseFirestore.instance.collection('teleOffers').get();
  OffersList.teleOffers =
      List.from(data.docs.map((e) => Offers.fromSnapshot(e)));
  //print(OffersList.teleOffers.first.offerName);
}
