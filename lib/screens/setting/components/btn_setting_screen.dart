import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';

class ButtonSettingScreen extends StatelessWidget {
  const ButtonSettingScreen({
    Key? key,
    required this.size,
    required this.title,
    required this.press,
    required this.colorbtn,
    required this.colortext,
  }) : super(key: key);

  final Size size;
  final String title;
  final Function press;
  final Color colorbtn;
  final Color colortext;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: size.width - Dimens.kDefaultPadding * 4,
        child: ElevatedButton(
          onPressed: () => press(),
          child: Text(
            title,
            style: TextStyle(color: colortext, fontSize: 18),
          ),
          // color: colorbtn,
          // shape: RoundedRectangleBorder(
          //     borderRadius:
          //         BorderRadius.circular(Dimens.kDefaultBorderRadiusButton)),
        ),
      ),
    );
  }
}
