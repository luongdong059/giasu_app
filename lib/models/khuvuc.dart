class KhuVuc {
  KhuVuc({
    this.khuvucId,
    this.tenkhuvuc,
    this.vido,
    this.tungdo,
  });

  int? khuvucId;
  String? tenkhuvuc;
  double? vido;
  double? tungdo;

  factory KhuVuc.fromJson(Map<String, dynamic> json) => KhuVuc(
        khuvucId: json["KHUVUC_ID"],
        tenkhuvuc: json["TENKHUVUC"],
        vido: json["VIDO"].toDouble(),
        tungdo: json["TUNGDO"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "KHUVUC_ID": khuvucId,
        "TENKHUVUC": tenkhuvuc,
        "VIDO": vido,
        "TUNGDO": tungdo,
      };
}
