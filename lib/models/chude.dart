class ChuDe {
  ChuDe({
    this.chudeId,
    this.nhomchudeId,
    this.tenchude,
  });

  int? chudeId;
  int? nhomchudeId;
  String? tenchude;

  factory ChuDe.fromJson(Map<String, dynamic> json) => ChuDe(
        chudeId: json["CHUDE_ID"],
        nhomchudeId: json["NHOMCHUDE_ID"],
        tenchude: json["TENCHUDE"],
      );

  Map<String, dynamic> toJson() => {
        "CHUDE_ID": chudeId,
        "NHOMCHUDE_ID": nhomchudeId,
        "TENCHUDE": tenchude,
      };
}
