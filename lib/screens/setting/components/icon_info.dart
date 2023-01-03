import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/constants/constants.dart';

class Info extends StatelessWidget {
  const Info({
    Key? key,
    required this.size,
    required this.title,
    required this.detail,
    required this.icon,
  }) : super(key: key);
  final Size size;
  final String title, detail, icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimens.kDefaultPadding, top: Dimens.kDefaultPadding / 2),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(
              right: Dimens.kDefaultPadding / 2,
            ),
            child: SvgPicture.asset(
              icon,
              width: ((size.width / 2 - Dimens.kDefaultPadding * 2) / 2) / 2,
            ),
          ),
          Expanded(
            child: Text(
              title + detail,
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
    );
  }
}
