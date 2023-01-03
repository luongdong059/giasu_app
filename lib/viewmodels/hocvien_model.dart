import 'package:flutter/foundation.dart';
import 'package:giasu_app/data/api_process.dart';
import 'package:giasu_app/models/danhgia.dart';

import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/hocvien.dart';

class HocVienModel extends ChangeNotifier {
  final ProcessData _processData = new ProcessData();

  List<HocVien> _lstHocVien = <HocVien>[];
  List<HocVien> get lstHocVien => _lstHocVien;

  HocVien _hocVien = new HocVien();
  HocVien get hocVien => _hocVien;

  void setState(List<HocVien> lstHocVien) {
    _lstHocVien = lstHocVien;
    notifyListeners();
  }

  void setState1(HocVien hocvien) {
    _hocVien = hocvien;
    notifyListeners();
  }

  void getListHocVien() {
    _processData.getListHocVien().then((value) {
      setState(value);
    });
  }

  Future<void> getHocVienId(int id) async {
    await _processData.getHocVienId(id).then((value) {
      setState1(value);
    });
  }

  Future<bool> updateTKHocVien(HocVien hv) async {
    var check = false;
    await _processData.updateTKHocVien(hv).then((value) {
      if (value.tendangnhap != null) {
        check = true;
      }
    });
    return check;
  }

  Future<bool> postComment(DanhGia danhgia) async {
    var check = false;
    await _processData.postComment(danhgia).then((value) {
      check = value;
    });
    return check;
  }

  Future<bool> updateComment(DanhGia danhgia, int ck) async {
    var check = false;
    await _processData.updateComment(danhgia, ck).then((value) {
      check = value;
    });
    return check;
  }

  Future<bool> updatepassHocVien(HocVien hv) async {
    var check = false;
    await _processData.updatepassHocVien(hv).then((value) {
      if (value.tendangnhap != null) {
        check = true;
      }
    });
    return check;
  }

  Future<bool> loginHocVien(HocVien hv) async {
    var check = true;
    await _processData.loginHocVien(hv).then((value) {
      if (value.hocvienId != null) {
        setState1(value);
        check = true;
      } else {
        check = false;
      }
    });
    return check;
  }

  Future<bool> registedHocVien(HocVien hv) async {
    var check = true;
    await _processData.registedHocVien(hv).then((value) {
      if (value.hocvienId != null) {
        setState1(value);
        check = true;
      } else {
        check = false;
      }
    });
    return check;
  }
}
