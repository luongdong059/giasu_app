import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';

SizedBox ButtonComment(
    Size size, String title, BuildContext context, @required onPressed) {
  return SizedBox(
    width: size.width - (Dimens.kDefaultPadding * 2),
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: ColorConstants.kTextButtonColor, fontSize: 18),
      ),
      // color: Colors.red,
      // shape: RoundedRectangleBorder(
      //     borderRadius:
      //         BorderRadius.circular(Dimens.kDefaultBorderRadiusButton)),
    ),
  );
}
