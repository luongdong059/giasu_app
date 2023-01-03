import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';

Widget buttonSendWidget(
    {@required label,
    @required colorText,
    @required colorButton,
    @required onPressed}) {
  return Container(
    padding: EdgeInsets.only(right: 15),
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: colorText),
      ),
      // color: colorButton,
      // shape: RoundedRectangleBorder(
      //     borderRadius:
      //         BorderRadius.circular(Dimens.kDefaultBorderRadiusButton)),
    ),
  );
}
