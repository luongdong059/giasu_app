import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/danhgia.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/screens/detail/components/btn_comment.dart';
import 'package:giasu_app/screens/detail/components/title_comment.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';
import 'package:provider/provider.dart';

TextEditingController myController = new TextEditingController();

class ReviewGiasu extends StatelessWidget {
  const ReviewGiasu(
      {Key? key, required this.gs, required this.hv, required this.check})
      : super(key: key);
  final GiaSu gs;
  final HocVien hv;
  final bool check;

  @override
  Widget build(BuildContext context) {
    print(check);
    double rate = 3;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(TitleConstants.reviewTitle),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/back.svg",
              height: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: Dimens.kDefaultPadding,
                  left: Dimens.kDefaultPadding,
                ),
                width: size.width - (Dimens.kDefaultPadding * 2),
                height: size.width - ((Dimens.kDefaultPadding * 2) * 2),
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
                child: Padding(
                  padding: EdgeInsets.all(Dimens.kDefaultPadding),
                  child: Column(
                    children: [
                      HeaderComment(size,
                          icon: "assets/icons/comment.svg",
                          title: HeaderConstants.review),
                      Spacer(),
                      SizedBox(
                        height: 200,
                        child: TextField(
                          onChanged: (value) {},
                          onTap: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          },
                          controller: myController,
                          style:
                              TextStyle(color: ColorConstants.kTextButtonColor),
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorConstants.kTextButtonColor,
                                    width: 2.0)),
                            hintText: HintConstants.comment,
                            hintStyle: TextStyle(
                                color: ColorConstants.kTextButtonColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              check
                  ? RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        rate = rating;
                        print(rate);
                      },
                    )
                  : SizedBox(height: size.height * 0.02),
              Container(
                  margin: EdgeInsets.only(
                    top: Dimens.kDefaultPadding,
                    left: Dimens.kDefaultPadding,
                  ),
                  child:
                      ButtonComment(size, ButtonConstants.review, context, () {
                    DanhGia dg = new DanhGia();
                    dg = getData(context, gs, rate.toInt(), myController.text);
                    checks(context, gs, dg, hv, check);
                  }))
            ],
          ),
        ));
  }
}

void checks(context, GiaSu gs, DanhGia danhgia, HocVien hv, bool check) {
  if (check) {
    var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    var _hocvien = Provider.of<HocVienModel>(context, listen: false);
    _giasu
        .checkDanhGia(int.parse(gs.giasuId.toString()),
            int.parse(_hocvien.hocVien.hocvienId.toString()))
        .then((value) {
      if (value) {
        _hocvien.updateComment(danhgia, 1).then((value) {
          if (value) {
            showToast("Gửi đánh giá thành công");
          } else {
            showToast("Gửi đánh giá không thành công");
          }
        });
      } else {
        _hocvien.postComment(danhgia).then((value) {
          if (value) {
            showToast("Gửi đánh giá thành công");
          } else {
            showToast("Gửi đánh giá không thành công");
          }
        });
      }
    });
  } else {
    var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    var _hocvien = Provider.of<HocVienModel>(context, listen: false);
    _giasu
        .checkDanhGia(int.parse(gs.giasuId.toString()),
            int.parse(hv.hocvienId.toString()))
        .then((value) {
      if (value) {
        _hocvien.updateComment(danhgia, 0).then((value) {
          if (value) {
            showToast("Gửi đánh giá thành công");
          } else {
            showToast("Gửi đánh giá không thành công");
          }
        });
      } else {
        _hocvien.postComment(danhgia).then((value) {
          if (value) {
            showToast("Gửi đánh giá thành công");
          } else {
            showToast("Gửi đánh giá không thành công");
          }
        });
      }
    });
  }
}

DanhGia getData(context, GiaSu gs, int rate, String text) {
  print(rate);
  var _hocvien = Provider.of<HocVienModel>(context, listen: false);
  DanhGia dg = new DanhGia();
  dg.giasuId = gs.giasuId;
  dg.hocvienId = _hocvien.hocVien.hocvienId;
  dg.sosao = rate;
  dg.hocvienGiasu = text;
  dg.giasuHocvien = text;
  dg.yeuthich = 0;
  return dg;
}
