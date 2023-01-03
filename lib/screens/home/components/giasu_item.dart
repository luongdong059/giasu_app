import 'package:flutter/material.dart';
import 'package:giasu_app/components/widgets/button_send_widget.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/screens/home/components/save_item.dart';

class GiaSuItem extends StatelessWidget {
  final String url;
  final String name;
  final String gender;
  final String address;
  final String price;
  final Function press;
  final Function pressSend;
  const GiaSuItem({
    Key? key,
    required this.url,
    required this.size,
    required this.name,
    required this.gender,
    required this.address,
    required this.price,
    required this.press,
    required this.pressSend,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Container(
        width: size.width,
        // height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimens.kDefaultBorderRadiusItem),
            bottomRight: Radius.circular(Dimens.kDefaultBorderRadiusItem),
            topLeft: Radius.circular(Dimens.kDefaultBorderRadiusItem),
            topRight: Radius.circular(Dimens.kDefaultBorderRadiusItem),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 7,
              color: Colors.black.withOpacity(0.2),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: Dimens.kDefaultPadding * 0.5,
                    top: Dimens.kDefaultPadding * 0.3,
                    bottom: Dimens.kDefaultPadding * 0.3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.network(
                          url.length > 0 ? url : TextString.imageDefaut,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        textAlign: TextAlign.left,
                        style: StyleText.nameStyle,
                      ),
                      Row(children: <Widget>[
                        Icon(
                          Icons.people_alt,
                          color: ColorConstants.kPrimaryColor,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 5,
                          ),
                          child: Text(
                            gender,
                            textAlign: TextAlign.left,
                            style: StyleText.subjectStyle,
                          ),
                        ),
                      ]),
                      Row(children: <Widget>[
                        Icon(
                          Icons.location_city,
                          color: ColorConstants.kPrimaryColor,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 5,
                          ),
                          width: size.width / 2,
                          child: Text(
                            address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: StyleText.subjectStyle,
                          ),
                        ),
                      ]),
                      Row(children: <Widget>[
                        Icon(
                          Icons.price_check,
                          color: ColorConstants.kPrimaryColor,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 5,
                          ),
                          child: Text(
                            price,
                            textAlign: TextAlign.left,
                            style: StyleText.priceStyle,
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
            // Row(children: <Widget>[
            //   Spacer(),
            //   buttonSendWidget(
            //     label: ButtonConstants.send,
            //     colorText: ColorConstants.kTextButtonColor,
            //     colorButton: ColorConstants.kPrimaryColor,
            //     onPressed: () => pressSend(),
            //   ),
            // ])
          ],
        ),
      ),
    );
  }
}
