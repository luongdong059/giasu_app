import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/screens/setting/components/lop_detail_body.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

class LopDetail extends StatelessWidget {
  final Lop lop;
  final bool check;
  const LopDetail({Key? key, required this.lop, required this.check})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _value = Provider.of<GiaSuModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(TitleConstants.infoclassTitle),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            height: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: LopBody(lop: lop, check: check),
    );
  }
}

class LopHocVienDetail extends StatelessWidget {
  final Lop lop;
  final bool check;
  const LopHocVienDetail({Key? key, required this.lop, required this.check})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _value = Provider.of<GiaSuModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(TitleConstants.infoclassTitle),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            height: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: LopHocVienBody(lop: lop, check: check),
    );
  }
}

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
