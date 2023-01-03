import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giasu_app/constants/constants.dart';

Row InfoGiasu(Size size, {@required icon, @required info}) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.only(
          left: Dimens.kDefaultPadding,
          right: Dimens.kDefaultPadding / 2,
        ),
        child: SvgPicture.asset(
          icon,
          width: ((size.width / 2 - Dimens.kDefaultPadding * 2) / 2) / 2,
        ),
      ),
      Expanded(
        child: Text(
          info,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: ColorConstants.kTextButtonColor,
            fontSize: 17,
          ),
        ),
      )
    ],
  );
}
