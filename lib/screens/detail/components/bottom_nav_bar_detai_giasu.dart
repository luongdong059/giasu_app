import 'package:flutter/material.dart';
import 'package:giasu_app/components/widgets/button_send_widget.dart';
import 'package:giasu_app/constants/constants.dart';

class MyBotNavBar extends StatelessWidget {
  final String title;
  final String titleBtn;
  final Function press;
  const MyBotNavBar(
      {Key? key,
      required this.title,
      required this.press,
      required this.titleBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimens.kDefaultPadding * 2,
        right: Dimens.kDefaultPadding * 2,
        //bottom: Dimens.kDefaultPadding,
      ),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: ColorConstants.kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          Spacer(),
          buttonSendWidget(
            label: titleBtn,
            colorText: ColorConstants.kTextButtonColor,
            colorButton: ColorConstants.kPrimaryColor,
            onPressed: press,
          ),
        ],
      ),
    );
  }
}
