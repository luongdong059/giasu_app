class ApiUrls {
  static const String url = 'http://192.168.1.15:3000';

  Uri fetchGiaSu(String routers) {
    return Uri.parse('$url$routers');
  }

  Uri fetchHocVien(String routers) {
    return Uri.parse('$url$routers');
  }

  Uri fetchLop(String routers) {
    return Uri.parse('$url$routers');
  }

  Uri fetchKhuVuc(String routers) {
    return Uri.parse('$url$routers');
  }
}
