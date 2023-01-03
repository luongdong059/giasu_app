class LopKhuVuc {
  LopKhuVuc({
    this.lopId,
    this.tenlop,
    this.ngaytao,
    this.hinhthuc,
    this.yeucaugioitinh,
    this.sohocvien,
    this.thoigianhoc,
    this.thoiluong,
    this.lichdukien,
    this.diadiem,
    this.khuvucId,
    this.chudeId,
    this.hocvienId,
    this.hocphidenghi,
    this.noidungyeucau,
    this.trangthai,
    this.vido,
    this.tungdo,
  });

  int? lopId;
  String? tenlop;
  DateTime? ngaytao;
  String? hinhthuc;
  String? yeucaugioitinh;
  int? sohocvien;
  DateTime? thoigianhoc;
  int? thoiluong;
  String? lichdukien;
  String? diadiem;
  int? khuvucId;
  int? chudeId;
  int? hocvienId;
  int? hocphidenghi;
  String? noidungyeucau;
  int? trangthai;
  double? vido;
  double? tungdo;

  factory LopKhuVuc.fromJson(Map<String, dynamic> json) => LopKhuVuc(
        lopId: json["LOP_ID"],
        tenlop: json["TENLOP"],
        ngaytao: DateTime.parse(json["NGAYTAO"]),
        hinhthuc: json["HINHTHUC"],
        yeucaugioitinh: json["YEUCAUGIOITINH"],
        sohocvien: json["SOHOCVIEN"],
        thoigianhoc: DateTime.parse(json["THOIGIANHOC"]),
        thoiluong: json["THOILUONG"],
        lichdukien: json["LICHDUKIEN"],
        diadiem: json["DIADIEM"],
        khuvucId: json["KHUVUC_ID"],
        chudeId: json["CHUDE_ID"] == null ? null : json["CHUDE_ID"],
        hocvienId: json["HOCVIEN_ID"],
        hocphidenghi: json["HOCPHIDENGHI"],
        noidungyeucau: json["NOIDUNGYEUCAU"],
        trangthai: json["TRANGTHAI"],
        vido: json["VIDO"].toDouble(),
        tungdo: json["TUNGDO"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "LOP_ID": lopId,
        "TENLOP": tenlop,
        "NGAYTAO": ngaytao!.toIso8601String(),
        "HINHTHUC": hinhthuc,
        "YEUCAUGIOITINH": yeucaugioitinh,
        "SOHOCVIEN": sohocvien,
        "THOIGIANHOC": thoigianhoc!.toIso8601String(),
        "THOILUONG": thoiluong,
        "LICHDUKIEN": lichdukien,
        "DIADIEM": diadiem,
        "KHUVUC_ID": khuvucId,
        "CHUDE_ID": chudeId == null ? null : chudeId,
        "HOCVIEN_ID": hocvienId,
        "HOCPHIDENGHI": hocphidenghi,
        "NOIDUNGYEUCAU": noidungyeucau,
        "TRANGTHAI": trangthai,
        "VIDO": vido,
        "TUNGDO": tungdo,
      };
}
