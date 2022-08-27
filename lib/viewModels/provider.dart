import 'package:task/models/models.dart';
import 'package:task/repository/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pagesProvider = FutureProvider<List<Users>>((ref) async {
  return ref.read(apiProvider).getPages();
});
