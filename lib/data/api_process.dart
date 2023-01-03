import 'package:giasu_app/models/chude.dart';
import 'package:giasu_app/models/danhgia.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/giasu_khuvuc.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/models/lop_khuvuc.dart';
import 'package:giasu_app/models/lsdd.dart';

import 'api_services.dart';

class ProcessData {
  //Get list data
  Future<List<GiaSu>> getListGiaSu() async {
    List<GiaSu> lst = <GiaSu>[];
    await ApiServices().fetchGiaSu().then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<HocVien>> getListHocVien() async {
    List<HocVien> lst = <HocVien>[];
    await ApiServices().fetchHocVien().then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<Lop>> getListLop() async {
    List<Lop> lst = <Lop>[];
    await ApiServices().fetchLop().then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<Lop>> getListLopHV(String idhv) async {
    List<Lop> lst = <Lop>[];
    await ApiServices().fetchLopHV(idhv).then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<Gskhuvuc>> getListGSKV() async {
    List<Gskhuvuc> lst = <Gskhuvuc>[];
    await ApiServices().fetchGiaSuKV().then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<LopKhuVuc>> getListLopKV() async {
    List<LopKhuVuc> lst = <LopKhuVuc>[];
    await ApiServices().fetchLopKV().then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<Lop>> getListLopDeNghi(int idgs, String trangthai) async {
    List<Lop> lst = <Lop>[];
    await ApiServices()
        .fetchLopDeNghi(idgs.toString(), trangthai)
        .then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<Lop>> getListLopCheck(int idgs) async {
    List<Lop> lst = <Lop>[];
    await ApiServices().fetchLopCheck(idgs.toString()).then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<GiaSu>> getListGiaSuDeNghi(int idlop, String trangthai) async {
    List<GiaSu> lst = <GiaSu>[];
    await ApiServices()
        .fetchGiaSuDeNghi(idlop.toString(), trangthai)
        .then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<Lop>> getListTinhTrangLop(String tinhtrang) async {
    List<Lop> lst = <Lop>[];
    await ApiServices().fetchTinhTrangLop(tinhtrang).then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<Lop>> getListLopHocVienDeNghi(int idhv, String trangthai) async {
    List<Lop> lst = <Lop>[];
    await ApiServices()
        .fetchLopHocVienDeNghi(idhv.toString(), trangthai)
        .then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<Lop>> getLengthLop(String idhv, String trangthai) async {
    List<Lop> lst = <Lop>[];
    await ApiServices().fetchLengthLop(idhv, trangthai).then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<KhuVuc>> getListKhuVuc() async {
    List<KhuVuc> lst = <KhuVuc>[];
    await ApiServices().fetchKhuVuc().then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<ChuDe>> getListChuDe() async {
    List<ChuDe> lst = <ChuDe>[];
    await ApiServices().fetchChuDe().then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<DanhGia>> getListDanhGia(int id) async {
    List<DanhGia> lst = <DanhGia>[];
    await ApiServices().fetchComment(id).then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<DanhGia>> getListDanhGiaId(int idgs, int idhv) async {
    List<DanhGia> lst = <DanhGia>[];
    await ApiServices().fetchCommentId(idgs, idhv).then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<Lop>> searchLop(String value) async {
    List<Lop> lst = <Lop>[];
    await ApiServices().searhLop(value).then((value) {
      lst = value;
    });
    return lst;
  }

  Future<List<GiaSu>> searchGiaSu(String value) async {
    List<GiaSu> lst = <GiaSu>[];
    await ApiServices().searhGiaSu(value).then((value) {
      lst = value;
    });
    return lst;
  }

  Future<LSDD> getLSDD(int id) async {
    LSDD gs = new LSDD();
    await ApiServices().fetchLSDD(id).then(
      (value) {
        gs = value;
      },
    );
    return gs;
  }

  Future<HocVien> getHocVienId(int id) async {
    HocVien hv = new HocVien();
    await ApiServices().fetchHocVienId(id).then(
      (value) {
        hv = value;
      },
    );
    return hv;
  }

  //Login user
  Future<GiaSu> loginGiaSu(GiaSu giasu) async {
    GiaSu gs = new GiaSu();
    await ApiServices().loginGiaSu(giasu).then(
      (value) {
        gs = value;
      },
    );
    return gs;
  }

  Future<HocVien> loginHocVien(HocVien hocvien) async {
    HocVien hv = new HocVien();
    await ApiServices().loginHocVien(hocvien).then(
      (value) {
        hv = value;
      },
    );
    return hv;
  }

  //Registed user
  Future<GiaSu> registedGiaSu(GiaSu giasu) async {
    GiaSu gs = new GiaSu();
    await ApiServices().registedGiaSu(giasu).then(
      (value) {
        gs = value;
      },
    );
    return gs;
  }

  Future<HocVien> registedHocVien(HocVien hocvien) async {
    HocVien hv = new HocVien();
    await ApiServices().registedHocVien(hocvien).then(
      (value) {
        hv = value;
      },
    );
    return hv;
  }

  //Update
  Future<GiaSu> updatepassGiaSu(GiaSu giasu) async {
    GiaSu gs = new GiaSu();
    await ApiServices().updatePassGiaSu(giasu).then(
      (value) {
        gs = value;
      },
    );
    return gs;
  }

  Future<HocVien> updatepassHocVien(HocVien hocvien) async {
    HocVien hv = new HocVien();
    await ApiServices().updatePassHocVien(hocvien).then(
      (value) {
        hv = value;
      },
    );
    return hv;
  }

  Future<bool> updateTinhTrang(int idgs, int idlop, int tinhtrang) async {
    return await ApiServices().updateTinhTrang(idgs, idlop, tinhtrang);
  }

  Future<GiaSu> updateTKGiaSu(GiaSu giasu) async {
    GiaSu gs = new GiaSu();
    await ApiServices().updateTKGiaSu(giasu).then(
      (value) {
        gs = value;
      },
    );
    return gs;
  }

  Future<HocVien> updateTKHocVien(HocVien hocvien) async {
    HocVien hv = new HocVien();
    await ApiServices().updateTKHocVien(hocvien).then(
      (value) {
        hv = value;
      },
    );
    return hv;
  }

  Future<bool> sendRequest(int gsId, int lopId) async {
    var check = false;
    await ApiServices().sendRequest(gsId, lopId).then(
      (value) {
        check = value;
      },
    );
    return check;
  }

  Future<bool> requestAddClass(int idhv, Lop lop) async {
    var check = false;
    await ApiServices().RequestAddClass(idhv, lop).then(
      (value) {
        check = value;
      },
    );
    return check;
  }

  Future<bool> checkRequest(int gsId, int lopId) async {
    var check = false;
    await ApiServices().fetchDeNghi(gsId, lopId).then(
      (value) {
        check = value;
      },
    );

    return check;
  }

  Future<bool> postComment(DanhGia danhgia) async {
    var check = false;
    await ApiServices().postComment(danhgia).then(
      (value) {
        check = value;
      },
    );

    return check;
  }

  Future<bool> updateComment(DanhGia danhgia, int ck) async {
    var check = false;
    await ApiServices().updateDanhGia(danhgia, ck).then(
      (value) {
        check = value;
      },
    );

    return check;
  }

  //Delete
  Future<bool> delteDenghi(String idgs, String idlop) async {
    var check = false;
    await ApiServices().deleteDenghi(idgs, idlop).then(
      (value) {
        check = value;
      },
    );

    return check;
  }
}
