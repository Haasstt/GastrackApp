// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:gastrack/provider/TransaksiProvider.dart';
import 'package:gastrack/provider/UserProvider.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';
import 'package:file_picker/file_picker.dart';

class TransaksiController extends GetxController {
  TextEditingController txtJumlahPesanan = TextEditingController();
  PlatformFile? photoprofile;
  var id = SpUtil.getInt('id')!;

  void Addpesanan() {
    EasyLoading.show();
    UserProvider().getDetailuser(id).then((value) {
      String jumlah = txtJumlahPesanan.text;
      if (value.statusCode == 200) {
        String jenis_pembayaran = value.body['datauser']['jenis_pembayaran'];

        var data = {
          "id_pelanggan": id,
          "jumlah_pesanan": jumlah,
          "durasi_jatuh_tempo": jenis_pembayaran,
        };
        
        TransaksiProvider().beliGas(data).then((value) {
          if (value.statusCode == 200) {
            Get.snackbar(
              "Success",
              value.body['message'],
              backgroundColor: Colors.green.withOpacity(0.85),
              colorText: Colors.white,
            );
            Get.offAllNamed('/home');
          }
        });
        //     var koordinat = data['koordinat'];
        //     if (koordinat == null) {
        //       Get.snackbar(
        //         "Pemesanan Gagal",
        //         "untuk melakukan pemesanan Anda perlu mengatur alamat terlebih dahulu",
        //         colorText: Colors.white,
        //         backgroundColor: Colors.red.withOpacity(0.50),
        //       );
      }
      //else {
      //       var data = {
      //         "id_agen": id,
      //         "id_gas": id_gas,
      //         "jumlah_transaksi": jumlahTotal,
      //       };
      //       TransaksiProvider().AddPesanan(data).then((value) {
      //         print(value.statusCode);
      //         if (value.statusCode == 200) {
      //           Get.toNamed('/pesanansaya');
      //         }
      //       });
      //     }
      //   } else if (value.hasError == true) {
      //     Get.snackbar(
      //       "Pesanan Gagal diproses",
      //       'Gagal menghubungka ke server',
      //       colorText: Colors.white,
      //     );
      //   }
      EasyLoading.dismiss();
    });
  }

  void Pembayaran(id) {
    print(id.toString());
    print(photoprofile?.size);
    TransaksiProvider().uploadImageToApi(photoprofile!, id);
  }
}
 
