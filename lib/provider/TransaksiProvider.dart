// ignore_for_file: file_names, depend_on_referenced_packages

import 'Base_provider.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class TransaksiProvider extends BaseProvider {
  Future<Response> getTagihanUser(id) async {
    return get('$Url/tagihan/$id', headers: header);
  }
  Future<Response> beliGas(var data) async {
    return post('$Url/pembelian', data, headers: header);
  }
  Future<void> uploadImageToApi(PlatformFile file, id) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$Url/update_pembayaran/$id'));

    header.forEach((key, value) {
      request.headers[key] = value;
    });

    // Tambahkan gambar ke request
    request.files.add(http.MultipartFile(
      'bukti_pembayaran', 
      http.ByteStream.fromBytes(
          file.bytes as List<int>), 
      file.size, // Ukuran file
      filename: file.name, // Nama file
    ));

    try {
      EasyLoading.show();
      var response = await request.send();

      if (response.statusCode == 200) {
        Get.snackbar(
          "Berhasil",
          "bukti pembayaran berhasil diunggah, cek di menu proses!!",
          colorText: Colors.white,
          backgroundColor: Colors.green.withOpacity(0.75),
        );
        Get.offAllNamed('/home');
        EasyLoading.dismiss();
      } else {
        Get.snackbar(
          "Bukti pembayaran gagal diunggah",
          "Ukuran foto max. 2 mb",
          colorText: Colors.white,
          backgroundColor: Colors.red.withOpacity(0.50),
        );
          print(response.request);
        EasyLoading.dismiss();
      }
    } catch (e) {
      Get.snackbar(
        "Bukti pembayaran gagal diunggah",
        "Terjadi kesalahan: $e",
        colorText: Colors.white,
        backgroundColor: Colors.red.withOpacity(0.50),
      );
      EasyLoading.dismiss();
    }
  } 
}
