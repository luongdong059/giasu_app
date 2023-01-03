import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/danhgia.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/screens/detail/components/comment.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';
import 'package:provider/provider.dart';

var x = 0;
double y = 0;
List<DanhGia> valuex = <DanhGia>[];

class Review extends StatelessWidget {
  const Review({Key? key, required this.giasu}) : super(key: key);
  final GiaSu giasu;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    init(context, int.parse(giasu.giasuId.toString()), giasu);
    var _hocvien = Provider.of<HocVienModel>(context, listen: false);
    _hocvien.getListHocVien();
    return Container(
      width: size.width,
      // height: size.height / 1.5,
      // padding: EdgeInsets.all(Dimens.kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/review.png", width: size.width),
          Expanded(
            child: Consumer<HocVienModel>(builder: (_, snapshot, __) {
              if (x <= 0) {
                return Container(
                  margin: EdgeInsets.only(top: Dimens.kDefaultPadding),
                  width: size.width - (Dimens.kDefaultPadding * 2),
                  height: (Dimens.kDefaultPadding / 2),
                  decoration: BoxDecoration(
                    color: ColorConstants.kPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimens.kDefaultBorderRadiusContainer),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Người dùng chưa có nhận xét!",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.kTextButtonColor),
                    ),
                  ),
                );
              } else {
                if (valuex.length > 0) {
                  return ListView.builder(
                    itemCount: valuex.length,
                    itemBuilder: (context, i) {
                      var urls = "";
                      var name = "";
                      for (HocVien hv in snapshot.lstHocVien) {
                        if (hv.hocvienId == valuex[i].hocvienId) {
                          urls = hv.url.toString();
                          name = hv.hoten.toString();
                        }
                      }
                      return Container(
                        width: size.width - (Dimens.kDefaultPadding * 2),
                        child: Card(
                          color: ColorConstants.kPrimaryColor,
                          child: Comment(
                              name: name,
                              url: urls.toString(),
                              detail: valuex[i].hocvienGiasu.toString(),
                              rate: int.parse(valuex[i].sosao.toString())),
                        ),
                      );
                    },
                  );
                } else {
                  return Text("");
                }
              }
            }),
          ),
          Consumer<HocVienModel>(builder: (_, snapshot, __) {
            return SumRateWidget(sum: y);
          }),
        ],
      ),
    );
  }
}

class SumRateWidget extends StatelessWidget {
  final double sum;
  const SumRateWidget({
    Key? key,
    required this.sum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: Container(
        margin: EdgeInsets.only(top: Dimens.kDefaultPadding),
        child: RatingBar.builder(
          initialRating: sum,
          itemCount: 5,
          allowHalfRating: true,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
            }
            return Text("");
          },
          onRatingUpdate: (rating) {},
        ),
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
  double sum = 0;
  getLengthList(context, id).then((value) {
    x = value;
  });

  getDanhGia(context, id).then((value) {
    valuex = value;
    for (DanhGia dg in valuex) {
      sum += double.parse(dg.sosao.toString());
    }
    y = sum / (double.parse(x.toString()));
  });
}
