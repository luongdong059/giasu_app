import 'package:flutter/material.dart';
import 'package:giasu_app/components/widgets/button_send_widget.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/screens/detail/baidang_detail.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

class BaiDangItem extends StatelessWidget {
  final String nameclass;
  final String calendar;
  final String address;
  final String price;
  final Function press;
  final Function pressSend;
  final String sum;
  const BaiDangItem({
    Key? key,
    required this.size,
    required this.nameclass,
    required this.calendar,
    required this.address,
    required this.price,
    required this.press,
    required this.sum,
    required this.pressSend,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Container(
        width: size.width,
        //height: 180,
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
                  price,
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
                  "Số học viên: " + sum,
                  textAlign: TextAlign.left,
                  style: StyleText.subjectStyle,
                ),
              ),
              Spacer(),
              buttonSendWidget(
                label: ButtonConstants.sendrequest,
                colorText: ColorConstants.kTextButtonColor,
                colorButton: ColorConstants.kPrimaryColor,
                onPressed: () => pressSend(),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

var check = true;
var color1 = Colors.black;

class IconBtn extends StatefulWidget {
  const IconBtn({Key? key}) : super(key: key);

  @override
  _IconBtnState createState() => _IconBtnState();
}

class _IconBtnState extends State<IconBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30),
      child: IconButton(
        icon: Icon(Icons.bookmark),
        tooltip: 'Lưu',
        onPressed: () {
          setState(() {
            if (check) {
              color1 = Colors.blue;
              check = false;
            } else {
              color1 = Colors.black;
              check = true;
            }
          });
        },
        color: color1,
      ),
    );
  }
}
