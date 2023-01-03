class DanhGia {
  DanhGia({
    this.hocvienId,
    this.giasuId,
    this.thoigian,
    this.giasuHocvien,
    this.hocvienGiasu,
    this.sosao,
    this.yeuthich,
  });

  int? hocvienId;
  int? giasuId;
  DateTime? thoigian;
  String? giasuHocvien;
  String? hocvienGiasu;
  int? sosao;
  int? yeuthich;

  factory DanhGia.fromJson(Map<String, dynamic> json) => DanhGia(
        hocvienId: json["HOCVIEN_ID"],
        giasuId: json["GIASU_ID"],
        thoigian: DateTime.parse(json["THOIGIAN"]),
        giasuHocvien: json["GIASU_HOCVIEN"],
        hocvienGiasu: json["HOCVIEN_GIASU"],
        sosao: json["SOSAO"],
        yeuthich: json["YEUTHICH"],
      );

  Map<String, dynamic> toJson() => {
        "HOCVIEN_ID": hocvienId,
        "GIASU_ID": giasuId,
        "THOIGIAN": thoigian!.toIso8601String(),
        "GIASU_HOCVIEN": giasuHocvien,
        "HOCVIEN_GIASU": hocvienGiasu,
        "SOSAO": sosao,
        "YEUTHICH": yeuthich,
      };
}
