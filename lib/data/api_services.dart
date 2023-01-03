import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:giasu_app/models/chude.dart';
import 'package:giasu_app/models/danhgia.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/giasu_khuvuc.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/models/lop_khuvuc.dart';
import 'package:giasu_app/models/lsdd.dart';
import 'package:crypto/crypto.dart';

import 'api_urls.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<GiaSu>> fetchGiaSu() async {
    return await http
        .get(ApiUrls().fetchGiaSu("/giasus"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<GiaSu> lst = <GiaSu>[];
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 201 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return lst;
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      lst =
          userList.map((contactRaw) => new GiaSu.fromJson(contactRaw)).toList();
      return lst;
    });
  }

  Future<List<HocVien>> fetchHocVien() async {
    return await http
        .get(ApiUrls().fetchHocVien("/hocviens"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<HocVien> lst = <HocVien>[];
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 201 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return lst;
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      lst = userList
          .map((contactRaw) => new HocVien.fromJson(contactRaw))
          .toList();
      return lst;
    });
  }

  Future<HocVien> fetchHocVienId(int id) async {
    return await http
        .get(ApiUrls().fetchHocVien("/hocvien/$id"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      HocVien hocvien = new HocVien();
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 201 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return hocvien;
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      hocvien = HocVien.fromJson(userList[0]);
      return hocvien;
    });
  }

  Future<List<Lop>> fetchLop() async {
    return await http
        .get(ApiUrls().fetchLop("/lop/1"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<Lop> lst = <Lop>[];
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 201 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return lst;
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];

      lst = userList.map((contactRaw) => new Lop.fromJson(contactRaw)).toList();
      return lst;
    });
  }

  Future<List<Lop>> fetchLopHV(String idhv) async {
    return await http
        .get(ApiUrls().fetchLop("/lop/1/$idhv"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<Lop> lst = <Lop>[];
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 201 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return lst;
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];

      lst = userList.map((contactRaw) => new Lop.fromJson(contactRaw)).toList();
      return lst;
    });
  }

  Future<List<KhuVuc>> fetchKhuVuc() async {
    return await http
        .get(ApiUrls().fetchKhuVuc("/khuvucs"))
        .then((http.Response response) {
      List<KhuVuc> lst = <KhuVuc>[];
      final String jsonBody = response.body;
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode != 200 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return lst;
      }
      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      return userList
          .map((contactRaw) => new KhuVuc.fromJson(contactRaw))
          .toList();
    });
  }

  Future<List<ChuDe>> fetchChuDe() async {
    return await http
        .get(ApiUrls().fetchKhuVuc("/chudes"))
        .then((http.Response response) {
      List<ChuDe> lst = <ChuDe>[];
      final String jsonBody = response.body;
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode != 200 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return lst;
      }
      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      return userList
          .map((contactRaw) => new ChuDe.fromJson(contactRaw))
          .toList();
    });
  }

  Future<List<DanhGia>> fetchComment(int id) async {
    return await http
        .get(ApiUrls().fetchGiaSu("/danhgia/$id"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<DanhGia> lst = <DanhGia>[];
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode != 200 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return lst;
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      lst = userList
          .map((contactRaw) => new DanhGia.fromJson(contactRaw))
          .toList();
      return lst;
    });
  }

  Future<List<DanhGia>> fetchCommentId(int idgs, int idhv) async {
    return await http
        .get(ApiUrls().fetchGiaSu("/danhgia/$idgs/$idhv"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<DanhGia> lst = <DanhGia>[];
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode != 200 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return lst;
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      lst = userList
          .map((contactRaw) => new DanhGia.fromJson(contactRaw))
          .toList();
      return lst;
    });
  }

  Future<LSDD> fetchLSDD(int id) async {
    return await http
        .get(ApiUrls().fetchLop("/lsdd/$id"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      LSDD a = new LSDD();
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }

      if (response.statusCode == 201 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
      } else {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];

        a = LSDD.fromJson(userList[0]);
      }

      return a;
    });
  }

  Future<List<Gskhuvuc>> fetchGiaSuKV() async {
    return await http
        .get(ApiUrls().fetchLop("/giasukhuvuc"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<Gskhuvuc> a = <Gskhuvuc>[];
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }

      if (response.statusCode == 201 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
      } else {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];

        a = userList
            .map((contactRaw) => new Gskhuvuc.fromJson(contactRaw))
            .toList();
      }
      print(a);
      return a;
    });
  }

  Future<List<LopKhuVuc>> fetchLopKV() async {
    return await http
        .get(ApiUrls().fetchLop("/lopkhuvuc"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<LopKhuVuc> a = <LopKhuVuc>[];
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }

      if (response.statusCode == 201 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
      } else {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];

        a = userList
            .map((contactRaw) => new LopKhuVuc.fromJson(contactRaw))
            .toList();
      }
      print(a);
      return a;
    });
  }

  Future<GiaSu> loginGiaSu(GiaSu gs) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
    }
    print(generateMd5(gs.matkhau.toString()));
    return await http
        .post(
      ApiUrls().fetchGiaSu("/giasu"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'TENDANGNHAP': gs.tendangnhap,
        'MATKHAU': generateMd5(gs.matkhau.toString())
      }),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;
      GiaSu a = new GiaSu();
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }

      if (response.statusCode == 201 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
      } else {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];

        a = GiaSu.fromJson(userList[0]);
      }

      return a;
    });
  }

  Future<HocVien> loginHocVien(HocVien hv) async {
    return await http
        .post(
      ApiUrls().fetchHocVien("/hocvien"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'TENDANGNHAP': hv.tendangnhap,
        'MATKHAU': generateMd5(hv.matkhau.toString())
      }),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;
      HocVien a = new HocVien();
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 201 || response.body == null) {
        print(response.statusCode);

        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
      } else {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];

        a = HocVien.fromJson(userList[0]);
      }

      return a;
    });
  }

  Future<HocVien> registedHocVien(HocVien hv) async {
    return await http
        .post(
      ApiUrls().fetchHocVien("/hocvienI"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'HOCVIEN_ID': 1,
        'EMAIL': hv.email,
        'TENDANGNHAP': hv.tendangnhap,
        'MATKHAU': generateMd5(hv.matkhau.toString()),
        'HOTEN': "",
        'GIOITINH': "",
        'SDT': "",
        'DIACHI': "",
        'URL':
            "https://www.focusedu.org/wp-content/uploads/2018/12/circled-user-male-skin-type-1-2.png"
      }),
    )
        .then((http.Response response) {
      HocVien a = new HocVien();
      final String jsonBody = response.body;
      if (response.statusCode != 201 && response.statusCode != 404) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 404 || response.body.length <= 0) {
        print(response.statusCode);

        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
      } else {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];

        a = HocVien.fromJson(userList[0]);
      }

      return a;
    });
  }

  Future<GiaSu> registedGiaSu(GiaSu gs) async {
    String username = gs.tendangnhap.toString();
    String email = gs.email.toString();
    String password = generateMd5(gs.matkhau.toString());
    return await http
        .post(
      ApiUrls().fetchGiaSu("/giasuI"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'GIASU_ID': 1,
        'EMAIL': email,
        'TENDANGNHAP': username,
        'MATKHAU': password,
        'HOTEN': "",
        'GIOITINH': "",
        'SDT': "",
        'NGHENGHIEP': "",
        'URL':
            "https://www.focusedu.org/wp-content/uploads/2018/12/circled-user-male-skin-type-1-2.png",
        'HINHTHUCDAY': "",
        'HOCPHI': 0,
        'GIOITHIEUBANTHAN': "",
        'THOIGIANDAY': "",
        'POINT_GS': 0,
        'KHUVUC_ID': 34
      }),
    )
        .then((http.Response response) {
      GiaSu a = new GiaSu();
      final String jsonBody = response.body;
      if (response.statusCode != 201 && response.statusCode != 404) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 404 || response.body.length <= 0) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
      } else {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];
        a = GiaSu.fromJson(userList[0]);
      }
      return a;
    });
  }

  Future<List<Lop>> fetchLopDeNghi(String id, String trangthai) async {
    return await http
        .get(ApiUrls().fetchLop("/lopdenghi/$id/$trangthai"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<Lop> lst = <Lop>[];
      if (response.statusCode != 201 && response.statusCode != 200) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode != 200 || response.body == null) {
        print(response.statusCode);
        return lst;
      }
      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      lst = userList.map((contactRaw) => new Lop.fromJson(contactRaw)).toList();
      return lst;
    });
  }

  Future<List<Lop>> fetchLopCheck(String idgs) async {
    return await http
        .get(ApiUrls().fetchLop("/lopcheck/$idgs"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<Lop> lst = <Lop>[];
      if (response.statusCode != 201 && response.statusCode != 200) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode != 200 || response.body == null) {
        print(response.statusCode);
        return lst;
      }
      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      lst = userList.map((contactRaw) => new Lop.fromJson(contactRaw)).toList();
      return lst;
    });
  }

  Future<List<GiaSu>> fetchGiaSuDeNghi(String idlop, String trangthai) async {
    return await http
        .get(ApiUrls().fetchLop("/giasudenghi/$idlop/$trangthai"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<GiaSu> lst = <GiaSu>[];
      if (response.statusCode != 201 && response.statusCode != 200) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 201 || response.body == null) {
        print(response.statusCode);
        return lst;
      }
      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      lst =
          userList.map((contactRaw) => new GiaSu.fromJson(contactRaw)).toList();
      return lst;
    });
  }

  Future<List<Lop>> fetchTinhTrangLop(String tinhtrang) async {
    return await http
        .get(ApiUrls().fetchLop("/tinhtrangLop/$tinhtrang"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<Lop> lst = <Lop>[];
      if (response.statusCode != 201 && response.statusCode != 200) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 201 || response.body == null) {
        print(response.statusCode);
        return lst;
      }
      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      lst = userList.map((contactRaw) => new Lop.fromJson(contactRaw)).toList();
      return lst;
    });
  }

  Future<List<Lop>> fetchLopHocVienDeNghi(String id, String trangthai) async {
    return await http
        .get(ApiUrls().fetchLop("/lopdenghihocvien/$id/$trangthai"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<Lop> lst = <Lop>[];
      if (response.statusCode != 201 && response.statusCode != 200) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode != 200 || response.body == null) {
        print(response.statusCode);
        return lst;
      }
      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      lst = userList.map((contactRaw) => new Lop.fromJson(contactRaw)).toList();
      return lst;
    });
  }

  Future<List<Lop>> fetchLengthLop(String id, String trangthai) async {
    return await http
        .get(ApiUrls().fetchLop("/lengthlop/$id/$trangthai"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      List<Lop> lst = <Lop>[];
      if (response.statusCode != 201 && response.statusCode != 200) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode != 200 || response.body == null) {
        print(response.statusCode);
        return lst;
      }
      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      lst = userList.map((contactRaw) => new Lop.fromJson(contactRaw)).toList();
      return lst;
    });
  }

  Future<bool> fetchDeNghi(int idgs, int idlop) async {
    return await http
        .get(ApiUrls().fetchLop("/lopdenghi1/$idgs/$idlop"))
        .then((http.Response response) {
      final String jsonBody = response.body;
      if (response.statusCode != 201 && response.statusCode != 200) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode != 200 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        return false;
      }

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    });
  }

  Future<bool> postComment(DanhGia danhgia) async {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    return await http
        .post(
      ApiUrls().fetchLop("/danhgiaI"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "HOCVIEN_ID": danhgia.hocvienId,
        "GIASU_ID": danhgia.giasuId,
        "THOIGIAN": "$date",
        "GIASU_HOCVIEN": danhgia.giasuHocvien,
        "HOCVIEN_GIASU": danhgia.hocvienGiasu,
        "SOSAO": danhgia.sosao,
        "YEUTHICH": danhgia.yeuthich
      }),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;
      if (response.statusCode != 201 && response.statusCode != 200) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 404 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        return false;
      }

      if (response.statusCode == 201) {
        return true;
      }
      return false;
    });
  }

  Future<GiaSu> updatePassGiaSu(GiaSu gs) async {
    String username = gs.tendangnhap.toString();
    String email = gs.email.toString();
    String password = generateMd5(gs.matkhau.toString());
    print(username);
    return await http
        .put(
      ApiUrls().fetchGiaSu("/giasupassU"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
          {'EMAIL': email, 'TENDANGNHAP': username, 'MATKHAU': password}),
    )
        .then((http.Response response) {
      print(response.statusCode);
      GiaSu a = new GiaSu();
      final String jsonBody = response.body;

      if (response.statusCode != 201 && response.statusCode != 404) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }

      if (response.statusCode == 404 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
      }
      if (response.statusCode == 201) {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];

        a = GiaSu.fromJson(userList[0]);
      }
      return a;
    });
  }

  Future<bool> updateTinhTrang(int idgs, int idlop, int tinhtrang) async {
    return await http
        .put(
      ApiUrls().fetchGiaSu("/tinhtrangU"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
          {'GIASU_ID': idgs, 'LOP_ID': idlop, 'TINHTRANG': tinhtrang}),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;

      if (response.statusCode != 201 && response.statusCode != 404) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }

      if (response.statusCode == 404 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return false;
      }
      if (response.statusCode == 201) {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];

        return true;
      }
      return false;
    });
  }

  Future<bool> updateDanhGia(DanhGia danhgia, int check) async {
    print(danhgia.sosao);
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    return await http
        .put(
      ApiUrls().fetchGiaSu("/danhgiaU"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'HOCVIEN_ID': danhgia.hocvienId,
        "GIASU_ID": danhgia.giasuId,
        "THOIGIAN": '$date',
        "HOCVIEN_GIASU": '${danhgia.hocvienGiasu}',
        "GIASU_HOCVIEN": '${danhgia.giasuHocvien}',
        "SOSAO": danhgia.sosao,
        "YEUTHICH": danhgia.yeuthich,
        "CHECK": check
      }),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;

      if (response.statusCode != 201 && response.statusCode != 404) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }

      if (response.statusCode == 404 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return false;
      }
      if (response.statusCode == 201) {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];

        return true;
      }
      return false;
    });
  }

  Future<HocVien> updatePassHocVien(HocVien hv) async {
    String username = hv.tendangnhap.toString();
    String email = hv.email.toString();
    String password = generateMd5(hv.matkhau.toString());
    print(username);
    return await http
        .put(
      ApiUrls().fetchGiaSu("/hocvienpassU"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
          {'EMAIL': email, 'TENDANGNHAP': username, 'MATKHAU': password}),
    )
        .then((http.Response response) {
      print(response.statusCode);
      HocVien a = new HocVien();
      final String jsonBody = response.body;

      if (response.statusCode != 201 && response.statusCode != 404) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }

      if (response.statusCode == 404 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
      }
      if (response.statusCode == 201) {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];

        a = HocVien.fromJson(userList[0]);
      }
      return a;
    });
  }

  Future<GiaSu> updateTKGiaSu(GiaSu gs) async {
    return await http
        .put(
      ApiUrls().fetchGiaSu("/giasutkU"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'GIASU_ID': gs.giasuId,
        'EMAIL': gs.email,
        'TENDANGNHAP': gs.tendangnhap,
        'MATKHAU': generateMd5(gs.matkhau.toString()),
        'HOTEN': gs.hoten,
        'GIOITINH': gs.gioitinh,
        'SDT': gs.sdt,
        'NGHENGHIEP': gs.nghenghiep,
        'URL':
            "https://www.focusedu.org/wp-content/uploads/2018/12/circled-user-male-skin-type-1-2.png",
        'HINHTHUCDAY': gs.hinhthucday,
        'HOCPHI': gs.hocphi,
        'GIOITHIEUBANTHAN': gs.gioithieubanthan,
        'THOIGIANDAY': gs.thoigianday,
        'POINT_GS': 0,
        'KHUVUC_ID': gs.khuvucId
      }),
    )
        .then((http.Response response) {
      GiaSu a = new GiaSu();
      final String jsonBody = response.body;

      if (response.statusCode != 201 && response.statusCode != 404) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 404 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
      }
      if (response.statusCode == 201) {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];

        a = GiaSu.fromJson(userList[0]);
      }
      return a;
    });
  }

  Future<HocVien> updateTKHocVien(HocVien hv) async {
    return await http
        .put(
      ApiUrls().fetchGiaSu("/hocvientkU"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'HOCVIEN_ID': hv.hocvienId,
        'EMAIL': hv.email,
        'TENDANGNHAP': hv.tendangnhap,
        'MATKHAU': generateMd5(hv.matkhau.toString()),
        'HOTEN': hv.hoten,
        'GIOITINH': hv.gioitinh,
        'SDT': hv.sdt,
        'DIACHI': hv.diachi,
      }),
    )
        .then((http.Response response) {
      HocVien a = new HocVien();
      final String jsonBody = response.body;

      if (response.statusCode != 201 && response.statusCode != 404) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 404 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
      }
      if (response.statusCode == 201) {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];

        a = HocVien.fromJson(userList[0]);
      }
      return a;
    });
  }

  Future<bool> sendRequest(int gsId, int lopId) async {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    return await http
        .post(
      ApiUrls().fetchLop("/denghiI"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "GIASU_ID": gsId,
        "LOP_ID": lopId,
        "THOIGIAN": "$date",
        "NOIDUNG": "Đề nghị xin dạy lớp",
        "TINHTRANG": 0
      }),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;
      if (response.statusCode != 201 && response.statusCode != 404) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 404 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        return false;
      } else {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];
        return true;
      }
    });
  }

  Future<bool> deleteDenghi(String gsId, String lopId) async {
    return await http
        .delete(
      ApiUrls().fetchLop("/denghiD/$gsId/$lopId"),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;
      if (response.statusCode != 201 && response.statusCode != 404) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 404 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        return false;
      } else {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];
        return true;
      }
    });
  }

  Future<bool> RequestAddClass(int idhv, Lop lop) async {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    return await http
        .post(
      ApiUrls().fetchLop("/lopI"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "LOP_ID": "",
        "TENLOP": lop.tenlop,
        "NGAYTAO": "$date",
        "HINHTHUC": lop.hinhthuc,
        "YEUCAUGIOITINH": lop.yeucaugioitinh,
        "SOHOCVIEN": lop.sohocvien,
        "THOIGIANHOC": "${lop.thoigianhoc}",
        "THOILUONG": lop.thoiluong,
        "LICHDUKIEN": lop.lichdukien,
        "DIADIEM": lop.diadiem,
        "KHUVUC_ID": lop.khuvucId,
        "CHUDE_ID": lop.chudeId,
        "HOCVIEN_ID": idhv,
        "HOCPHIDENGHI": lop.hocphidenghi,
        "NOIDUNGYEUCAU": lop.noidungyeucau,
        "TRANGTHAI": 0
      }),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;
      if (response.statusCode != 201 && response.statusCode != 404) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      if (response.statusCode == 404 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        return false;
      } else {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];
        return true;
      }
    });
  }

  Future<List<Lop>> searhLop(String value) async {
    return await http
        .post(
      ApiUrls().fetchLop("/lopsearch"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "TENLOP": value,
        "YEUCAUGIOITINH": value,
        "HINHTHUC": value,
        "DIADIEM": value
      }),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;
      if (response.statusCode != 404 && response.statusCode != 200) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      List<Lop> lst = <Lop>[];
      if (response.statusCode == 404 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return lst;
      } else {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];
        lst =
            userList.map((contactRaw) => new Lop.fromJson(contactRaw)).toList();
        return lst;
      }
    });
  }

  Future<List<GiaSu>> searhGiaSu(String value) async {
    return await http
        .post(
      ApiUrls().fetchLop("/giasu3"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "NOIDUNG": value,
      }),
    )
        .then((http.Response response) {
      final String jsonBody = response.body;
      if (response.statusCode != 404 && response.statusCode != 200) {
        print(response.statusCode);
        throw new Exception("Lỗi load api");
      }
      List<GiaSu> lst = <GiaSu>[];
      if (response.statusCode == 404 || response.body == null) {
        print(response.statusCode);
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final String userList = useListContainer['message'];
        print(userList);
        return lst;
      } else {
        final JsonDecoder _decoder = new JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List userList = useListContainer['data'];
        lst = userList
            .map((contactRaw) => new GiaSu.fromJson(contactRaw))
            .toList();
        return lst;
      }
    });
  }
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
