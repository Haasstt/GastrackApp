// ignore_for_file: prefer_final_fields, non_constant_identifier_names, file_names, depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gastrack/animation/BounceAnimation.dart';
import 'package:gastrack/animation/animations.dart';
import 'package:gastrack/page/bayarPage.dart';
import 'package:gastrack/page/pesanPage.dart';
import 'package:gastrack/page/riwayattransaksiPage.dart';
import 'package:gastrack/page/settingPage.dart';
import 'package:gastrack/provider/TransaksiProvider.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  List<Map<String, dynamic>> Data = [];
  bool gagalmemuat = false;
  bool datakosong = false;
  var message;

  void GetData() {
    setState(() {
      Data.clear();
    });
    setState(() {
      gagalmemuat = false;
      datakosong = false;
    });
    TransaksiProvider().getTagihanUser(SpUtil.getInt('id')).then((value) {
      if (value.statusCode == 200) {
        var data = value.body['data'];
        setState(() {
          Data.addAll([data]);
        });
        EasyLoading.dismiss();
      } else if (value.statusCode == 422) {
        var pesan = value.body['message'];
        setState(() {
          message = pesan;
          datakosong = !datakosong;
        });
        Flushbar(
          backgroundColor: Colors.green,
          flushbarPosition: FlushbarPosition.TOP,
          margin: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(8),
          message: message,
          icon: const Icon(
            Icons.check,
            size: 28.0,
            color: Colors.white,
          ),
          duration: const Duration(seconds: 3),
        ).show(context);
        EasyLoading.dismiss();
      } else {
        var pesan = "Gagal Memuat, hubungkan perangkat ke jaringan";
        setState(() {
          message = pesan;
          gagalmemuat = !gagalmemuat;
        });
        Flushbar(
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.TOP,
          margin: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(8),
          message: message,
          icon: const Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.white,
          ),
          duration: const Duration(seconds: 3),
        ).show(context);
        EasyLoading.dismiss();
      }
    });
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    GetData();
  }

  @override
  void initState() {
    GetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: LiquidPullToRefresh(
        onRefresh: _refreshData,
        height: 150,
        color: const Color.fromRGBO(128, 38, 198, 1.0),
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 0.1),
          shrinkWrap: true,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  FadeAnimation(
                    0.5,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.25), // Warna bayangan
                            spreadRadius: 0, // Seberapa jauh bayangan menyebar
                            blurRadius: 4, // Seberapa kabur bayangan
                            offset:
                                const Offset(1, 1), // Posisi bayangan (x, y)
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 70),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Hallo!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          color: Colors.black),
                                    ),
                                    Text(
                                      SpUtil.getString('nama_user')!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                          child: const Profilsaya(),
                                          type: PageTransitionType.rightToLeft,
                                        ));
                                  },
                                  child: Image.asset(
                                    "assets/icon/setting_icon.png",
                                    width: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(128, 38, 198, 1.0),
                                  Color.fromRGBO(249, 1, 131, 1.0),
                                ], // Warna gradient
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Image.asset(
                              "assets/icon/gastrack_icon_white.png",
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: const PesanPage(),
                                        type: PageTransitionType.rightToLeft,
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              249, 1, 131, 0.65),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.50), // Warna bayangan
                                              spreadRadius:
                                                  0, // Seberapa jauh bayangan menyebar
                                              blurRadius:
                                                  4, // Seberapa kabur bayangan
                                              offset: const Offset(4,
                                                  4), // Posisi bayangan (x, y)
                                            ),
                                          ],
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: Image.asset(
                                          "assets/icon/gasWhite_icon.png",
                                        ),
                                      ),
                                      const Text(
                                        'Pesan Gas',
                                        style: TextStyle(
                                            height: 2,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 11,
                                            fontFamily: 'Poppins',
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                          child: const RiwayatTransaksiPage(),
                                          type: PageTransitionType.rightToLeft,
                                        ));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              189, 20, 165, 0.65),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.50), // Warna bayangan
                                              spreadRadius:
                                                  0, // Seberapa jauh bayangan menyebar
                                              blurRadius:
                                                  4, // Seberapa kabur bayangan
                                              offset: const Offset(4,
                                                  4), // Posisi bayangan (x, y)
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          "assets/icon/history_icon.png",
                                        ),
                                      ),
                                      const Text(
                                        'Riwayat Transaksi',
                                        style: TextStyle(
                                            height: 2,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 11,
                                            fontFamily: 'Poppins',
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: const Profilsaya(),
                                        type: PageTransitionType.rightToLeft,
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              128, 38, 198, 0.65),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.50), // Warna bayangan
                                              spreadRadius:
                                                  0, // Seberapa jauh bayangan menyebar
                                              blurRadius:
                                                  4, // Seberapa kabur bayangan
                                              offset: const Offset(4,
                                                  4), // Posisi bayangan (x, y)
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          "assets/icon/profil_icon.png",
                                        ),
                                      ),
                                      const Text(
                                        'Profil',
                                        style: TextStyle(
                                            height: 2,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 11,
                                            fontFamily: 'Poppins',
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FadeAnimation(
                      0.8,
                      Container(
                        margin: const EdgeInsets.only(top: 25),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.25), // Warna bayangan
                              spreadRadius:
                                  2, // Seberapa jauh bayangan menyebar
                              blurRadius: 4, // Seberapa kabur bayangan
                              offset:
                                  const Offset(1, 1), // Posisi bayangan (x, y)
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text(
                                'Tagihan Anda',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins-bold',
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Data.isEmpty
                                    ? Column(
                                        children: [
                                          Expanded(
                                              child: SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    datakosong
                                                        ? Column(
                                                            children: [
                                                              Image.asset(
                                                                "assets/icon/noTagihan_icon.png",
                                                              ),
                                                              const Text(
                                                                'Anda tidak memiliki tagihan',
                                                                style: TextStyle(
                                                                    height: 3,
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .black45),
                                                              ),
                                                            ],
                                                          )
                                                        : gagalmemuat
                                                            ? Column(
                                                                children: [
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            5),
                                                                    child: const Icon(
                                                                      Icons
                                                                          .cloud_off,
                                                                      size: 50,
                                                                      color: Colors
                                                                          .black26,
                                                                    ),
                                                                  ),
                                                                  const Text(
                                                                    'Offline',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            : const CircularProgressIndicator(
                                                                strokeWidth: 1,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        249,
                                                                        1,
                                                                        131,
                                                                        1.0),
                                                              )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ))
                                        ],
                                      )
                                    : Data_tagihan(Data: Data),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Data_tagihan extends StatelessWidget {
  const Data_tagihan({
    super.key,
    required this.Data,
  });

  final List<Map<String, dynamic>> Data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: Data.map((index) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Batas Pembayaran',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins-bold',
                          color: Colors.black38),
                    ),
                    Text(
                      '${(index['tanggal_jatuh_tempo'])}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins-bold',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(248, 215, 218, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${(index['status_tagihan'])}',
                          style: const TextStyle(
                            color: Color.fromRGBO(132, 32, 41, 1.0),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Tagihan',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                          Text(
                            'Rp${(index['jumlah_tagihan'])},-',
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins-bold',
                              color: Color.fromRGBO(249, 1, 131, 1.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BounceAnimation(
                      0.9,
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.50), // Warna bayangan
                              spreadRadius:
                                  0, // Seberapa jauh bayangan menyebar
                              blurRadius: 4, // Seberapa kabur bayangan
                              offset:
                                  const Offset(4, 4), // Posisi bayangan (x, y)
                            ),
                          ],
                          color: const Color.fromRGBO(249, 1, 131, 1.0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: BayarTagihanPage(
                                  id: index['id_tagihan'],
                                ),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          },
                          child: const Text(
                            "Bayar Sekarang",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
