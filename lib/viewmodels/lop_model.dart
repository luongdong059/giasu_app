import 'package:flutter/foundation.dart';
import 'package:giasu_app/data/api_process.dart';
import 'package:giasu_app/models/chude.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/models/lsdd.dart';

class LopModel extends ChangeNotifier {
  final ProcessData _processData = new ProcessData();

  List<Lop> _lstLopTT = <Lop>[];
  List<Lop> get lstLopTT => _lstLopTT;

  List<Lop> _lstLop = <Lop>[];
  List<Lop> get lstLop => _lstLop;

  List<Lop> _lstLop1 = <Lop>[];
  List<Lop> get lstLop1 => _lstLop1;

  List<Lop> _lstLopCheck = <Lop>[];
  List<Lop> get lstLopCheck => _lstLopCheck;

  List<KhuVuc> _lstKhuVuc = <KhuVuc>[];
  List<KhuVuc> get lstKhuVuc => _lstKhuVuc;

  List<ChuDe> _lstChuDe = <ChuDe>[];
  List<ChuDe> get lstChuDe => _lstChuDe;

  Lop _lop = new Lop();
  Lop get lop => _lop;

  void setState(List<Lop> lstlop) {
    _lstLop = lstlop;
    notifyListeners();
  }

  void setState1(List<KhuVuc> lstkhuvuc) {
    _lstKhuVuc = lstkhuvuc;
    notifyListeners();
  }

  void setState2(List<Lop> lstlop) {
    _lstLop1 = lstlop;
    notifyListeners();
  }

  void setState3(List<Lop> lstLop) {
    _lstLopTT = lstLop;
    notifyListeners();
  }

  void setState4(List<ChuDe> lstChuDe) {
    _lstChuDe = lstChuDe;
    notifyListeners();
  }

  void setState5(List<Lop> lstLop) {
    _lstLopCheck = lstLopCheck;
    notifyListeners();
  }

  void getListLop() {
    _processData.getListLop().then((value) {
      setState(value);
    });
  }

  void getListLopHV(String idhv) {
    _processData.getListLopHV(idhv).then((value) {
      setState2(value);
    });
  }

  void getListLopDeNghi(int idgs, String trangthai) {
    _processData.getListLopDeNghi(idgs, trangthai).then((value) {
      if (trangthai == "1") {
        setState(value);
      } else {
        setState2(value);
      }
    });
  }

  void getListLopTT(String tinhtrang) {
    _processData.getListTinhTrangLop(tinhtrang).then((value) {
      if (value.length > 0) {
        setState3(value);
      }
    });
  }

  Future<List<Lop>> getListLopCheck(int idgs) async {
    List<Lop> lst = <Lop>[];
    await _processData.getListLopCheck(idgs).then((value) {
      if (value.length > 0) {
        setState5(value);
        lst = value;
      }
    });
    return lst;
  }

  void getListLopHocVienDeNghi(int idhv, String trangthai) {
    _processData.getListLopHocVienDeNghi(idhv, trangthai).then((value) {
      if (trangthai == "1") {
        setState(value);
      } else {
        setState2(value);
      }
    });
  }

  Future<int> getLength(String idhv, String trangthai) async {
    var length = 0;
    await _processData.getLengthLop(idhv, trangthai).then((value) {
      length = value.length;
    });
    return length;
  }

  void getListKhuVuc() {
    _processData.getListKhuVuc().then((value) {
      setState1(value);
    });
  }

  void getListChuDe() {
    _processData.getListChuDe().then((value) {
      setState4(value);
    });
  }

  Future<bool> sendRequest(int gsId, int lopId) async {
    var check = true;
    await _processData.sendRequest(gsId, lopId).then((value) {
      return check = value;
    });
    return check;
  }

  Future<bool> requestAddLop(int idhv, Lop lop) async {
    var check = true;
    await _processData.requestAddClass(idhv, lop).then((value) {
      return check = value;
    });
    return check;
  }

  Future<bool> updateTinhTrang(int idgs, int idlop, int tinhtrang) async {
    var check = false;
    await _processData.updateTinhTrang(idgs, idlop, tinhtrang).then((value) {
      return check = value;
    });
    return check;
  }

  Future<LSDD> getLSDD(int id) async {
    LSDD lsdd = new LSDD();
    await _processData.getLSDD(id).then((value) {
      lsdd = value;
    });
    return lsdd;
  }

  Future<bool> checkRequest(int gsId, int lopId) async {
    var check = false;
    await _processData.checkRequest(gsId, lopId).then((value) {
      return check = value;
    });
    return check;
  }

  void searchLop(String key) {
    _processData.searchLop(key).then((value) {
      if (value.length > 0) {
        setState(value);
      } else {
        getListLop();
      }
    });
  }
}
