import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/data/api_services.dart';
import 'package:giasu_app/models/chude.dart';
import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

class DropDownChuDe extends StatefulWidget {
  const DropDownChuDe({Key? key, required this.lst}) : super(key: key);
  final List<ChuDe> lst;

  @override
  DropDownChuDeState createState() => DropDownChuDeState();
}

class DropDownChuDeState extends State<DropDownChuDe> {
  ChuDe chude = new ChuDe();
  ChuDe chude1 = new ChuDe(chudeId: 1, nhomchudeId: 1, tenchude: "Toán");
  ChuDe get getChuDe => chude1;

  void _selectedTab(ChuDe newValue, int index) {
    switch (index) {
      case 1:
        setState(() {
          chude = newValue;
          chude1 = newValue;
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
    chude = widget.lst[0];
    return Consumer<LopModel>(builder: (_, snapshot, __) {
      if (snapshot.lstChuDe.length > 0) {
        return DropDownCard(chude, widget.lst, 1);
      } else {
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }

  Stack DropDownCard(ChuDe value1, List<ChuDe> data, int index) {
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
                  (ChuDe user) => DropdownMenuItem<ChuDe>(
                    child: Text(user.tenchude.toString(),
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
            child: Text(chude1.tenchude.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17))),
      ),
    ]);
  }
}
