import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/components/review_giasu.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/constants/dimen_constants.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/models/lsdd.dart';
import 'package:giasu_app/screens/detail/components/btn_comment.dart';
import 'package:giasu_app/screens/detail/components/header_with_image.dart';
import 'package:giasu_app/screens/detail/components/title_comment.dart';
import 'package:giasu_app/screens/detail/components/title_with_detail.dart';
import 'package:giasu_app/screens/setting/setting_screen.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

import 'btn_setting_screen.dart';
import 'giasu_card.dart';
import 'giasu_card_mini.dart';

var phi = 0;

class LopBody extends StatelessWidget {
  const LopBody({Key? key, required this.lop, required this.check})
      : super(key: key);
  final Lop lop;
  final bool check;

  @override
  Widget build(BuildContext context) {
    setPhi(context, lop);
    var _value = Provider.of<LopModel>(context, listen: false);
    _value.getListKhuVuc();
    if (check) {
      _value.getListLopTT("1");
    } else {
      _value.getListLopTT("0");
    }
    var _hocvien = Provider.of<HocVienModel>(context, listen: false);
    _hocvien.getHocVienId(int.parse(lop.hocvienId.toString()));

    var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithImage("assets/images/879.png"),
          Consumer<LopModel>(builder: (_, snapshot, __) {
            var trangthai = "Đã có giáo viên nhận lớp";
            if (check) {
              for (Lop lp in snapshot.lstLopTT) {
                if (lp.lopId == lop.lopId) {
                  trangthai = "Đã có giáo viên nhận lớp";
                }
              }
            } else {
              for (Lop lp in snapshot.lstLopTT) {
                if (lp.lopId == lop.lopId) {
                  trangthai = "Chưa có giáo viên nhận lớp";
                }
              }
            }
            return Container(
              width: size.width,
              //color: ColorConstants.kPrimaryColor,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/class.svg",
                              info: HeaderConstants.nameclass,
                              detail: lop.tenlop.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/check.svg",
                              info: HeaderConstants.status,
                              detail: trangthai)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/class.svg",
                              info: HeaderConstants.typesubject,
                              detail: lop.hinhthuc.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/unisex.svg",
                              info: HeaderConstants.sexrequest,
                              detail: lop.yeucaugioitinh.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/map.svg",
                              info: HeaderConstants.address,
                              detail: lop.diadiem.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/numstudent.svg",
                              info: HeaderConstants.numberstudent,
                              detail: lop.sohocvien.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/clock.svg",
                              info: HeaderConstants.time,
                              detail: lop.thoigianhoc.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/timer.svg",
                              info: HeaderConstants.times,
                              detail:
                                  lop.thoiluong.toString() + " buổi / tuần")),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/dollar.svg",
                              info: "",
                              detail:
                                  lop.hocphidenghi.toString() + " VNĐ/buổi")),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/cost.svg",
                              info: HeaderConstants.priceclass,
                              detail: phi.toString() + " Point")),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Detail(size,
                              icon: "assets/icons/info.svg",
                              info: HeaderConstants.requirecontent,
                              detail: lop.noidungyeucau.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Detail(size,
                              icon: "assets/icons/calendar.svg",
                              info: HeaderConstants.timeex,
                              detail: lop.lichdukien.toString())),
                    ],
                  ),
                  check
                      ? Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                      top: Dimens.kDefaultPadding / 2,
                                      left: Dimens.kDefaultPadding,
                                    ),
                                    width: size.width -
                                        (Dimens.kDefaultPadding * 2),
                                    // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
                                    decoration: BoxDecoration(
                                      color: ColorConstants.kPrimaryColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(Dimens
                                            .kDefaultBorderRadiusContainer),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 3),
                                          blurRadius: 7,
                                          color: Colors.black.withOpacity(0.2),
                                        )
                                      ],
                                    ),
                                    child: Consumer<HocVienModel>(
                                        builder: (_, snapshot, __) {
                                      return Column(
                                        children: [
                                          DetailInfo(
                                            size,
                                            snapshot.hocVien,
                                            icon: "assets/icons/info.svg",
                                            info: HeaderConstants.contact,
                                          ),
                                          ButtonComment(
                                            size,
                                            ButtonConstants.review,
                                            context,
                                            () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ReviewGiasu(
                                                  gs: _giasu.giaSu,
                                                  hv: snapshot.hocVien,
                                                  check: false,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    })),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            ButtonComment(
                                size,
                                ButtonConstants.delete,
                                context,
                                () => {
                                      delete(context, lop),
                                    }),
                            SizedBox(height: size.height * 0.02),
                          ],
                        ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

Future<void> setPhi(context, Lop lop) async {
  var _value = Provider.of<LopModel>(context, listen: false);
  await _value.getLSDD(int.parse(lop.lopId.toString())).then((value) {
    phi = value.philienket == null ? 0 : int.parse(value.philienket.toString());
  });
}

Widget DetailInfo(Size size, HocVien hv, {@required icon, @required info}) {
  return Padding(
    padding: EdgeInsets.all(Dimens.kDefaultPadding),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimens.kDefaultPadding,
                right: Dimens.kDefaultPadding / 2,
              ),
              child: SvgPicture.asset(
                icon,
                width: ((size.width / 2 - Dimens.kDefaultPadding * 2) / 2) / 2,
              ),
            ),
            Text(
              info,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorConstants.kTextButtonColor,
                fontSize: 17,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Họ và tên: ${hv.hoten}",
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorConstants.kTextButtonColor,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Số điện thoại: ${hv.sdt}",
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorConstants.kTextButtonColor,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Email: ${hv.email}",
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorConstants.kTextButtonColor,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

class LopHocVienBody extends StatelessWidget {
  const LopHocVienBody({Key? key, required this.lop, required this.check})
      : super(key: key);
  final Lop lop;
  final bool check;

  @override
  Widget build(BuildContext context) {
    setPhi(context, lop);
    var _value = Provider.of<LopModel>(context, listen: false);
    _value.getListKhuVuc();
    // if (check) {
    //   var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    //   _giasu.getListGiaSuDeNghi(int.parse(lop.lopId.toString()), "1");
    // } else {
    //   var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    //   _giasu.getListGiaSuDeNghi(int.parse(lop.lopId.toString()), "0");
    // }
    // var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    // _giasu.getListGiaSuDeNghi(int.parse(lop.lopId.toString()), "1");
    // var _giasu1 = Provider.of<GiaSuModel>(context, listen: false);
    // _giasu1.getListGiaSuDeNghi(int.parse(lop.lopId.toString()), "0");
    if (check) {
      _value.getListLopTT("1");
    } else {
      _value.getListLopTT("0");
    }

    var _hocvien = Provider.of<HocVienModel>(context, listen: false);
    _hocvien.getHocVienId(int.parse(lop.hocvienId.toString()));
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithImage("assets/images/879.png"),
          Consumer<LopModel>(builder: (_, snapshot, __) {
            var trangthai = "Đã có giáo viên nhận lớp";
            if (check) {
              for (Lop lp in snapshot.lstLopTT) {
                if (lp.lopId == lop.lopId) {
                  trangthai = "Đã có giáo viên nhận lớp";
                }
              }
            } else {
              for (Lop lp in snapshot.lstLopTT) {
                if (lp.lopId == lop.lopId) {
                  trangthai = "Chưa có giáo viên nhận lớp";
                }
              }
            }
            return Container(
              width: size.width,
              //color: ColorConstants.kPrimaryColor,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/class.svg",
                              info: HeaderConstants.nameclass,
                              detail: lop.tenlop.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/check.svg",
                              info: HeaderConstants.status,
                              detail: trangthai)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/class.svg",
                              info: HeaderConstants.typesubject,
                              detail: lop.hinhthuc.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/unisex.svg",
                              info: HeaderConstants.sexrequest,
                              detail: lop.yeucaugioitinh.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/map.svg",
                              info: HeaderConstants.address,
                              detail: lop.diadiem.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/numstudent.svg",
                              info: HeaderConstants.numberstudent,
                              detail: lop.sohocvien.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/clock.svg",
                              info: HeaderConstants.time,
                              detail: lop.thoigianhoc.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/timer.svg",
                              info: HeaderConstants.times,
                              detail:
                                  lop.thoiluong.toString() + " buổi / tuần")),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/dollar.svg",
                              info: "",
                              detail:
                                  lop.hocphidenghi.toString() + " VNĐ/buổi")),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Details(size,
                              icon: "assets/icons/cost.svg",
                              info: HeaderConstants.priceclass,
                              detail: phi.toString() + " Point")),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Detail(size,
                              icon: "assets/icons/info.svg",
                              info: HeaderConstants.requirecontent,
                              detail: lop.noidungyeucau.toString())),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding / 2,
                            left: Dimens.kDefaultPadding,
                          ),
                          width: size.width - (Dimens.kDefaultPadding * 2),
                          // height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                          child: Detail(size,
                              icon: "assets/icons/calendar.svg",
                              info: HeaderConstants.timeex,
                              detail: lop.lichdukien.toString())),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Consumer<GiaSuModel>(
                    builder: (_, snapshot1, __) {
                      List<GiaSu> gs = snapshot1.lstGiaSu;

                      if (check) {
                        var _giasu =
                            Provider.of<GiaSuModel>(context, listen: false);
                        _giasu.getListGiaSuDeNghi(
                            int.parse(lop.lopId.toString()), "1");
                        return ButtonSettingScreen(
                          size: size,
                          title: "Thông tin gia sư",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GiaSuHocVienDetail(
                                    giasu: gs[0], check: check, lop: lop),
                              ),
                            );
                          },
                          colorbtn: Colors.black,
                          colortext: Colors.white,
                        );
                      } else {
                        var _giasu =
                            Provider.of<GiaSuModel>(context, listen: false);
                        _giasu.getListGiaSuDeNghi(
                            int.parse(lop.lopId.toString()), "0");
                        return Consumer<GiaSuModel>(
                          builder: (_, data, __) {
                            if ((data.lstGiaSu.length <= 0))
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            List<GiaSu>? userList = data.lstGiaSu;
                            return Container(
                              decoration: BoxDecoration(
                                color: ColorConstants.kPrimaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      Dimens.kDefaultBorderRadiusContainer),
                                  topRight: Radius.circular(
                                      Dimens.kDefaultBorderRadiusContainer),
                                ),
                              ),
                              padding: EdgeInsets.all(Dimens.kDefaultPadding),
                              height: size.height / 3,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      HeaderComment(size,
                                          icon: "assets/icons/teach.svg",
                                          title: HeaderConstants.require),
                                    ],
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: userList.length,
                                      itemBuilder: (context, i) {
                                        return Container(
                                          // margin: EdgeInsets.only(
                                          //     bottom: Dimens.kDefaultPadding),
                                          decoration: BoxDecoration(
                                            //color: ColorConstants.kPrimaryColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(Dimens
                                                  .kDefaultBorderRadiusContainer),
                                            ),
                                          ),
                                          width: size.width -
                                              (Dimens.kDefaultPadding * 2),
                                          child: GiaSuCard(
                                            giasu: userList[i],
                                            press: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      GiaSuHocVienDetail(
                                                          giasu: userList[i],
                                                          check: check,
                                                          lop: lop),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

String gettrangthai(context, check, Lop lop) {
  var _value = Provider.of<LopModel>(context, listen: false);
  var trangthai = "Đã có giáo viên nhận lớp";
  print(check);
  if (check) {
    _value.getListLopTT("1");
    for (Lop lp in _value.lstLopTT) {
      if (lp.lopId == lop.lopId) {
        trangthai = "Đã có giáo viên nhận lớp";
      }
    }
  } else {
    _value.getListLopTT("0");
    for (Lop lp in _value.lstLopTT) {
      if (lp.lopId == lop.lopId) {
        trangthai = "Chưa có giáo viên nhận lớp";
      }
    }
  }
  return trangthai;
}

void delete(context, Lop lop) {
  var _value = Provider.of<GiaSuModel>(context, listen: false);
  _value
      .deleteDenghi(_value.giaSu.giasuId.toString(), lop.lopId.toString())
      .then((value) {
    if (value) {
      showToast("Huỷ đề nghị thành công");
    } else {
      showToast("Huỷ đề nghị không thành công");
    }
  });
}
