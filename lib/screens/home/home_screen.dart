import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_app/components/send_teach.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/data/api_services.dart';
import 'package:giasu_app/models/danhgia.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/screens/detail/baidang_detail.dart';
import 'package:giasu_app/screens/detail/detail_giasu.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

import 'components/baidang_item.dart';
import 'components/giasu_item.dart';
import 'components/header_with_searchbox.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.check}) : super(key: key);
  final bool check;
  @override
  Widget build(BuildContext context) {
    var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    _giasu.getListGiaSu();
    var _lop = Provider.of<LopModel>(context, listen: false);
    _lop.getListLop();
    _lop.getListKhuVuc();

    Size size = MediaQuery.of(context).size;
    if (check) {
      return RefreshIndicator(
        onRefresh: () => refreshList(context),
        child: Column(
          children: <Widget>[
            HeaderWithSearchBox(size: size, check: check),
            Expanded(
              child: Consumer<GiaSuModel>(
                builder: (_, snapshot, __) {
                  if ((snapshot.lstGiaSu.length <= 0))
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  List<GiaSu>? userList = snapshot.lstGiaSu;
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      GiaSu gs = userList[index];
                      return Consumer<LopModel>(builder: (_, value, __) {
                        var khuvuc = "Không xác định";
                        for (KhuVuc kv in value.lstKhuVuc) {
                          if (kv.khuvucId == gs.khuvucId) {
                            khuvuc = kv.tenkhuvuc.toString();
                          }
                        }

                        return Card(
                          child: GiaSuItem(
                            size: size,
                            address: khuvuc.toString(),
                            name: gs.hoten.toString(),
                            price: gs.hocphi.toString(),
                            gender: gs.gioitinh.toString(),
                            url: gs.url.toString(),
                            press: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GiaSuDetail(giasu: gs)),
                              )
                            },
                            pressSend: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SendTeach(gs: gs)),
                              )
                            },
                          ),
                        );
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return RefreshIndicator(
        onRefresh: () => refreshList(context),
        child: Column(
          children: <Widget>[
            HeaderWithSearchBox(size: size, check: check),
            Expanded(
              child: Consumer<LopModel>(
                builder: (_, snapshot, __) {
                  if ((snapshot.lstLop.length <= 0))
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  List<Lop>? lopList = snapshot.lstLop;
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
                                  builder: (context) =>
                                      BaiDangDetail(lop: lop)),
                            )
                          },
                          pressSend: () {
                            sendRequest(
                                context,
                                int.parse(_giasu.giaSu.giasuId.toString()),
                                int.parse(lop.lopId.toString()));
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}

Future<Null> refreshList(context) async {
  var _value = Provider.of<GiaSuModel>(context, listen: false);
  _value.getListGiaSu();
  var _lop = Provider.of<LopModel>(context, listen: false);
  _lop.getListLop();
  return null;
}

Future<void> sendRequest(context, int gsId, int lopId) async {
  var _value = Provider.of<GiaSuModel>(context, listen: false);
  var _lop = Provider.of<LopModel>(context, listen: false);
  await _lop.checkRequest(gsId, lopId).then((value) {
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
