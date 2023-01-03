import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/data/api_services.dart';
import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

class DropDownKhuVuc extends StatefulWidget {
  const DropDownKhuVuc({Key? key, required this.lst}) : super(key: key);
  final List<KhuVuc> lst;

  @override
  DropDownKhuVucState createState() => DropDownKhuVucState();
}

class DropDownKhuVucState extends State<DropDownKhuVuc> {
  KhuVuc khuvuc = new KhuVuc();
  KhuVuc khuvuc1 = new KhuVuc(
      khuvucId: 1,
      tenkhuvuc: "Ấp Tân Ngãi (Bến Tre)",
      tungdo: 10.23333,
      vido: 106.28333);
  KhuVuc get getKhuVuc => khuvuc1;

  void _selectedTab(KhuVuc newValue, int index) {
    switch (index) {
      case 1:
        setState(() {
          khuvuc = newValue;
          khuvuc1 = newValue;
        });
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    khuvuc = widget.lst[0];
    return Consumer<LopModel>(builder: (_, snapshot, __) {
      if (snapshot.lstKhuVuc.length > 0) {
        return DropDownCard(khuvuc, widget.lst, 1, ButtonConstants.titleTinh);
      } else {
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }

  Stack DropDownCard(
      KhuVuc value1, List<KhuVuc> data, int index, String title) {
    return Stack(children: <Widget>[
      Card(
        elevation: 1,
        margin: EdgeInsets.only(
            left: Dimens.kDefaultPadding,
            right: Dimens.kDefaultPadding,
            top: Dimens.kDefaultPadding),
        color: ColorConstants.kPrimaryColor,
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          trailing: DropdownButtonHideUnderline(
              child: DropdownButton(
            dropdownColor: ColorConstants.kPrimaryColor,
            isExpanded: false,
            value: value1,
            onChanged: (dynamic value) {
              _selectedTab(value, 1);
            },
            items: data
                .map(
                  (KhuVuc user) => DropdownMenuItem<KhuVuc>(
                    child: Text(user.tenkhuvuc.toString(),
                        style: TextStyle(color: Colors.white)),
                    value: user,
                  ),
                )
                .toList(),
            style: TextStyle(
                color: Colors.white,
                decorationColor: ColorConstants.kTextButtonColor),
          )),
        ),
      ),
      Positioned(
        top: Dimens.kDefaultPadding,
        left: Dimens.kDefaultPadding,
        right: Dimens.kDefaultPadding * 3,
        bottom: 0,
        child: Container(
            decoration: BoxDecoration(
                color: ColorConstants.kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimens.kDefaultBorderRadiusContainer),
                )),
            padding: EdgeInsets.only(
                top: Dimens.kDefaultPadding, left: Dimens.kDefaultPadding),
            width: 100,
            height: 40,
            child: Text(khuvuc1.tenkhuvuc.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17))),
      ),
    ]);
  }
}
