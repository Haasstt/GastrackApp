// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:gastrack/provider/UserProvider.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';
// import "Authcontroller.dart";

class UpdateDataUserController extends GetxController {
  String draggedAddress = "";
  late String latlong;
  var id = SpUtil.getInt('id')!;
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPerusahaan = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtnotelp = TextEditingController();
  TextEditingController txtLastPass = TextEditingController();
  TextEditingController txtNewPass = TextEditingController();
  TextEditingController txtConfirmNewPass = TextEditingController();

  void ChangeAlamat() {
    String alamat = draggedAddress;
    String koordinat = latlong;

    // EasyLoading.show();
    var data = {
      "alamat": alamat,
      "koordinat": koordinat,
    };

    print(data);

    // UserProvider().updateAlamatuser(id, data).then((value) {
    //   var pesan = value.body['message'];
    //   if (value.statusCode == 200) {
    //     Get.snackbar(
    //       "Successs",
    //       pesan,
    //       backgroundColor: Colors.green.withOpacity(0.85),
    //       colorText: Colors.white,
    //     );
    //     Get.offAllNamed('/home');
    //   } else if (value.statusCode == 422) {
    //     Get.snackbar(
    //       "Failed",
    //       pesan,
    //       backgroundColor: Colors.red.withOpacity(0.50),
    //       colorText: Colors.white,
    //     );
    //   } else if (value.hasError == true) {
    //     Get.snackbar(
    //       "Server Not Responding",
    //       'Gagal menghubungka ke server',
    //       colorText: Colors.white,
    //     );
    //   }
    //   EasyLoading.dismiss();
    // });
  }

  Future<void> ChangeName() async {
    String name = txtUsername.text;

    // EasyLoading.show();
    var data = {
      "name": name,
    };

    print(data);
    // UserProvider().updateUsernameuser(id, data).then((value) {
    //   var pesan = value.body['message'];
    //   if (value.statusCode == 200) {
    //     Get.snackbar(
    //       "Successs",
    //       pesan,
    //       backgroundColor: Colors.green.withOpacity(0.85),
    //       colorText: Colors.white,
    //     );
    //     await SpUtil.remove('nama_user');
    //     SpUtil.putString('nama_user', newValue);
    //     Get.offAllNamed('/profilsaya');
    //   } else if (value.statusCode == 422) {
    //     Get.snackbar(
    //       "Failed",
    //       pesan,
    //       backgroundColor: Colors.red.withOpacity(0.50),
    //       colorText: Colors.white,
    //     );
    //   } else if (value.hasError == true) {
    //     Get.snackbar(
    //       "Server Not Responding",
    //       'Gagal menghubungka ke server',
    //       colorText: Colors.white,
    //     );
    //   }
    //   EasyLoading.dismiss();
    // });
  }

  void ChangePerusahaan() {
    String name_perusahaan = txtPerusahaan.text;

    // EasyLoading.show();
    var data = {
      "name_perusahaan": name_perusahaan,
    };

    print(data);
    // UserProvider().updateUsernameuser(id, data).then((value) {
    //   var pesan = value.body['message'];
    //   if (value.statusCode == 200) {
    //     Get.snackbar(
    //       "Successs",
    //       pesan,
    //       backgroundColor: Colors.green.withOpacity(0.85),
    //       colorText: Colors.white,
    //     );
    //     Get.offAllNamed('/profilsaya');
    //   } else if (value.statusCode == 422) {
    //     Get.snackbar(
    //       "Failed",
    //       pesan,
    //       backgroundColor: Colors.red.withOpacity(0.50),
    //       colorText: Colors.white,
    //     );
    //   } else if (value.hasError == true) {
    //     Get.snackbar(
    //       "Server Not Responding",
    //       'Gagal menghubungka ke server',
    //       colorText: Colors.white,
    //     );
    //   }
    //   EasyLoading.dismiss();
    // });
  }

  void ChangeEmail() {
    String email = txtEmail.text;

    // EasyLoading.show();
    var data = {
      "email": email,
    };

    print(data);
    // UserProvider().updateEmailuser(id, data).then((value) {
    //   if (value.statusCode == 200) {
    //     Get.snackbar(
    //       "Successs",
    //       "Email berhasil diubah, lakukan login ulang dengan email baru anda",
    //       backgroundColor: Colors.green.withOpacity(0.85),
    //       colorText: Colors.white,
    //     );
    //     LogoutController().logout();
    //   } else if (value.hasError == true) {
    //     Get.snackbar(
    //       "Server Not Responding",
    //       'Gagal menghubungka ke server',
    //       colorText: Colors.white,
    //     );
    //   }
    //   EasyLoading.dismiss();
    // });
  }

  void ChangeTelp() {
    String telp = "0${txtnotelp.text}";

    // EasyLoading.show();
    var data = {
      "no_hp": telp,
    };

    print(data);
    // UserProvider().updateNoTelpuser(id, data).then((value) {
    //   var pesan = value.body['message'];
    //   if (value.statusCode == 200) {
    //     Get.snackbar(
    //       "Successs",
    //       pesan,
    //       backgroundColor: Colors.green.withOpacity(0.85),
    //       colorText: Colors.white,
    //     );
    //     Get.offAllNamed('/profilsaya');
    //   } else if (value.statusCode == 422) {
    //     Get.snackbar(
    //       "Failed",
    //       pesan,
    //       backgroundColor: Colors.red.withOpacity(0.50),
    //       colorText: Colors.white,
    //     );
    //   } else if (value.hasError == true) {
    //     Get.snackbar(
    //       "Server Not Responding",
    //       'Gagal menghubungka ke server',
    //       colorText: Colors.white,
    //     );
    //   }
    //   EasyLoading.dismiss();
    // });
  }

  void ChangePass() {
    String PassLama = txtLastPass.text;
    String passBaru = txtNewPass.text;
    String KonfirmasiPass = txtConfirmNewPass.text;

    // EasyLoading.show();
    var data = {
      "old_password": PassLama,
      "new_password": passBaru,
      "new_password_confirmation": KonfirmasiPass,
    };

    print(data);
    // UserProvider().updatePassworduser(id, data).then((value) {
    //   var pesan = value.body['message'];
    //   if (value.statusCode == 200) {
    //     Get.snackbar(
    //       "Successs",
    //       pesan,
    //       backgroundColor: Colors.green.withOpacity(0.85),
    //       colorText: Colors.white,
    //     );
    //     Get.offAllNamed('/profilsaya');
    //   } else if (value.statusCode == 422) {
    //     Get.snackbar(
    //       "Failed",
    //       pesan,
    //       backgroundColor: Colors.red.withOpacity(0.50),
    //       colorText: Colors.white,
    //     );
    //   } else if (value.hasError == true) {
    //     Get.snackbar(
    //       "Server Not Responding",
    //       'Gagal menghubungka ke server',
    //       colorText: Colors.white,
    //     );
    //   }
    //   EasyLoading.dismiss();
    // });
  }
}
