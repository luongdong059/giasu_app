import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/constants/text_constants.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(TitleConstants.privacyTitle),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            height: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              left: Dimens.kDefaultPadding, top: Dimens.kDefaultPadding),
          width: size.width - Dimens.kDefaultPadding * 2,
          child: Text(
            TextString.privacy,
            style: TextStyle(
              fontSize: 20,
              color: ColorConstants.kTextColor,
              fontFamily: "Arial",
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
