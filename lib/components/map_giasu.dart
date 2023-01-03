import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:giasu_app/components/widgets/baidang_detail_map.dart';
import 'package:giasu_app/components/widgets/button_send_widget.dart';
import 'package:giasu_app/components/widgets/giasu_detail_map.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/color_constants.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/giasu_khuvuc.dart';
import 'package:giasu_app/models/knn.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/models/lop_khuvuc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MapGiasu extends StatefulWidget {
  const MapGiasu(
      {Key? key,
      required this.gs,
      required this.lop,
      required this.check,
      required this.position})
      : super(key: key);
  final List<Gskhuvuc> gs;
  final List<LopKhuVuc> lop;
  final bool check;
  final Position position;

  @override
  State<MapGiasu> createState() => _MapGiasuState();
}

class _MapGiasuState extends State<MapGiasu> {
  late GoogleMapController _controller;

  Iterable markers = [];

  // Future<Position> _getGeoLocationPosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     await Geolocator.openLocationSettings();
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  // }
  void check(bool check, Size size) {
    if (check) {
      setState(() {
        ck = true;
        markers = getData(context, widget.gs, widget.lop, widget.check, size);
      });
    }
  }

  var ck = true;
  @override
  Widget build(BuildContext context) {
    late CameraPosition initialCameraPosition = new CameraPosition(
      target: LatLng(widget.position.latitude, widget.position.longitude),
      zoom: 14,
    );

    Size size = MediaQuery.of(context).size;
    check(ck, size);
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(TitleConstants.mapTitle),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/back.svg",
              height: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          initialCameraPosition: initialCameraPosition,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          onMapCreated: (controller) => {_controller = controller},
          markers: Set.from(markers),
        ),
        bottomNavigationBar: widget.check
            ? Container(
                margin: EdgeInsets.only(
                  left: Dimens.kDefaultPadding,
                  right: Dimens.kDefaultPadding * 2,
                  //bottom: Dimens.kDefaultPadding,
                ),
                height: 50,
                decoration: BoxDecoration(
                  //color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -10),
                      blurRadius: 35,
                      color: ColorConstants.kPrimaryColor.withOpacity(0.38),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Danh mục giảng viên",
                      style: TextStyle(
                          color: ColorConstants.kTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.only(
                  left: Dimens.kDefaultPadding,
                  right: Dimens.kDefaultPadding * 2,
                  //bottom: Dimens.kDefaultPadding,
                ),
                height: 50,
                decoration: BoxDecoration(
                  //color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -10),
                      blurRadius: 35,
                      color: ColorConstants.kPrimaryColor.withOpacity(0.38),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: size.width * 0.8,
                      //padding: EdgeInsets.only(right: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          late TextEditingController khoangcachController =
                              new TextEditingController();
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (context1) => Container(
                              color: ColorConstants.kPrimaryColor,
                              height: size.height / 2,
                              child: Column(
                                children: [
                                  Container(
                                    width: size.width * 0.8,
                                    height: 40,
                                    //margin: EdgeInsets.symmetric(vertical: 20),
                                    margin: EdgeInsets.only(
                                        top: Dimens.kDefaultPadding),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: ColorConstants.kTextButtonColor,
                                      borderRadius: BorderRadius.circular(
                                          Dimens.kDefaultBorderRadiusTextField),
                                    ),
                                    child: TextField(
                                      onChanged: (value) {},
                                      controller: khoangcachController,
                                      // inputFormatters: [
                                      //   WhitelistingTextInputFormatter
                                      //       .digitsOnly
                                      // ],
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        hintText: "Khoảng cách (Km)",
                                        icon: Icon(Icons.pedal_bike_outlined,
                                            color: ColorConstants.kTextColor),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: Dimens.kDefaultPadding / 2,
                                      bottom: Dimens.kDefaultPadding,
                                    ),
                                    width: size.width * 0.8,
                                    //padding: EdgeInsets.only(right: 15),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (khoangcachController.text.length >
                                            0) {
                                          Model_KNN model = new Model_KNN();
                                          List<LopKhuVuc> lst = <LopKhuVuc>[];
                                          lst = model.getData(
                                              widget.lop,
                                              3,
                                              initialCameraPosition
                                                  .target.latitude,
                                              initialCameraPosition
                                                  .target.longitude,
                                              int.parse(khoangcachController
                                                  .text
                                                  .toString()));

                                          if (lst.length > 0) {
                                            showToast("Đang xử lý!");
                                            Timer(Duration(seconds: 5), () {
                                              setState(() {
                                                markers = refreshData(
                                                    context, lst, size);
                                                ck = false;
                                              });
                                            });
                                          } else {
                                            showToast("Không tồn tại dữ liệu");
                                            check(true, size);
                                          }
                                        } else {
                                          showToast(
                                              "Vui lòng nhập khoảng cách!");
                                        }
                                      },
                                      child: Text(
                                        "Tìm kiếm",
                                        style: TextStyle(
                                            color: ColorConstants
                                                .kTextButtonColor),
                                      ),
                                      // color: Colors.red[400],
                                      // shape: RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.circular(
                                      //         Dimens
                                      //             .kDefaultBorderRadiusButton)),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/global.svg",
                                    width: (size.width * 0.8) / 2,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Thay đổi phạm vi tìm kiếm",
                          style:
                              TextStyle(color: ColorConstants.kTextButtonColor),
                        ),
                        // color: ColorConstants.kPrimaryColor,
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(
                        //         Dimens.kDefaultBorderRadiusButton)),
                      ),
                    ),
                  ],
                ),
              ));
  }
}

