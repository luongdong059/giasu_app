import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/constants/text_constants.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/screens/detail/baidang_detail.dart';
import 'package:giasu_app/screens/detail/components/detail_body_baidang.dart';
import 'package:giasu_app/screens/home/components/baidang_item.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

class SendTeach extends StatelessWidget {
  const SendTeach({Key? key, required this.gs}) : super(key: key);
  final GiaSu gs;

  @override
  Widget build(BuildContext context) {
    var _lop = Provider.of<LopModel>(context, listen: false);
    var _hocvien = Provider.of<HocVienModel>(context, listen: false);
    _lop.getListLopHV(_hocvien.hocVien.hocvienId.toString());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(TitleConstants.sendTitle),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            height: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Consumer<LopModel>(
          builder: (_, snapshot, __) {
            if ((snapshot.lstLop1.length <= 0))
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            List<Lop>? lopList = snapshot.lstLop1;
            return ListView.builder(
              itemCount: lopList.length,
              itemBuilder: (BuildContext context, int index) {
                Lop lop = lopList[index];
                return Card(
                  child: BaiDangItem(
                    size: size,
                    address: lop.diadiem.toString(),
                    nameclass: lop.tenlop.toString(),
                    calendar: lop.thoigianhoc.toString(),
                    price: lop.hocphidenghi.toString(),
                    sum: lop.sohocvien.toString(),
                    press: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BaiDangDetails(lop: lop)),
                      )
                    },
                    pressSend: () {
                      sendRequest(context, gs, int.parse(lop.lopId.toString()));
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Future<void> sendRequest(context, GiaSu gs, int lopId) async {
  var _lop = Provider.of<LopModel>(context, listen: false);

  await _lop
      .checkRequest(int.parse(gs.giasuId.toString()), lopId)
      .then((value) {
    if (value == false) {
      getLength(context, gs).then((value) {
        if (value >= 50) {
          _lop
              .sendRequest(int.parse(gs.giasuId.toString()), lopId)
              .then((value) {
            if (value) {
              showToast("Gửi lời mời thành công!");
            } else {
              showToast("Gửi lời mời không thành công!");
            }
          });
        } else {
          showToast("Gia sư không đủ điểm để thực hiện!");
        }
      });
    } else {
      showToast("Đã gửi lời mời!");
    }
  });
}

Future<double> getLength(context, GiaSu gs) async {
  var length = 0;
  double count = 0;
  var _lop = Provider.of<LopModel>(context, listen: false);
  int gsid = int.parse(gs.giasuId.toString());

  await _lop.getListLopCheck(gsid).then((value) {
    print(value.length);
    length = value.length * 50;
    int point = int.parse(gs.pointGs.toString());
    count = double.parse((point - length).toString());
  });
  return count;
}

class BaiDangDetails extends StatelessWidget {
  final Lop lop;
  const BaiDangDetails({Key? key, required this.lop}) : super(key: key);

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
      body: Body(lop: lop),
    );
  }
}
