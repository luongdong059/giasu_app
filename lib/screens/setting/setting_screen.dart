import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/components/help_add_point.dart';
import 'package:giasu_app/components/help_setting.dart';
import 'package:giasu_app/components/privacy.dart';
import 'package:giasu_app/components/send_teach.dart';
import 'package:giasu_app/components/update_info.dart';
import 'package:giasu_app/components/update_pass.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/screens/home/components/baidang_item.dart';
import 'package:giasu_app/screens/setting/components/header_with_info.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

import 'components/btn_setting.dart';
import 'components/btn_setting_screen.dart';
import 'components/icon_info.dart';
import 'components/log_out_btn.dart';
import 'components/lop_denghi_card.dart';
import 'components/lop_detail.dart';
import 'components/web_view.dart';

class SettingScreen extends StatefulWidget {
  final GiaSu gs;
  final HocVien hv;
  final bool checks;
  const SettingScreen(
      {Key? key, required this.gs, required this.hv, required this.checks})
      : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool visibility1 = false;
  bool visibility2 = false;
  bool visibility3 = false;
  bool visibility4 = false;
  bool visibility5 = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "1") {
        visibility1 = visibility;
      }
      if (field == "2") {
        visibility2 = visibility;
      }
      if (field == "3") {
        visibility3 = visibility;
      }
      if (field == "4") {
        visibility4 = visibility;
      }
      if (field == "5") {
        visibility5 = visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: widget.checks
          ? DetailHV(
              size,
              context,
              widget.hv,
            )
          : DetailGS(
              size,
              context,
              widget.gs,
            ),
    ));
  }

  Column DetailGS(Size size, BuildContext context, GiaSu gs) {
    var _lop = Provider.of<LopModel>(context, listen: false);
    _lop.getListLopDeNghi(int.parse(gs.giasuId.toString()), "1");
    _lop.getListLopDeNghi(int.parse(gs.giasuId.toString()), "0");
    return Column(
      children: <Widget>[
        HeaderWithInfo(
          url: widget.gs.url!.length > 0
              ? widget.gs.url.toString()
              : TextString.imageDefaut,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  widget.gs.hoten.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorConstants.kTextColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "( Gia sư )",
                  style: TextStyle(
                      fontSize: 18,
                      color: ColorConstants.kPrimaryColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonSetting(
                size: size,
                icon: "assets/icons/user-info.svg",
                title: ButtonConstants.info,
                key: null,
                onPressed: () => visibility1 ? null : _changed(true, "1")),
            ButtonSetting(
                size: size,
                icon: "assets/icons/document.svg",
                title: ButtonConstants.require,
                key: null,
                onPressed: () => visibility2 ? null : _changed(true, "2")),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonSetting(
              size: size,
              icon: "assets/icons/heart.svg",
              title: ButtonConstants.saveclass,
              key: null,
              onPressed: () =>
                  // {visibility3 ? null : _changed(true, "3")}
                  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewExample(),
                ),
              ),
            ),
            ButtonSetting(
              size: size,
              icon: "assets/icons/setting.svg",
              title: ButtonConstants.setting,
              key: null,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpSetting(),
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonSetting(
                size: size,
                icon: "assets/icons/coin.svg",
                title: ButtonConstants.point,
                key: null,
                onPressed: () => visibility5 ? null : _changed(true, "5")),
            ButtonSetting(
              size: size,
              icon: "assets/icons/privacy.svg",
              title: ButtonConstants.privacy,
              key: null,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Privacy(),
                ),
              ),
            ),
          ],
        ),
        new Container(
          //margin: new EdgeInsets.only(left: 16.0, right: 16.0),
          child: new Column(
            children: <Widget>[
              visibility1
                  ? new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - Dimens.kDefaultPadding * 2,
                          //height: size.width / 2,
                          decoration: BoxDecoration(
                            color: ColorConstants.kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Dimens.kDefaultBorderRadiusContainer),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                color: Colors.black.withOpacity(0.2),
                              )
                            ],
                          ),

                          child: Padding(
                            padding: EdgeInsets.only(
                              // left: Dimens.kDefaultPadding,
                              // right: Dimens.kDefaultPadding,
                              bottom: Dimens.kDefaultPadding,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    new IconButton(
                                      color: Colors.grey[400],
                                      icon: const Icon(
                                        Icons.cancel,
                                        size: 22.0,
                                      ),
                                      onPressed: () {
                                        _changed(false, "1");
                                      },
                                    ),
                                  ],
                                ),
                                Info(
                                  icon: "assets/icons/coin.svg",
                                  title: "Số Point: ",
                                  detail: widget.gs.pointGs.toString(),
                                  size: size,
                                ),
                                Info(
                                  icon: "assets/icons/timer.svg",
                                  title: "Thời gian dạy: ",
                                  detail: widget.gs.thoigianday.toString(),
                                  size: size,
                                ),
                                Info(
                                  icon: "assets/icons/cost.svg",
                                  title: "Học phí: ",
                                  detail: widget.gs.hocphi.toString() + " VNĐ",
                                  size: size,
                                ),
                                SizedBox(height: size.height * 0.02),
                                ButtonSettingScreen(
                                  size: size,
                                  title: "Cập nhật tài khoản",
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateInfo(
                                              check: widget.checks,
                                              giasus: widget.gs,
                                              hocviens: hv)),
                                    );
                                  },
                                  colorbtn: Colors.black,
                                  colortext: Colors.white,
                                ),
                                ButtonSettingScreen(
                                  size: size,
                                  title: "Đổi mật khẩu",
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdatePass(check: widget.checks)),
                                    );
                                  },
                                  colorbtn: Colors.white,
                                  colortext: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : new Container(),
              //////
              visibility2
                  ? new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding,
                          ),
                          width: size.width,
                          //height: size.width / 2,
                          decoration: BoxDecoration(
                            color: ColorConstants.kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Dimens.kDefaultBorderRadiusContainer),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                color: Colors.black.withOpacity(0.2),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              // left: Dimens.kDefaultPadding,
                              // right: Dimens.kDefaultPadding,
                              bottom: Dimens.kDefaultPadding,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    new IconButton(
                                      color: Colors.grey[400],
                                      icon: const Icon(
                                        Icons.cancel,
                                        size: 22.0,
                                      ),
                                      onPressed: () {
                                        _changed(false, "2");
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  "Lớp đã xác nhận",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.amberAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      height: size.height / 4,
                                      child: Consumer<LopModel>(
                                        builder: (_, snapshot, __) {
                                          if (snapshot.lstLop.length <= 0)
                                            return Container(
                                              child: Center(
                                                  child: Text(
                                                "Dữ liệu rỗng",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              )),
                                            );
                                          List<Lop>? lopList = snapshot.lstLop;
                                          return ListView.builder(
                                            itemCount: lopList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              Lop lop = lopList[index];
                                              return Card(
                                                child: LopDeNghi(
                                                    size: size,
                                                    address:
                                                        lop.diadiem.toString(),
                                                    nameclass:
                                                        lop.tenlop.toString(),
                                                    calendar: lop.thoigianhoc
                                                        .toString(),
                                                    price: lop.hocphidenghi
                                                        .toString(),
                                                    sum: lop.sohocvien
                                                        .toString(),
                                                    press: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LopDetail(
                                                                      lop: lop,
                                                                      check:
                                                                          true)),
                                                        )),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Lớp đang chờ dạy",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.amberAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      height: size.height / 4,
                                      child: Consumer<LopModel>(
                                        builder: (_, snapshot, __) {
                                          if (snapshot.lstLop1.length <= 0)
                                            return Container(
                                              child: Center(
                                                  child: Text(
                                                "Dữ liệu rỗng",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              )),
                                            );
                                          List<Lop>? lopList = snapshot.lstLop1;
                                          return ListView.builder(
                                            itemCount: lopList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              Lop lop = lopList[index];
                                              return Card(
                                                child: LopDeNghi(
                                                    size: size,
                                                    address:
                                                        lop.diadiem.toString(),
                                                    nameclass:
                                                        lop.tenlop.toString(),
                                                    calendar: lop.thoigianhoc
                                                        .toString(),
                                                    price: lop.hocphidenghi
                                                        .toString(),
                                                    sum: lop.sohocvien
                                                        .toString(),
                                                    press: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LopDetail(
                                                                      lop: lop,
                                                                      check:
                                                                          false)),
                                                        )),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : new Container(),
              //////
              visibility3
                  ? new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding,
                          ),
                          width: size.width,
                          //height: size.width / 2,
                          decoration: BoxDecoration(
                            color: ColorConstants.kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Dimens.kDefaultBorderRadiusContainer),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                color: Colors.black.withOpacity(0.2),
                              )
                            ],
                          ),

                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: Dimens.kDefaultPadding,
                            ),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  new IconButton(
                                    color: Colors.grey[400],
                                    icon: const Icon(
                                      Icons.cancel,
                                      size: 22.0,
                                    ),
                                    onPressed: () {
                                      _changed(false, "3");
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: size.width,
                                    height: size.height / 2,
                                    child: ListView.builder(
                                      //shrinkWrap: false,
                                      itemBuilder: (ctx, int) {
                                        return Card(
                                          // child: GiaSuItem(
                                          //     size: size,
                                          //     address: "Hồ Chí Minh",
                                          //     name: "Nguyễn Lương Đông",
                                          //     price: "200000",
                                          //     subject: "Toán, Lý, Hoá",
                                          //     url:
                                          //         "https://tailieu24h.vn/upload/cdn/images/famous%20people%20band%208%20ielts%20wrting.jpeg",
                                          //     press: () {}),

                                          child: BaiDangItem(
                                            size: size,
                                            address:
                                                "Hồ Chí MinhHồ Chí MinhHồ Chí MinhHồ Chí MinhHồ Chí MinhHồ Chí Minh",
                                            nameclass:
                                                "Lớp ôn luyện toán lys hoa van sua dia gdcd anh",
                                            calendar: "11-10-2021",
                                            price: "200000",
                                            sum: "10",
                                            press: () {},
                                            pressSend: () {},
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                      ],
                    )
                  : new Container(),
              /////
              visibility4
                  ? new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          //height: size.width / 2,
                          decoration: BoxDecoration(
                            color: ColorConstants.kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Dimens.kDefaultBorderRadiusContainer),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                color: Colors.black.withOpacity(0.2),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Dimens.kDefaultPadding,
                              right: Dimens.kDefaultPadding,
                              bottom: Dimens.kDefaultPadding,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                new IconButton(
                                  color: Colors.grey[400],
                                  icon: const Icon(
                                    Icons.cancel,
                                    size: 22.0,
                                  ),
                                  onPressed: () {
                                    _changed(false, "4");
                                  },
                                ),
                                SizedBox(
                                  //height: size.width / 3 - 50,
                                  child: TextField(
                                    onChanged: (value) {},
                                    onTap: () {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);

                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                    },
                                    style: TextStyle(
                                        color: ColorConstants.kTextButtonColor),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 2,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorConstants
                                                  .kTextButtonColor,
                                              width: 2.0)),
                                      hintText: HintConstants.nameclass,
                                      hintStyle: TextStyle(
                                          color:
                                              ColorConstants.kTextButtonColor),
                                    ),
                                    //controller: TextEditingController(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : new Container(),
              //////
              visibility5
                  ? new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - Dimens.kDefaultPadding * 2,
                          //height: size.width / 2,
                          decoration: BoxDecoration(
                            color: ColorConstants.kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Dimens.kDefaultBorderRadiusContainer),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                color: Colors.black.withOpacity(0.2),
                              )
                            ],
                          ),

                          child: Padding(
                            padding: EdgeInsets.only(
                              // left: Dimens.kDefaultPadding,
                              // right: Dimens.kDefaultPadding,
                              bottom: Dimens.kDefaultPadding,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    new IconButton(
                                      color: Colors.grey[400],
                                      icon: const Icon(
                                        Icons.cancel,
                                        size: 22.0,
                                      ),
                                      onPressed: () {
                                        _changed(false, "5");
                                      },
                                    ),
                                  ],
                                ),
                                Info(
                                  icon: "assets/icons/coin.svg",
                                  title: "Số Point: ",
                                  detail: widget.gs.pointGs.toString(),
                                  size: size,
                                ),
                                ButtonSettingScreen(
                                  size: size,
                                  title: ButtonConstants.help,
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HelpAddPoint()),
                                    );
                                  },
                                  colorbtn: Colors.white,
                                  colortext: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : new Container(),
            ],
          ),
        ),
        ButtonLogOut(
          size,
          ButtonConstants.logout,
          context,
          () {
            SystemNavigator.pop();
          },
        ),
        /////
      ],
    );
  }

  ///GiaSu
  Column DetailHV(Size size, BuildContext context, HocVien hv) {
    var _lop = Provider.of<LopModel>(context, listen: false);
    _lop.getListLopHocVienDeNghi(int.parse(hv.hocvienId.toString()), "1");
    _lop.getListLopHocVienDeNghi(int.parse(hv.hocvienId.toString()), "0");

    return Column(
      children: <Widget>[
        HeaderWithInfo(
          url: widget.hv.url!.length > 0
              ? widget.hv.url.toString()
              : TextString.imageDefaut,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  widget.hv.hoten.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorConstants.kTextColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "( Học viên )",
                  style: TextStyle(
                      fontSize: 18,
                      color: ColorConstants.kPrimaryColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonSetting(
                size: size,
                icon: "assets/icons/user-info.svg",
                title: ButtonConstants.info,
                key: null,
                onPressed: () => visibility1 ? null : _changed(true, "1")),
            ButtonSetting(
                size: size,
                icon: "assets/icons/document.svg",
                title: ButtonConstants.classSuccess,
                key: null,
                onPressed: () => visibility2 ? null : _changed(true, "2")),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonSetting(
              size: size,
              icon: "assets/icons/heart.svg",
              title: ButtonConstants.saveclass,
              key: null,
              onPressed: () =>
                  // {visibility3 ? null : _changed(true, "3")}
                  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewExample(),
                ),
              ),
            ),
            ButtonSetting(
              size: size,
              icon: "assets/icons/setting.svg",
              title: ButtonConstants.setting,
              key: null,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpSetting(),
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonSetting(
                size: size,
                icon: "assets/icons/teach.svg",
                title: ButtonConstants.classFaild,
                key: null,
                onPressed: () => visibility5 ? null : _changed(true, "5")),
            ButtonSetting(
              size: size,
              icon: "assets/icons/privacy.svg",
              title: ButtonConstants.privacy,
              key: null,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Privacy(),
                ),
              ),
            ),
          ],
        ),
        new Container(
          //margin: new EdgeInsets.only(left: 16.0, right: 16.0),
          child: new Column(
            children: <Widget>[
              visibility1
                  ? new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - Dimens.kDefaultPadding * 2,
                          //height: size.width / 2,
                          decoration: BoxDecoration(
                            color: ColorConstants.kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Dimens.kDefaultBorderRadiusContainer),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                color: Colors.black.withOpacity(0.2),
                              )
                            ],
                          ),

                          child: Padding(
                            padding: EdgeInsets.only(
                              // left: Dimens.kDefaultPadding,
                              // right: Dimens.kDefaultPadding,
                              bottom: Dimens.kDefaultPadding,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    new IconButton(
                                      color: Colors.grey[400],
                                      icon: const Icon(
                                        Icons.cancel,
                                        size: 22.0,
                                      ),
                                      onPressed: () {
                                        _changed(false, "1");
                                      },
                                    ),
                                  ],
                                ),
                                Info(
                                  icon: "assets/icons/user-info.svg",
                                  title: "Họ tên: ",
                                  detail: widget.hv.hoten.toString(),
                                  size: size,
                                ),
                                Info(
                                  icon: "assets/icons/info.svg",
                                  title: "Số điện thoại: ",
                                  detail: widget.hv.sdt.toString(),
                                  size: size,
                                ),
                                Info(
                                  icon: "assets/icons/map.svg",
                                  title: "Địa chỉ: ",
                                  detail: widget.hv.diachi.toString(),
                                  size: size,
                                ),
                                Info(
                                  icon: "assets/icons/document.svg",
                                  title: "Email: ",
                                  detail: widget.hv.email.toString(),
                                  size: size,
                                ),
                                SizedBox(height: size.height * 0.02),
                                ButtonSettingScreen(
                                  size: size,
                                  title: "Cập nhật tài khoản",
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateInfo(
                                              check: widget.checks,
                                              giasus: widget.gs,
                                              hocviens: widget.hv)),
                                    );
                                  },
                                  colorbtn: Colors.black,
                                  colortext: Colors.white,
                                ),
                                ButtonSettingScreen(
                                  size: size,
                                  title: "Đổi mật khẩu",
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdatePass(check: widget.checks)),
                                    );
                                  },
                                  colorbtn: Colors.white,
                                  colortext: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : new Container(),
              //////
              visibility2
                  ? new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding,
                            //left: Dimens.kDefaultPadding,
                          ),
                          width: size.width,
                          //height: size.width / 2,
                          decoration: BoxDecoration(
                            color: ColorConstants.kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Dimens.kDefaultBorderRadiusContainer),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                color: Colors.black.withOpacity(0.2),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              // left: Dimens.kDefaultPadding,
                              // right: Dimens.kDefaultPadding,
                              bottom: Dimens.kDefaultPadding,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    new IconButton(
                                      color: Colors.grey[400],
                                      icon: const Icon(
                                        Icons.cancel,
                                        size: 22.0,
                                      ),
                                      onPressed: () {
                                        _changed(false, "2");
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  "Lớp đã xác nhận",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.amberAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      height: size.height / 4,
                                      child: Consumer<LopModel>(
                                        builder: (_, snapshot, __) {
                                          if (snapshot.lstLop.length <= 0)
                                            return Container(
                                              child: Center(
                                                  child: Text(
                                                "Dữ liệu rỗng",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              )),
                                            );
                                          List<Lop>? lopList = snapshot.lstLop;
                                          return ListView.builder(
                                            itemCount: lopList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              Lop lop = lopList[index];
                                              return Card(
                                                child: LopDeNghi(
                                                    size: size,
                                                    address:
                                                        lop.diadiem.toString(),
                                                    nameclass:
                                                        lop.tenlop.toString(),
                                                    calendar: lop.thoigianhoc
                                                        .toString(),
                                                    price: lop.hocphidenghi
                                                        .toString(),
                                                    sum: lop.sohocvien
                                                        .toString(),
                                                    press: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LopHocVienDetail(
                                                                      lop: lop,
                                                                      check:
                                                                          true)),
                                                        )),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : new Container(),
              //////
              visibility3
                  ? new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding,
                          ),
                          width: size.width,
                          //height: size.width / 2,
                          decoration: BoxDecoration(
                            color: ColorConstants.kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Dimens.kDefaultBorderRadiusContainer),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                color: Colors.black.withOpacity(0.2),
                              )
                            ],
                          ),

                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: Dimens.kDefaultPadding,
                            ),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  new IconButton(
                                    color: Colors.grey[400],
                                    icon: const Icon(
                                      Icons.cancel,
                                      size: 22.0,
                                    ),
                                    onPressed: () {
                                      _changed(false, "3");
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: size.width,
                                    height: size.height / 2,
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                      ],
                    )
                  : new Container(),
              /////
              visibility4
                  ? new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          //height: size.width / 2,
                          decoration: BoxDecoration(
                            color: ColorConstants.kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Dimens.kDefaultBorderRadiusContainer),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                color: Colors.black.withOpacity(0.2),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Dimens.kDefaultPadding,
                              right: Dimens.kDefaultPadding,
                              bottom: Dimens.kDefaultPadding,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                new IconButton(
                                  color: Colors.grey[400],
                                  icon: const Icon(
                                    Icons.cancel,
                                    size: 22.0,
                                  ),
                                  onPressed: () {
                                    _changed(false, "4");
                                  },
                                ),
                                SizedBox(
                                  //height: size.width / 3 - 50,
                                  child: TextField(
                                    onChanged: (value) {},
                                    onTap: () {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);

                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                    },
                                    style: TextStyle(
                                        color: ColorConstants.kTextButtonColor),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 2,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorConstants
                                                  .kTextButtonColor,
                                              width: 2.0)),
                                      hintText: HintConstants.nameclass,
                                      hintStyle: TextStyle(
                                          color:
                                              ColorConstants.kTextButtonColor),
                                    ),
                                    //controller: TextEditingController(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : new Container(),
              //////
              visibility5
                  ? new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding,
                            //left: Dimens.kDefaultPadding,
                          ),
                          width: size.width,
                          //height: size.width / 2,
                          decoration: BoxDecoration(
                            color: ColorConstants.kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Dimens.kDefaultBorderRadiusContainer),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                color: Colors.black.withOpacity(0.2),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              // left: Dimens.kDefaultPadding,
                              // right: Dimens.kDefaultPadding,
                              bottom: Dimens.kDefaultPadding,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    new IconButton(
                                      color: Colors.grey[400],
                                      icon: const Icon(
                                        Icons.cancel,
                                        size: 22.0,
                                      ),
                                      onPressed: () {
                                        _changed(false, "5");
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  "Lớp chờ xác nhận",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.amberAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      height: size.height / 4,
                                      child: Consumer<LopModel>(
                                        builder: (_, snapshot, __) {
                                          if (snapshot.lstLop1.length <= 0)
                                            return Container(
                                              child: Center(
                                                  child: Text(
                                                "Dữ liệu rỗng",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              )),
                                            );
                                          List<Lop> lp = snapshot.lstLop1;
                                          return ListView.builder(
                                            itemCount: lp.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              Lop lop = lp[index];
                                              return Card(
                                                child: LopDeNghi(
                                                    size: size,
                                                    address:
                                                        lop.diadiem.toString(),
                                                    nameclass:
                                                        lop.tenlop.toString(),
                                                    calendar: lop.thoigianhoc
                                                        .toString(),
                                                    price: lop.hocphidenghi
                                                        .toString(),
                                                    sum: lop.sohocvien
                                                        .toString(),
                                                    press: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LopHocVienDetail(
                                                                      lop: lop,
                                                                      check:
                                                                          false)),
                                                        )),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : new Container(),
            ],
          ),
        ),
        ButtonLogOut(
          size,
          ButtonConstants.logout,
          context,
          () {
            SystemNavigator.pop();
          },
        ),
        /////
      ],
    );
  }
}

// List<Lop> getListWait(context, HocVien hocvien) {
//   var _lop = Provider.of<LopModel>(context, listen: false);
//   _lop.getListLopHocVienDeNghi(int.parse(hocvien.hocvienId.toString()), "1");
//   _lop.getListLopHocVienDeNghi(int.parse(hocvien.hocvienId.toString()), "0");
//   List<Lop> lst = <Lop>[];
//   for (Lop lop in _lop.lstLop) {
//     for (Lop lop1 in _lop.lstLop1) {
//       if (lop1.lopId != lop.lopId) {
//         lst.add(lop1);
//       }
//     }
//   }
//   return lst;
// }

void sendRequest(context, int gsId, int lopId) {
  var _value = Provider.of<GiaSuModel>(context, listen: false);
  var _lop = Provider.of<LopModel>(context, listen: false);

  _lop.checkRequest(gsId, lopId).then((value) {
    if (value == false) {
      _lop.sendRequest(gsId, lopId).then((value) {
        if (value) {
          showToast("Gửi lời mời thành công!");
        } else {
          showToast("Gửi lời mời không thành công!");
        }
      });
    } else {
      showToast("Đã gửi lời mời!");
    }
  });
}