Iterable getData(context, List<Gskhuvuc> list, List<LopKhuVuc> list1,
    bool check, Size size) {
  if (check) {
    Iterable _markers = Iterable.generate(list.length, (index) {
      return Marker(
        markerId: MarkerId(list[index].giasuId.toString()),
        position: LatLng(
          double.parse(list[index].vido.toString()),
          double.parse(list[index].tungdo.toString()),
        ),
        infoWindow: InfoWindow(
            title: list[index].hoten,
            snippet: list[index].gioitinh,
            onTap: () => {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: size.height / 2,
                      child: GiaSuDetail1(
                        giasu: new GiaSu(
                            giasuId: list[index].giasuId,
                            email: list[index].email,
                            hoten: list[index].hoten,
                            gioitinh: list[index].gioitinh,
                            sdt: list[index].sdt,
                            nghenghiep: list[index].nghenghiep,
                            url: list[index].url,
                            hinhthucday: list[index].hinhthucday,
                            hocphi: list[index].hocphi,
                            gioithieubanthan: list[index].gioithieubanthan,
                            thoigianday: list[index].thoigianday,
                            khuvucId: list[index].khuvucId),
                      ),
                    ),
                  )
                }),
        icon: BitmapDescriptor.defaultMarker,
      );
    });
    return _markers;
  } else {
    Iterable _markers = Iterable.generate(list1.length, (index) {
      return Marker(
        markerId: MarkerId(list1[index].lopId.toString()),
        position: LatLng(
          double.parse(list1[index].vido.toString()),
          double.parse(list1[index].tungdo.toString()),
        ),
        infoWindow: InfoWindow(
          title: list1[index].tenlop,
          snippet: list1[index].hinhthuc,
          onTap: () => {
            showMaterialModalBottomSheet(
              context: context,
              builder: (context) => Container(
                height: size.height / 2,
                child: BaiDangDetail1(
                    lop: new Lop(
                        lopId: list1[index].lopId,
                        tenlop: list1[index].tenlop,
                        ngaytao: list1[index].ngaytao,
                        hinhthuc: list1[index].hinhthuc,
                        yeucaugioitinh: list1[index].yeucaugioitinh,
                        sohocvien: list1[index].sohocvien,
                        thoigianhoc: list1[index].thoigianhoc,
                        thoiluong: list1[index].thoiluong,
                        lichdukien: list1[index].lichdukien,
                        diadiem: list1[index].diadiem,
                        khuvucId: list1[index].khuvucId,
                        chudeId: list1[index].chudeId,
                        hocvienId: list1[index].hocvienId,
                        hocphidenghi: list1[index].hocphidenghi,
                        noidungyeucau: list1[index].noidungyeucau,
                        trangthai: list1[index].trangthai)),
              ),
            )
          },
        ),
        icon: BitmapDescriptor.defaultMarker,
      );
    });
    return _markers;
  }
}

Iterable refreshData(context, List<LopKhuVuc> list1, Size size) {
  Iterable _markers = Iterable.generate(list1.length, (index) {
    return Marker(
      markerId: MarkerId(list1[index].lopId.toString()),
      position: LatLng(
        double.parse(list1[index].vido.toString()),
        double.parse(list1[index].tungdo.toString()),
      ),
      infoWindow: InfoWindow(
        title: list1[index].tenlop,
        snippet: list1[index].hinhthuc,
        onTap: () => {
          showMaterialModalBottomSheet(
            context: context,
            builder: (context) => Container(
              height: size.height / 2,
              child: BaiDangDetail1(
                  lop: new Lop(
                      lopId: list1[index].lopId,
                      tenlop: list1[index].tenlop,
                      ngaytao: list1[index].ngaytao,
                      hinhthuc: list1[index].hinhthuc,
                      yeucaugioitinh: list1[index].yeucaugioitinh,
                      sohocvien: list1[index].sohocvien,
                      thoigianhoc: list1[index].thoigianhoc,
                      thoiluong: list1[index].thoiluong,
                      lichdukien: list1[index].lichdukien,
                      diadiem: list1[index].diadiem,
                      khuvucId: list1[index].khuvucId,
                      chudeId: list1[index].chudeId,
                      hocvienId: list1[index].hocvienId,
                      hocphidenghi: list1[index].hocphidenghi,
                      noidungyeucau: list1[index].noidungyeucau,
                      trangthai: list1[index].trangthai)),
            ),
          )
        },
      ),
      icon: BitmapDescriptor.defaultMarker,
    );
  });
  return _markers;
}
