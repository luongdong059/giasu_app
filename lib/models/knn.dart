import 'dart:math' as math;

import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/models/lop_khuvuc.dart';

distance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295; // Math.PI / 180
  var c = math.cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;

  return 12742 * math.asin(math.sqrt(a)); // 2 * R; R = 6371 km
}

class Model_KNN {
  //Khai báo
  late int m, k = 4;

  List<LopKhuVuc> data = <LopKhuVuc>[];
  List<LopKhuVuc> data_khoangcach = <LopKhuVuc>[];
  List<LopKhuVuc> data_out = <LopKhuVuc>[];

  //Hàm tính khoảng cách
  distance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295; // Math.PI / 180
    var c = math.cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;

    return 12742 * math.asin(math.sqrt(a)); // 2 * R; R = 6371 km
  }

  // //Hàm lấy lấy khoảng cách của từng dòng dữ liệu
  void getDistance(double lat, double lon) {
    m = 0;
    for (int i = 0; i < data.length; i++) {
      LopKhuVuc a = new LopKhuVuc();
      a.tungdo = distance(lat, lon, double.parse(data[i].vido.toString()),
          double.parse(data[i].tungdo.toString()));
      a.lopId = data[i].lopId;
      data_khoangcach.insert(m, a);
      m++;
    }
  }

  // //Hàm sắp xếp tăng
  void sortIncrease() {
    for (int i = 0; i < m - 1; i++) {
      for (int j = i + 1; j < m; j++) {
        if (double.parse(data_khoangcach[j].tungdo.toString()) <
            double.parse(data_khoangcach[i].tungdo.toString())) {
          LopKhuVuc tam = new LopKhuVuc();
          tam = data_khoangcach[i];
          data_khoangcach[i] = data_khoangcach[j];
          data_khoangcach[j] = tam;
        }
      }
    }
  }

  // //Hàm lấy k giá trị
  void getkValue() {
    for (int i = 0; i < k; i++) {
      data_out.insert(i, data_khoangcach[i]);
    }
  }

  List<LopKhuVuc> getData(
      List<LopKhuVuc> lst, int about, double lat, double lon, int khoangcach) {
    data = lst;

    getDistance(lat, lon);
    sortIncrease();
    getkValue();
    List<LopKhuVuc> lop = <LopKhuVuc>[];
    int m = 0;
    for (LopKhuVuc lp in data_out) {
      for (LopKhuVuc lp1 in lst) {
        if (lp.lopId == lp1.lopId &&
            lp.tungdo! <= double.parse(khoangcach.toString())) {
          lop.insert(m, lp1);
          m++;
        }
      }
    }
    return lop;
  }

  // //Hàm đếm số lần xuất hiện của phần tử
//  int dem(LopKhuVuc a)
//   {
//       int dem = 0;
//       for (int i = 0; i < k; i++)
//       {
//           if (a.lopId == data_out[i].lopId)
//           {
//               dem++;
//           }
//       }
//       return dem;
//   }

//   // //Hàm kiểm tra nhãn dán
//   int? kiemtra_nhan()
//   {
//       int max = dem(data_out[0]), vt = 0;
//       for (int i = 1; i < k; i++)
//       {
//           if (dem(data_out[i]) > max)
//           {
//               max = dem(data_out[i]);
//               vt = i;
//           }
//       }
//       return data_khoangcach[vt].lopId;
//   }
}

// getDistanceFromLatLonInKm(lat1,lon1,lat2,lon2) {
//   var R = 6371; // Radius of the earth in km
//   var dLat = deg2rad(lat2-lat1);  // deg2rad below
//   var dLon = deg2rad(lon2-lon1);
//   var a =
//     math.sin(dLat/2) * math.sin(dLat/2) +
//     math.cos(deg2rad(lat1)) * math.cos(deg2rad(lat2)) *
//     math.sin(dLon/2) * math.sin(dLon/2)
//     ;
//   var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a));
//   var d = R * c; // Distance in km
//   return d;
// }

// deg2rad(deg) {
//   return deg * 0.017453292519943295;
// }
