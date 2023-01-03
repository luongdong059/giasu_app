class LSDD {
  LSDD({
    this.lsddId,
    this.lopId,
    this.nhanvienId,
    this.philienket,
    this.ngaygiaodich,
    this.trangthai,
  });

  int? lsddId;
  int? lopId;
  int? nhanvienId;
  int? philienket;
  DateTime? ngaygiaodich;
  int? trangthai;

  factory LSDD.fromJson(Map<String, dynamic> json) => LSDD(
        lsddId: json["LSDD_ID"],
        lopId: json["LOP_ID"],
        nhanvienId: json["NHANVIEN_ID"],
        philienket: json["PHILIENKET"],
        ngaygiaodich: DateTime.parse(json["NGAYGIAODICH"]),
        trangthai: json["TRANGTHAI"],
      );

  Map<String, dynamic> toJson() => {
        "LSDD_ID": lsddId,
        "LOP_ID": lopId,
        "NHANVIEN_ID": nhanvienId,
        "PHILIENKET": philienket,
        "NGAYGIAODICH": ngaygiaodich!.toIso8601String(),
        "TRANGTHAI": trangthai,
      };
}
