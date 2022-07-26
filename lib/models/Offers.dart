import 'package:cloud_firestore/cloud_firestore.dart';

class OffersList {
  static List<Offers> grameenOffers = [];
  static List<Offers> banglaLinkOffers = [];
  static List<Offers> robiOffers = [];
  static List<Offers> skittoOffers = [];
  static List<Offers> airtelOffers = [];
  static List<Offers> teleOffers = [];
}

class Offers {
  final String offerName;
  final String offerPrice;
  final String offerOriginalPrice;
  final String duration;

  Offers({
    required this.offerName,
    required this.offerPrice,
    required this.offerOriginalPrice,
    required this.duration,
  });

  static Offers fromSnapshot(DocumentSnapshot snapshot) {
    return Offers(
      offerName: snapshot['offerName'] ?? '',
      offerPrice: snapshot['offerPrice'] ?? '',
      offerOriginalPrice: snapshot['OfferOriginalPrice'] ?? '',
      duration: snapshot['duration'] ?? '',
    );
  }
}
