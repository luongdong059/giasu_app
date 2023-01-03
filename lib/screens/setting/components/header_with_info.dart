import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';

class HeaderWithInfo extends StatelessWidget {
  final url;
  const HeaderWithInfo({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: EdgeInsets.only(bottom: Dimens.kDefaultPadding * 0.5),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              right: Dimens.kDefaultPadding,
              left: Dimens.kDefaultPadding,
              bottom: Dimens.kDefaultPadding,
            ),
            decoration: BoxDecoration(
              color: ColorConstants.kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimens.kDefaultBorderRadiusHeader),
                bottomRight: Radius.circular(Dimens.kDefaultBorderRadiusHeader),
              ),
            ),
            height: 80,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: Image.network(
                      url,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
