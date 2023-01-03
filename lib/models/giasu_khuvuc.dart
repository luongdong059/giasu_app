class Gskhuvuc {
    Gskhuvuc({
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
        this.vido,
        this.tungdo,
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
    double? vido;
    double? tungdo;

    factory Gskhuvuc.fromJson(Map<String, dynamic> json) => Gskhuvuc(
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
        khuvucId: json["KHUVUC_ID"] == null ? null : json["KHUVUC_ID"],
        vido: json["VIDO"].toDouble(),
        tungdo: json["TUNGDO"].toDouble(),
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
        "KHUVUC_ID": khuvucId == null ? null : khuvucId,
        "VIDO": vido,
        "TUNGDO": tungdo,
    };
}