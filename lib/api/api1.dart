import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:molsmobile/api/api2.dart';

class Api1 {
  // String url = "http://45.13.132.218:3000";
  String url = "http://192.168.1.3:3000";
  String idDefault = "1515015221";

  Future<dynamic> login({
    required String userid,
    required String password,
  }) async {
    final payload = {
      "userid": userid,
      "password": password,
      "usertype": "MHS",
    };

    print('payload login');
    print("cek payload : " + payload.toString());

    Uri url = Uri.parse("https://apitelkomsel.unmul.ac.id/member/login");
    var r = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(payload),
        encoding: Encoding.getByName("utf-8"));
    var data = jsonDecode(r.body);
    print(data);

    // print("cek response : " + r.toString());
    return data;
  }

  Future<dynamic> getMahasiswa() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/mahasiswa');

    http.Response r = await http.post(Uri.parse('$url/mahasiswa'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> getDosen() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/dosen');

    http.Response r = await http.post(Uri.parse('$url/dosen'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> getFakultas() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/fakultas');

    http.Response r = await http.post(Uri.parse('$url/fakultas'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> getAngkatan() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/angkatan');

    http.Response r = await http.post(Uri.parse('$url/angkatan'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> getProdi() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/prodi');

    http.Response r = await http.post(Uri.parse('$url/prodi'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> getTahun() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/tahun');

    http.Response r = await http.post(Uri.parse('$url/tahun'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> getPost() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/post/alltugas');
    var nim = await Api2().getUserNim();
    http.Response r =
        await http.get(Uri.parse('$url/post/alltugas/$nim'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> getPostContent() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/postcontent');

    http.Response r = await http.post(Uri.parse('$url/postcontent'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> getSoal({required String id}) async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/soal/$id');

    http.Response r = await http.get(Uri.parse('$url/soal/$id'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> getGroup() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/group');

    http.Response r = await http.post(Uri.parse('$url/group'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> getKelas() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/group');

    http.Response r = await http.get(Uri.parse('$url/group'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> getJawabanMahasiswa() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/jawabanmahasiswa');

    http.Response r =
        await http.post(Uri.parse('$url/jawabanmahasiswa'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> getAbsentSessionTime() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/absentsessiontime');

    http.Response r =
        await http.post(Uri.parse('$url/absentsessiontime'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }

  Future<dynamic> kirimJawaban({
    required String jawaban,
    required String bobot,
    required String userId,
    required String soalId,
    required String postId,
    required String status,
    required String type,
  }) async {
    var nim = await Api2().getUserNim();

    final payload = {
      "jawaban": jawaban,
      "bobot": bobot,
      "user_id": nim,
      "soal_id": soalId,
      "post_id": postId,
      "status": "confirmed",
      "type": type,
    };

    print('payload login');
    print("cek payload : " + payload.toString());
    Uri urls = Uri.parse('$url/jawabanmahasiswa/create');
    http.Response r = await http.post(urls,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(payload),
        encoding: Encoding.getByName("utf-8"));

    // http.Response r = await http.post(Uri.parse('$url/jawabanmahasiswa/create'),
    //     body: payload,
    //     headers: {
    //       'content-Type': 'application/json',
    //     });
    var data = jsonDecode(r.body);
    print(data);

    // print("cek response : " + r.toString());
    return data;
  }

  Future<dynamic> getkelas() async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    print('headers = ' + headers.toString());
    print('url = $url/groups');

    http.Response r = await http.post(Uri.parse('$url/groups'), headers: {
      'content-Type': 'application/json',
    });
    print("status codenya " + r.statusCode.toString());

    print(r.body);
    var data = json.decode(r.body);
    print(data);
    return data;
  }
}
