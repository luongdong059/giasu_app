import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/constants/constants.dart';

Row HeaderComment(Size size, {@required icon, @required title}) {
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
      Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: ColorConstants.kTextButtonColor,
          fontSize: 17,
        ),
      ),
    ],
  );
}
