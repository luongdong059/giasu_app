import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/screens/detail/components/bottom_nav_bar_detai_giasu.dart';
import 'package:giasu_app/screens/detail/components/detail_body_baidang.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

class BaiDangDetail1 extends StatelessWidget {
  final Lop lop;
  const BaiDangDetail1({Key? key, required this.lop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _value = Provider.of<GiaSuModel>(context, listen: false);
    return Scaffold(
      body: Body(lop: lop),
      bottomNavigationBar: MyBotNavBar(
        title: TitleConstants.contentBottom1,
        titleBtn: ButtonConstants.sendrequest,
        press: () {
          sendRequest(
            context,
            int.parse(_value.giaSu.giasuId.toString()),
            int.parse(lop.lopId.toString()),
          );
        },
      ),
    );
  }
}

void sendRequest(context, int gsId, int lopId) {
  var _value = Provider.of<GiaSuModel>(context, listen: false);
  var _lop = Provider.of<LopModel>(context, listen: false);

  _lop.checkRequest(gsId, lopId).then((value) {
    if (value == false) {
      getLength(context).then((value) {
        if (value >= 50) {
          _lop.sendRequest(gsId, lopId).then((value) {
            if (value) {
              showToast("Gửi lời mời thành công!");
            } else {
              showToast("Gửi lời mời không thành công!");
            }
          });
        } else {
          showToast("Không đủ điểm để thực hiện!");
        }
      });
    } else {
      showToast("Đã gửi lời mời!");
    }
  });
}

Future<double> getLength(context) async {
  var length = 0;
  double count = 0;
  var _value = Provider.of<GiaSuModel>(context, listen: false);
  var _lop = Provider.of<LopModel>(context, listen: false);

  await _lop
      .getListLopCheck(int.parse(_value.giaSu.giasuId.toString()))
      .then((value) {
    print(value.length);
    length = value.length * 50;
    int point = int.parse(_value.giaSu.pointGs.toString());
    count = double.parse((point - length).toString());
  });
  return count;
}
