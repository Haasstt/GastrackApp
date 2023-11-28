// ignore_for_file: file_names

import 'Base_provider.dart';
import 'package:get/get.dart';

class TransaksiProvider extends BaseProvider {
  Future<Response> getTagihanUser(id) async {
    return get('$Url/tagihan/$id', headers: header);
  }
}
