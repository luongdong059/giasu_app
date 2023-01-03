import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hocvien.dart';

class GiaSu {
  GiaSu({
    this.giasuId,
    this.email,
    this.tendangnhap,
    this.matkhau,
    this.hoten,
    this.gioitinh,
    this.sdt,
    this.nghenghiep,
    this.url,
    this.hinhthucday,
    this.hocphi,
    this.gioithieubanthan,
    this.thoigianday,
    this.pointGs,
    this.khuvucId,
  });

  int? giasuId;
  String? email;
  String? tendangnhap;
  String? matkhau;
  String? hoten;
  String? gioitinh;
  String? sdt;
  String? nghenghiep;
  String? url;
  String? hinhthucday;
  int? hocphi;
  String? gioithieubanthan;
  String? thoigianday;
  int? pointGs;
  int? khuvucId;

  factory GiaSu.fromJson(Map<String, dynamic> json) => GiaSu(
        giasuId: json["GIASU_ID"],
        email: json["EMAIL"],
        tendangnhap: json["TENDANGNHAP"],
        matkhau: json["MATKHAU"],
        hoten: json["HOTEN"],
        gioitinh: json["GIOITINH"],
        sdt: json["SDT"],
        nghenghiep: json["NGHENGHIEP"],
        url: json["URL"],
        hinhthucday: json["HINHTHUCDAY"],
        hocphi: json["HOCPHI"],
        gioithieubanthan: json["GIOITHIEUBANTHAN"],
        thoigianday: json["THOIGIANDAY"],
        pointGs: json["POINT_GS"],
        khuvucId: json["KHUVUC_ID"],
      );

  Map<String, dynamic> toJson() => {
        "GIASU_ID": giasuId,
        "EMAIL": email,
        "TENDANGNHAP": tendangnhap,
        "MATKHAU": matkhau,
        "HOTEN": hoten,
        "GIOITINH": gioitinh,
        "SDT": sdt,
        "NGHENGHIEP": nghenghiep,
        "URL": url,
        "HINHTHUCDAY": hinhthucday,
        "HOCPHI": hocphi,
        "GIOITHIEUBANTHAN": gioithieubanthan,
        "THOIGIANDAY": thoigianday,
        "POINT_GS": pointGs,
        "KHUVUC_ID": khuvucId,
      };
}
