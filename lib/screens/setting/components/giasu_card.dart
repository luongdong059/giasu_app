import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/screens/detail/components/btn_comment.dart';
import 'package:giasu_app/screens/detail/components/icon_with_info.dart';
import 'package:giasu_app/screens/detail/components/title_comment.dart';
import 'package:giasu_app/screens/detail/components/title_with_detail.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';
import 'package:giasu_app/constants/dimen_constants.dart';
import 'package:giasu_app/models/danhgia.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/screens/detail/components/comment.dart';
import 'package:giasu_app/screens/detail/components/header_with_info.dart';
import 'package:giasu_app/components/review_giasu.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';

class GiaSuHocVienDetail extends StatelessWidget {
  final GiaSu giasu;
  final Lop lop;
  final bool check;
  const GiaSuHocVienDetail(
      {Key? key, required this.giasu, required this.check, required this.lop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(TitleConstants.infoTitle),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            height: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Body(giasu: giasu, check: check, lop: lop),
    );
  }
}

var x = 0;
List<DanhGia> valuex = <DanhGia>[];

class Body extends StatelessWidget {
  const Body(
      {Key? key, required this.giasu, required this.check, required this.lop})
      : super(key: key);
  final GiaSu giasu;
  final Lop lop;
  final bool check;

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
                        child: DetailInfo(
                          size,
                          giasu,
                          icon: "assets/icons/info.svg",
                          info: HeaderConstants.contact,
                        )),
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
                SizedBox(height: size.height * 0.02),
                check
                    ? ButtonComment(
                        size,
                        ButtonConstants.review,
                        context,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewGiasu(
                                gs: giasu, hv: new HocVien(), check: true),
                          ),
                        ),
                      )
                    : ButtonComment(
                        size,
                        ButtonConstants.success,
                        context,
                        () => {
                              updateTinhTrang(
                                  context,
                                  int.parse(giasu.giasuId.toString()),
                                  int.parse(lop.lopId.toString())),
                            }),
                SizedBox(height: size.height * 0.02),
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

Widget DetailInfo(Size size, GiaSu gs, {@required icon, @required info}) {
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
                    "Họ và tên: ${gs.hoten}",
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
                    "Số điện thoại: ${gs.sdt}",
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
                    "Email: ${gs.email}",
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

Future<void> updateTinhTrang(context, int idgs, int idlop) async {
  var _giasu = Provider.of<LopModel>(context, listen: false);
  await _giasu.updateTinhTrang(idgs, idlop, 1).then((value) {
    if (value) {
      showToast("Xác nhận thành công!");
      int count = 0;
      Navigator.of(context).popUntil((_) => count++ >= 2);
    } else {
      showToast("Xác nhận không thành công!");
    }
  });
}
