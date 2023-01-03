import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/constants/constants.dart';

Widget Detail(Size size, {@required icon, @required info, @required detail}) {
  return Padding(
    padding: EdgeInsets.all(Dimens.kDefaultPadding),
    child: Column(
      children: [
        Row(
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
              info,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorConstants.kTextButtonColor,
                fontSize: 17,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                detail,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorConstants.kTextButtonColor,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget Details(Size size, {@required icon, @required info, @required detail}) {
  return Padding(
    padding: EdgeInsets.all(Dimens.kDefaultPadding),
    child: Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  right: Dimens.kDefaultPadding / 2,
                ),
                child: SvgPicture.asset(
                  icon,
                  width:
                      ((size.width / 2 - Dimens.kDefaultPadding * 2) / 2) / 2,
                ),
              ),
              Expanded(
                child: Text(
                  info + detail,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ColorConstants.kTextButtonColor,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
