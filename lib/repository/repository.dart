import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:task/models/models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String endPoint = 'https://reqres.in/api/users?page=2';

  Future<List<Users>> getPages() async {
    Uri uri = Uri.parse(endPoint);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];

      return result.map(((data) => Users.fromJson(data))).toList();
    } else {
      throw Exception('Not valid');
    }
  }
}

final apiProvider = Provider<ApiService>((ref) => ApiService());
