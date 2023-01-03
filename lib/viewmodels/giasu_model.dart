import 'package:flutter/foundation.dart';
import 'package:giasu_app/data/api_process.dart';
import 'package:giasu_app/models/danhgia.dart';

import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/giasu_khuvuc.dart';
import 'package:giasu_app/models/lop_khuvuc.dart';

class GiaSuModel extends ChangeNotifier {
  final ProcessData _processData = new ProcessData();

  List<GiaSu> _lstGiaSu = <GiaSu>[];
  List<GiaSu> get lstGiaSu => _lstGiaSu;

  GiaSu _giaSu = new GiaSu();
  GiaSu get giaSu => _giaSu;

  void setState(List<GiaSu> lstGiaSu) {
    _lstGiaSu = lstGiaSu;
    notifyListeners();
  }

  void setState1(GiaSu giasu) {
    _giaSu = giasu;
    notifyListeners();
  }

  void getListGiaSu() {
    _processData.getListGiaSu().then((value) {
      setState(value);
    });
  }

  void getListGiaSuDeNghi(int idlop, String trangthai) {
    _processData.getListGiaSuDeNghi(idlop, trangthai).then((value) {
      setState(value);
    });
  }

  Future<bool> loginGiaSu(GiaSu gs) async {
    var check = false;
    await _processData.loginGiaSu(gs).then((value) {
      if (value.giasuId != null) {
        setState1(value);
        check = true;
      } else {
        check = false;
      }
    });
    return check;
  }

  Future<bool> updatepassGiaSu(GiaSu gs) async {
    var check = false;
    await _processData.updatepassGiaSu(gs).then((value) {
      if (value.tendangnhap != null) {
        check = true;
      }
    });
    return check;
  }

  Future<bool> updateTKGiaSu(GiaSu gs) async {
    var check = false;
    await _processData.updateTKGiaSu(gs).then((value) {
      if (value.tendangnhap != null) {
        check = true;
      }
    });
    return check;
  }

  Future<bool> registedGiaSu(GiaSu gs) async {
    var check = false;
    await _processData.registedGiaSu(gs).then((value) {
      if (value.giasuId != null) {
        setState1(value);
        check = true;
      } else {
        check = false;
      }
    });
    return check;
  }

  Future<List<DanhGia>> getListDanhGia(int id) async {
    List<DanhGia> lst = <DanhGia>[];
    await _processData.getListDanhGia(id).then((value) {
      if (value.length > 0) {
        lst = value;
      }
    });
    return lst;
  }

  Future<List<Gskhuvuc>> getListGSKV() async {
    List<Gskhuvuc> lst = <Gskhuvuc>[];
    await _processData.getListGSKV().then((value) {
      if (value.length > 0) {
        lst = value;
      }
    });
    return lst;
  }

  Future<List<LopKhuVuc>> getListLopKV() async {
    List<LopKhuVuc> lst = <LopKhuVuc>[];
    await _processData.getListLopKV().then((value) {
      if (value.length > 0) {
        lst = value;
      }
    });
    return lst;
  }

  Future<bool> checkDanhGia(int idgs, int idhv) async {
    var check = false;
    await _processData.getListDanhGiaId(idgs, idhv).then((value) {
      if (value.length > 0) {
        check = true;
      }
    });
    return check;
  }

  void searchGiaSu(String key) {
    _processData.searchGiaSu(key).then((value) {
      if (value.length > 0) {
        setState(value);
      } else {
        getListGiaSu();
      }
    });
  }

  Future<bool> deleteDenghi(String idgs, String idlop) async {
    var check = false;
    await _processData.delteDenghi(idgs, idlop).then((value) {
      check = true;
    });
    return check;
  }
}
