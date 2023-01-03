import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';

Container HeaderWithImage(String image) {
  return Container(
    height: 140,
    child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            right: Dimens.kDefaultPadding,
            left: Dimens.kDefaultPadding,
            bottom: Dimens.kDefaultPadding,
          ),
          decoration: BoxDecoration(
            color: ColorConstants.kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimens.kDefaultBorderRadiusHeader),
              bottomRight: Radius.circular(Dimens.kDefaultBorderRadiusHeader),
            ),
          ),
          height: 80,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    image,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
