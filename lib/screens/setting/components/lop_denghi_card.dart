import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';

class LopDeNghi extends StatelessWidget {
  const LopDeNghi({
    Key? key,
    required this.size,
    required this.nameclass,
    required this.calendar,
    required this.address,
    required this.price,
    required this.sum,
    required this.press,
  }) : super(key: key);
  final Size size;
  final String nameclass;
  final String calendar;
  final String address;
  final String price;
  final String sum;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Container(
        width: size.width,
        height: 150,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: <Widget>[
                      Icon(
                        Icons.local_library,
                        color: ColorConstants.kPrimaryColor,
                      ),
                      Container(
                        width: size.width * 0.9 - 10,
                        margin: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          nameclass,
                          textAlign: TextAlign.left,
                          style: StyleText.nameclassStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                        color: ColorConstants.kPrimaryColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          calendar,
                          textAlign: TextAlign.left,
                          style: StyleText.subjectStyle,
                        ),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Icon(
                        Icons.location_on_outlined,
                        color: ColorConstants.kPrimaryColor,
                      ),
                      Container(
                        width: size.width * 0.9 - 10,
                        margin: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          address,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                          price + " VNĐ",
                          textAlign: TextAlign.left,
                          style: StyleText.priceStyle,
                        ),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Icon(
                        Icons.filter_9_plus,
                        color: ColorConstants.kPrimaryColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          "Số lượng học viên: $sum",
                          textAlign: TextAlign.left,
                          style: StyleText.subjectStyle,
                        ),
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
