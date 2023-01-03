import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/constants/dimen_constants.dart';
import 'package:giasu_app/models/danhgia.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/screens/detail/components/comment.dart';
import 'package:giasu_app/screens/detail/components/header_with_info.dart';
import 'package:giasu_app/components/review_giasu.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

import 'btn_comment.dart';
import 'icon_with_info.dart';
import 'title_comment.dart';
import 'title_with_detail.dart';

var x = 0;
List<DanhGia> valuex = <DanhGia>[];

class Body extends StatelessWidget {
  const Body({Key? key, required this.giasu}) : super(key: key);
  final GiaSu giasu;

  @override
  Widget build(BuildContext context) {
    var _hocvien = Provider.of<HocVienModel>(context, listen: false);
    _hocvien.getListHocVien();
    init(context, int.parse(giasu.giasuId.toString()), giasu);
    var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    _giasu.getListGiaSu();
    var _lop = Provider.of<LopModel>(context, listen: false);
    _lop.getListKhuVuc();
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithInfo(
            url: giasu.url.toString(),
            name: giasu.hoten.toString(),
          ),
          Container(
            width: size.width,
            //color: ColorConstants.kPrimaryColor,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding,
                            left: Dimens.kDefaultPadding),
                        width: size.width / 2 - Dimens.kDefaultPadding * 2,
                        height:
                            (size.width / 2 - Dimens.kDefaultPadding * 2) / 2,
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
                        child: InfoGiasu(size,
                            icon: "assets/icons/presentation.svg",
                            info: giasu.nghenghiep.toString())),
                    Container(
                      margin: EdgeInsets.only(
                          top: Dimens.kDefaultPadding,
                          left: Dimens.kDefaultPadding * 2),
                      width: size.width / 2 - Dimens.kDefaultPadding * 2,
                      height: (size.width / 2 - Dimens.kDefaultPadding * 2) / 2,
                      decoration: BoxDecoration(
                        color: ColorConstants.kPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimens.kDefaultBorderRadiusContainer),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 7,
                            color: Colors.black.withOpacity(0.2),
                          )
                        ],
                      ),
                      child: Consumer<LopModel>(builder: (_, snapshot, __) {
                        var khuvuc = "Không xác định";
                        for (KhuVuc kv in snapshot.lstKhuVuc) {
                          if (kv.khuvucId == giasu.khuvucId) {
                            khuvuc = kv.tenkhuvuc.toString();
                          }
                        }

                        return InfoGiasu(size,
                            icon: "assets/icons/map.svg",
                            info: khuvuc.toString());
                      }),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: Dimens.kDefaultPadding,
                          left: Dimens.kDefaultPadding),
                      width: size.width / 2 - Dimens.kDefaultPadding * 2,
                      height: (size.width / 2 - Dimens.kDefaultPadding * 2) / 2,
                      decoration: BoxDecoration(
                        color: ColorConstants.kPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimens.kDefaultBorderRadiusContainer),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 7,
                            color: Colors.black.withOpacity(0.2),
                          )
                        ],
                      ),
                      child: InfoGiasu(size,
                          icon: "assets/icons/teach.svg",
                          info: giasu.hinhthucday.toString()),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: Dimens.kDefaultPadding,
                            left: Dimens.kDefaultPadding * 2),
                        width: size.width / 2 - Dimens.kDefaultPadding * 2,
                        height:
                            (size.width / 2 - Dimens.kDefaultPadding * 2) / 2,
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
                        child: InfoGiasu(size,
                            icon: "assets/icons/cost.svg",
                            info: giasu.hocphi.toString())),
                  ],
                ),

                //Thong tin giang vien
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: Dimens.kDefaultPadding,
                          left: Dimens.kDefaultPadding,
                        ),
                        width: size.width - (Dimens.kDefaultPadding * 2),
                        //height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                            info: HeaderConstants.info,
                            detail: giasu.gioithieubanthan.toString())),
                  ],
                ),

                //Chu de day
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: Dimens.kDefaultPadding,
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
                            icon: "assets/icons/theme.svg",
                            info: HeaderConstants.type,
                            detail: giasu.thoigianday.toString())),
                  ],
                ),

                //Nhan xet

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: Dimens.kDefaultPadding,
                        left: Dimens.kDefaultPadding,
                      ),
                      width: size.width - (Dimens.kDefaultPadding * 2),
                      height: size.width - (Dimens.kDefaultPadding),
                      //height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
                      decoration: BoxDecoration(
                        color: ColorConstants.kPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimens.kDefaultBorderRadiusContainer),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 7,
                            color: Colors.black.withOpacity(0.2),
                          )
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.all(Dimens.kDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                HeaderComment(size,
                                    icon: "assets/icons/comment.svg",
                                    title: HeaderConstants.review),
                              ],
                            ),
                            Expanded(
                              child: Consumer<HocVienModel>(
                                  builder: (_, snapshot, __) {
                                if (x <= 0) {
                                  return Text(
                                    "Người dùng chưa có nhận xét!",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.kTextButtonColor),
                                  );
                                } else {
                                  if (valuex.length > 0) {
                                    return ListView.builder(
                                      itemCount: valuex.length,
                                      itemBuilder: (context, i) {
                                        var urls = "";
                                        var name = "";
                                        for (HocVien hv
                                            in snapshot.lstHocVien) {
                                          if (hv.hocvienId ==
                                              valuex[i].hocvienId) {
                                            urls = hv.url.toString();
                                            name = hv.hoten.toString();
                                          }
                                        }
                                        return Container(
                                          width: size.width -
                                              (Dimens.kDefaultPadding * 2),
                                          child: Card(
                                            color: ColorConstants.kPrimaryColor,
                                            child: Comment(
                                                name: name,
                                                url: urls.toString(),
                                                detail: valuex[i]
                                                    .hocvienGiasu
                                                    .toString(),
                                                rate: int.parse(valuex[i]
                                                    .sosao
                                                    .toString())),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return Text("");
                                  }
                                }
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                ButtonComment(
                  size,
                  ButtonConstants.review,
                  context,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewGiasu(
                          gs: giasu, hv: _hocvien.hocVien, check: true),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<int> getLengthList(context, int id) async {
  var _length = 0;
  var _value = Provider.of<GiaSuModel>(context, listen: false);
  await _value.getListDanhGia(id).then((value) {
    _length = value.length;
  });

  return _length;
}

Future<List<DanhGia>> getDanhGia(context, int id) async {
  var _value = Provider.of<GiaSuModel>(context, listen: false);
  return await _value.getListDanhGia(id);
}

void init(context, int id, giasu) {
  getLengthList(context, id).then((value) {
    x = value;
  });

  getDanhGia(context, id).then((value) {
    valuex = value;
  });
}
