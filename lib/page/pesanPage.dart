// ignore_for_file: depend_on_referenced_packages, file_names, non_constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gastrack/animation/BounceAnimation.dart';
import 'package:gastrack/animation/animations.dart';
import 'package:gastrack/controller/transaksiController.dart';
import 'package:gastrack/loading.dart';
import 'package:gastrack/page/settingdetailPage.dart';
import 'package:gastrack/provider/UserProvider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sp_util/sp_util.dart';
import 'package:file_picker/file_picker.dart';

class PesanPage extends StatefulWidget {
  const PesanPage({super.key});

  @override
  State<PesanPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PesanPage> {
  final TransaksiController _controller = TransaksiController();

  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Dialog tidak bisa ditutup dengan mengetuk di luar dialog
      builder: (BuildContext context) {
        return BounceAnimation(
          0.1,
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  20.0), // Atur BorderRadius sesuai kebutuhan
            ),
            title: const Text(
              'Konfirmasi',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins-bold',
                  color: Colors.black),
            ),
            content: const Text(
              'Pastikan data pesanan yang Anda masukkan sudah benar, data tidak dapat diubah kembali setelah proses pemesanan. Tetap lanjut?',
              style: TextStyle(
                  fontSize: 12, fontFamily: 'Poppins', color: Colors.black),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(249, 1, 131, 1.0),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.center,
                        child: const Text(
                          'Periksa Kembali',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        checkData();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        foregroundColor:
                            const Color.fromRGBO(128, 38, 198, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.center,
                        child: const Text(
                          'Lanjutkan',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showdatanotfoundConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Dialog tidak bisa ditutup dengan mengetuk di luar dialog
      builder: (BuildContext context) {
        return BounceAnimation(
          0.1,
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  20.0), // Atur BorderRadius sesuai kebutuhan
            ),
            title: const Row(
              children: [
                Icon(Icons.warning_rounded, color: Colors.red),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Data kosong!',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins-bold',
                      color: Colors.red),
                ),
              ], 
            ),
            content: const Text(
              'Anda harus menambahkan foto sisa bar gas Anda saat ini',
              style: TextStyle(
                  fontSize: 12, fontFamily: 'Poppins', color: Colors.black),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(249, 1, 131, 1.0),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.center,
                        child: const Text(
                          'Oke, Mengerti',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void getFilePicker() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      final selectedFile = File(result.files.first.path as String);

      if (selectedFile.existsSync()) {
        final bytes = await selectedFile.readAsBytes();
        final controller = StreamController<List<int>>();
        controller.sink.add(bytes);

        setState(() {
          _controller.photoprofile = PlatformFile(
            path: selectedFile.path,
            name: selectedFile.uri.pathSegments.last,
            readStream: controller.stream,
            size: bytes.length,
            bytes: bytes,
          );
        });
      }
    }
  }

  void checkData() {
    customLoading(context);
    UserProvider().getDetailuser(SpUtil.getInt('id')).then((value) {
      if (value.statusCode == 200) {
        var data = value.body['datauser']['koordinat'];

        if (data == null) {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(
              context,
              PageTransition(
                child: const ChangeAlamat(),
                type: PageTransitionType.rightToLeft,
              ));
          Flushbar(
            backgroundColor: Colors.red,
            flushbarPosition: FlushbarPosition.TOP,
            margin: const EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(8),
            message:
                "Mohon atur pinpoint dahulu untuk keakurasian terbaik lokasi Anda",
            icon: const Icon(
              Icons.info_outline,
              size: 28.0,
              color: Colors.white,
            ),
            duration: const Duration(seconds: 3),
          ).show(context);
        } else {
          _controller.Addpesanan(context);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: formPesan(context),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 40),
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(249, 1, 131, 1.0),
                    Color.fromRGBO(128, 38, 198, 1.0)
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  height: 50,
                  width: 50,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(
                    "Pesan Gas",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins-bold",
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView formPesan(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        FadeAnimation(
          0.5,
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                FadeAnimation(
                  0.5,
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: const Row(
                      children: [
                        Text(
                          'Form pemesanan gas',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-semibold',
                            color: Color.fromRGBO(249, 1, 131, 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(width: 1, color: Colors.black26),
                  ),
                  child: _controller.photoprofile == null
                      ? InkWell(
                          onTap: () {
                            getFilePicker();
                          },
                          child: const SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                'Unggah Bukti Pengisian',
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: Image.file(
                            File(_controller.photoprofile!.path!),
                            width: double.infinity,
                          ),
                        ),
                ),
                _controller.photoprofile != null
                    ? ElevatedButton(
                        onPressed: () {
                          getFilePicker();
                        },
                        child: const Text(
                          "Pilih Foto Lainnya",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const SizedBox(),
                FadeAnimation(
                  0.5,
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: double.infinity,
                    child: const Row(
                      children: [
                        Text(
                          "Tambahkan keterangan",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FadeAnimation(
                  0.6,
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        maxLines: 5,
                        controller: _controller.txtKeterangan,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors
                                    .black26), // Warna border saat dalam fokus
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors
                                    .black26), // Warna border saat dalam fokus
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors
                                    .black26), // Warna border saat tidak dalam fokus
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: const TextStyle(
                            fontFamily: 'Poppins', fontSize: 12),
                      ),
                    ),
                  ),
                ),
                BounceAnimation(
                  0.7,
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(249, 1, 131, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        if (_controller.photoprofile == null) {
                          _showdatanotfoundConfirmationDialog(context);
                        } else {
                          FocusManager.instance.primaryFocus?.unfocus();
                          _showConfirmationDialog(context);
                        }
                      },
                      child: const Text(
                        "Pesan sekarang",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
