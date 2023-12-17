// ignore_for_file: depend_on_referenced_packages, file_names, non_constant_identifier_names

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gastrack/animation/BounceAnimation.dart';
import 'package:gastrack/animation/animations.dart';
import 'package:gastrack/controller/transaksiController.dart';
import 'package:gastrack/page/settingdetailPage.dart';
import 'package:gastrack/provider/UserProvider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sp_util/sp_util.dart';

class PesanPage extends StatefulWidget {
  const PesanPage({super.key});

  @override
  State<PesanPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PesanPage> {
  final TransaksiController _controller = TransaksiController();

  void GetData() {
    UserProvider().getDetailuser(SpUtil.getInt('id')).then((value) {
      if (value.statusCode == 200) {
        var data = value.body['datauser']['koordinat'];

        if (data == null) {
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
        }else{
          _controller.Addpesanan();
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
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              width: double.infinity,
                              height: 60,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    'Form Pembelian Gas',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins-ExtraBold',
                                      color: Color.fromRGBO(249, 1, 131, 1.0),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: TextFormField(
                                  controller: _controller.txtJumlahPesanan,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    suffixIcon: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Text(
                                          '/ bar',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                          ),
                                        )),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                    ),
                                    labelText: "Masukkan jumlah pesanan gas",
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                  ),
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
                                  backgroundColor:
                                      const Color.fromRGBO(249, 1, 131, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  // _controller.Addpesanan();
                                  GetData();
                                },
                                child: const Text(
                                  "Pesan Sekarang",
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
              ),
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
}
