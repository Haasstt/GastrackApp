// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gastrack/provider/TransaksiProvider.dart';
import 'package:gastrack/provider/UserProvider.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:file_picker/file_picker.dart';

class TransaksiController extends GetxController {
  PlatformFile? photoprofile;
  TextEditingController txtGasMasuk = TextEditingController();
  TextEditingController txtKeterangan = TextEditingController();
  var id = SpUtil.getInt('id')!;

  void Addpesanan(context) {
    UserProvider().getDetailuser(id).then((value) {
      String keterangan = txtKeterangan.text;
      TransaksiProvider().beliGas(photoprofile!, keterangan, id).then((value) {
          Get.offAllNamed('/home');
         Flushbar(
          backgroundColor: Colors.green,
          flushbarPosition: FlushbarPosition.TOP,
          margin: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(8),
          message: "Pesanan Anda diproses",
          icon: const Icon(
            Icons.check,
            size: 28.0,
            color: Colors.white,
          ),
          duration: const Duration(seconds: 3),
        ).show(context);
      });
    });
  }

  void Pembayaran(id) {
    TransaksiProvider().uploadImageToApi(photoprofile!, id);
  }
}
