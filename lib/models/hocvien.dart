import 'package:get/get.dart';

class HocVien {
  HocVien({
    this.hocvienId,
    this.email,
    this.tendangnhap,
    this.matkhau,
    this.hoten,
    this.gioitinh,
    this.sdt,
    this.diachi,
    this.url,
  });

  int? hocvienId;
  String? email;
  String? tendangnhap;
  String? matkhau;
  String? hoten;
  String? gioitinh;
  String? sdt;
  String? diachi;
  String? url;

  factory HocVien.fromJson(Map<String, dynamic> json) => HocVien(
        hocvienId: json["HOCVIEN_ID"],
        email: json["EMAIL"],
        tendangnhap: json["TENDANGNHAP"],
        matkhau: json["MATKHAU"],
        hoten: json["HOTEN"],
        gioitinh: json["GIOITINH"],
        sdt: json["SDT"],
        diachi: json["DIACHI"],
        url: json["URL"],
      );

  Map<String, dynamic> toJson() => {
        "HOCVIEN_ID": hocvienId,
        "EMAIL": email,
        "TENDANGNHAP": tendangnhap,
        "MATKHAU": matkhau,
        "HOTEN": hoten,
        "GIOITINH": gioitinh,
        "SDT": sdt,
        "DIACHI": diachi,
        "URL": url,
      };
}
