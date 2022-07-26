import 'package:flutter/material.dart';
import 'package:recharge/models/UserModel.dart';

import '../widgets/packageInfo.dart';
import 'Offers.dart';

Widget showOffers(
    {required bool isfSelected,
    required bool issSelected,
    required bool istSelected,
    required bool isfoSelected,
    required bool isfiSelected,
    required bool issxSelected,
    required String type,
    required String phone}) {
  if (isfSelected) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: OffersList.grameenOffers.length,
        itemBuilder: (context, index) {
          var data = OffersList.grameenOffers[index];
          return PkgInfo(
            type: type,
            OfferName: data.offerName,
            OfferOriginalPrice: data.offerOriginalPrice,
            OfferPrice: data.offerPrice,
            duration: data.duration,
            phoneNumber: phone,
          );
        });
  } else if (issSelected) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: OffersList.teleOffers.length,
        itemBuilder: (context, index) {
          var data = OffersList.teleOffers[index];
          return PkgInfo(
            type: type,
            OfferName: data.offerName,
            OfferOriginalPrice: data.offerOriginalPrice,
            OfferPrice: data.offerPrice,
            duration: data.duration,
            phoneNumber: phone,
          );
        });
  } else if (istSelected) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: OffersList.robiOffers.length,
        itemBuilder: (context, index) {
          var data = OffersList.robiOffers[index];
          return PkgInfo(
            type: type,
            OfferName: data.offerName,
            OfferOriginalPrice: data.offerOriginalPrice,
            OfferPrice: data.offerPrice,
            duration: data.duration,
            phoneNumber: phone,
          );
        });
  } else if (isfoSelected) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: OffersList.banglaLinkOffers.length,
        itemBuilder: (context, index) {
          var data = OffersList.banglaLinkOffers[index];
          return PkgInfo(
            type: type,
            OfferName: data.offerName,
            OfferOriginalPrice: data.offerOriginalPrice,
            OfferPrice: data.offerPrice,
            duration: data.duration,
            phoneNumber: phone,
          );
        });
  } else if (isfiSelected) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: OffersList.airtelOffers.length,
        itemBuilder: (context, index) {
          var data = OffersList.airtelOffers[index];
          return PkgInfo(
            type: type,
            OfferName: data.offerName,
            OfferOriginalPrice: data.offerOriginalPrice,
            OfferPrice: data.offerPrice,
            duration: data.duration,
            phoneNumber: phone,
          );
        });
  } else if (issxSelected) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: OffersList.skittoOffers.length,
        itemBuilder: (context, index) {
          var data = OffersList.skittoOffers[index];
          return PkgInfo(
            type: type,
            OfferName: data.offerName,
            OfferOriginalPrice: data.offerOriginalPrice,
            OfferPrice: data.offerPrice,
            duration: data.duration,
            phoneNumber: phone,
          );
        });
  } else {
    return Container();
  }
}
