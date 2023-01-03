import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/constants/dimen_constants.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/models/lsdd.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';
import 'header_with_image.dart';
import 'title_with_detail.dart';

var phi = 0;

class Body extends StatelessWidget {
  const Body({Key? key, required this.lop}) : super(key: key);
  final Lop lop;

  @override
  Widget build(BuildContext context) {
    setPhi(context, lop);
    var _value = Provider.of<LopModel>(context, listen: false);
    _value.getListLop();
    _value.getListLopTT("0");
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithImage("assets/images/879.png"),
          Consumer<LopModel>(builder: (_, snapshot, __) {
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
                  Consumer<LopModel>(builder: (_, data, __) {
                    var trangthai = "Đã có giáo viên nhận lớp";
                    for (Lop lp in data.lstLopTT) {
                      if (lp.lopId == lop.lopId) {
                        trangthai = "Chưa có giáo viên nhận lớp";
                      }
                    }
                    return Row(
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
                            child: Details(
                              size,
                              icon: "assets/icons/check.svg",
                              info: HeaderConstants.status,
                              detail: trangthai,
                            )),
                      ],
                    );
                  }),
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
