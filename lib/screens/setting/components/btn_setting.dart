import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/screens/detail/components/icon_with_info.dart';

class ButtonSetting extends StatelessWidget {
  const ButtonSetting({
    required Key? key,
    required this.size,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final String icon;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
          margin: EdgeInsets.only(
            top: Dimens.kDefaultPadding,
            left: Dimens.kDefaultPadding * 1.3,
          ),
          padding: EdgeInsets.only(right: Dimens.kDefaultPadding),
          width: size.width / 2 - Dimens.kDefaultPadding * 2,
          height: (size.width / 2 - Dimens.kDefaultPadding * 2) / 2,
          decoration: BoxDecoration(
            color: ColorConstants.kPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(Dimens.kDefaultBorderRadiusContainer),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 7,
                color: Colors.black.withOpacity(0.2),
              )
            ],
          ),
          child: InfoGiasu(size, icon: icon, info: title)),
    );
  }
}
