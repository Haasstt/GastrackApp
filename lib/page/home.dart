// ignore_for_file: prefer_final_fields, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gastrack/animation/animations.dart';
import 'package:gastrack/page/setting.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  List<Map<String, dynamic>> Data = [
    {
      'batas_pembayaran': "12-12-2023",
      'total_pembayaran': 20000,
      'status_pembayaran': "Belum bayar"
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      body: Column(
        children: [
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
                  color: Colors.grey.withOpacity(0.25), // Warna bayangan
                  spreadRadius: 0, // Seberapa jauh bayangan menyebar
                  blurRadius: 4, // Seberapa kabur bayangan
                  offset: const Offset(1, 1), // Posisi bayangan (x, y)
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hallo!',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                          Text(
                            'Nurafiif Almas Azhari',
                            style: TextStyle(
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
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Image.asset(
                    "assets/icon/gastrack_icon_white.png",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.20,
                            width: MediaQuery.of(context).size.width * 0.20,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(249, 1, 131, 0.65),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.50), // Warna bayangan
                                  spreadRadius:
                                      0, // Seberapa jauh bayangan menyebar
                                  blurRadius: 4, // Seberapa kabur bayangan
                                  offset: const Offset(
                                      4, 4), // Posisi bayangan (x, y)
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
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
                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.20,
                            width: MediaQuery.of(context).size.width * 0.20,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(189, 20, 165, 0.65),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.50), // Warna bayangan
                                  spreadRadius:
                                      0, // Seberapa jauh bayangan menyebar
                                  blurRadius: 4, // Seberapa kabur bayangan
                                  offset: const Offset(
                                      4, 4), // Posisi bayangan (x, y)
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                child: const Profilsaya(),
                                type: PageTransitionType.rightToLeft,
                              ));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width * 0.20,
                              width: MediaQuery.of(context).size.width * 0.20,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(128, 38, 198, 0.65),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.50), // Warna bayangan
                                    spreadRadius:
                                        0, // Seberapa jauh bayangan menyebar
                                    blurRadius: 4, // Seberapa kabur bayangan
                                    offset: const Offset(
                                        4, 4), // Posisi bayangan (x, y)
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
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25), // Warna bayangan
                    spreadRadius: 0, // Seberapa jauh bayangan menyebar
                    blurRadius: 4, // Seberapa kabur bayangan
                    offset: const Offset(1, 1), // Posisi bayangan (x, y)
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: Data.map((index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Batas Pembayaran',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Poppins-bold',
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${(index['batas_pembayaran'])}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Poppins-bold',
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 15,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 250, 48, 48),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Text(
                                      '${(index['status_pembayaran'])}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Total Tagihan',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        color: Colors.black),
                                  ),
                                  Text(
                                    'Rp${(index['total_pembayaran']).toString()},-',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Poppins-bold',
                                      color: Color.fromRGBO(249, 1, 131, 1.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40),
                                    child: FadeAnimation(
                                      1.0,
                                      Container(
                                        width: 350,
                                        height: 50,
                                        decoration: BoxDecoration(
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
                                          color: const Color.fromRGBO(
                                              249, 1, 131, 1.0),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            shape:
                                                const RoundedRectangleBorder(),
                                          ),
                                          onPressed: () {
                                            print("object");
                                          },
                                          child: const Text(
                                            "Bayar Sekarang",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
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
    );
  }
}
