import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:giasu_app/components/filter_giasu.dart';
import 'package:giasu_app/components/map_giasu.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/data/api_services.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/giasu_khuvuc.dart';
import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/models/lop_khuvuc.dart';
import 'package:giasu_app/screens/detail/baidang_detail.dart';
import 'package:giasu_app/screens/detail/detail_giasu.dart';
import 'package:giasu_app/screens/home/components/baidang_item.dart';
import 'package:giasu_app/screens/home/components/giasu_item.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

List<Gskhuvuc> lst = <Gskhuvuc>[];
List<LopKhuVuc> lst1 = <LopKhuVuc>[];

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key, required this.check}) : super(key: key);
  final bool check;
  @override
  Widget build(BuildContext context) {
    getData(context, check);
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
            Container(
              width: size.width,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Button map
                  GestureDetector(
                    onTap: () async {
                      Position position = await _getGeoLocationPosition();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapGiasu(
                              gs: lst,
                              lop: lst1,
                              check: check,
                              position: position),
                        ),
                      );
                    },
                    child: Ink(
                      padding: EdgeInsets.only(left: 10),
                      decoration: ShapeDecoration(
                        color: ColorConstants.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            ButtonConstants.map,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: SvgPicture.asset("assets/icons/map.svg"),
                            onPressed: () async {
                              Position position =
                                  await _getGeoLocationPosition();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MapGiasu(
                                      gs: lst,
                                      lop: lst1,
                                      check: check,
                                      position: position),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Button filter
                ],
              ),
            ),
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
                            pressSend: () => {},
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
            Container(
              width: size.width,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Button map
                  GestureDetector(
                    onTap: () async {
                      Position position = await _getGeoLocationPosition();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapGiasu(
                              gs: lst,
                              lop: lst1,
                              check: check,
                              position: position),
                        ),
                      );
                    },
                    child: Ink(
                      padding: EdgeInsets.only(left: 10),
                      decoration: ShapeDecoration(
                        color: ColorConstants.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            ButtonConstants.map,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: SvgPicture.asset("assets/icons/map.svg"),
                            onPressed: () async {
                              Position position =
                                  await _getGeoLocationPosition();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MapGiasu(
                                      gs: lst,
                                      lop: lst1,
                                      check: check,
                                      position: position),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Button filter
                ],
              ),
            ),
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

Future<Null> refreshList(context) async {
  var _value = Provider.of<GiaSuModel>(context, listen: false);
  _value.getListGiaSu();
  var _lop = Provider.of<LopModel>(context, listen: false);
  _lop.getListLop();
  return null;
}

Future<void> getData(context, bool check) async {
  if (check) {
    var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    await _giasu.getListGSKV().then((value) {
      lst = value;
    });
  } else {
    var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    await _giasu.getListLopKV().then((value) {
      lst1 = value;
    });
  }
}

Future<Position> _getGeoLocationPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    await Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
