// ignore_for_file: depend_on_referenced_packages, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gastrack/animation/animations.dart';

class RiwayatTransaksiPage extends StatefulWidget {
  const RiwayatTransaksiPage({super.key});

  @override
  State<RiwayatTransaksiPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RiwayatTransaksiPage> {
  List<Map<String, dynamic>> Data = [
    {
      'tanggal': "20-11-2023",
      'total_pesanan': 100,
      'total_pembayaran': "1.000.000,-",
      'total_pemesanan': "4",
      'status_pembayaran': "Sudah Bayar",
    },
    {
      'tanggal': "21-11-2023",
      'total_pesanan': 50,
      'total_pembayaran': "500.000,-",
      'total_pemesanan': "3",
      'status_pembayaran': "Sudah Bayar",
    },
    {
      'tanggal': "22-11-2023",
      'total_pesanan': 20,
      'total_pembayaran': "200.000,-",
      'total_pemesanan': "4",
      'status_pembayaran': "Belum Bayar",
    },
  ];

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
            padding:
                const EdgeInsets.only(top: 120, left: 5, right: 5, bottom: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: Data.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.grey.withOpacity(0.25), // Warna bayangan
                          spreadRadius: 0, // Seberapa jauh bayangan menyebar
                          blurRadius: 4, // Seberapa kabur bayangan
                          offset: const Offset(0, 1), // Posisi bayangan (x, y)
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FadeAnimation(
                            0.5,
                            SizedBox(
                              height: 100,
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tanggal ${(Data[index]['tanggal'])}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Jumlah Pesanan : ${(Data[index]['total_pesanan'])}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    'Total Pembayaran : Rp${(Data[index]['total_pembayaran'])}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '(${(Data[index]['total_pemesanan'])}) Pemesanan',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _showPopupDetailTransaksi(context);
                                          },
                                          child: const Text(
                                            'Detail Pemesanan',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'Poppins',
                                              color: Color.fromRGBO(
                                                  249, 1, 131, 1.0),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FadeAnimation(
                            0.7,
                            SizedBox(
                              height: 100,
                              child: Column(
                                children: [
                                  Text(
                                    '${(Data[index]['status_pembayaran'])}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(249, 1, 131, 1.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
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
                    "Riwayat Transaksi",
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

  void _showPopupDetailTransaksi(BuildContext context) async {
    showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: 'Sign In',
        context: context,
        transitionDuration: const Duration(milliseconds: 400),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          Tween<Offset> tween;
          tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
          return SlideTransition(
            position: tween.animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            ),
            child: child,
          );
        },
        pageBuilder: (context, _, __) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return Center(
              child: Container(
                height: 350,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 246, 246, 246),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 2,
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Detail Pesanan",
                                          style: TextStyle(
                                            fontFamily: 'Poppins-bold',
                                            fontSize: 14,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                        Container(
                                          height: 70,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: const SingleChildScrollView(
                                            physics: BouncingScrollPhysics(),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      '13-09-2023 03:59',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '25 bar X',
                                                          style: TextStyle(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 12,
                                                            color: Color.fromARGB(
                                                                255, 0, 0, 0),
                                                          ),
                                                        ),
                                                        Text(
                                                          ' Rp 100.000',
                                                          style: TextStyle(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 12,
                                                            color: Colors.black45,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      '13-09-2023 20:12',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '25 bar X',
                                                          style: TextStyle(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 12,
                                                            color: Color.fromARGB(
                                                                255, 0, 0, 0),
                                                          ),
                                                        ),
                                                        Text(
                                                          ' Rp 100.000',
                                                          style: TextStyle(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 12,
                                                            color: Colors.black45,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      '13-09-2023 03:59',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '25 bar X',
                                                          style: TextStyle(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 12,
                                                            color: Color.fromARGB(
                                                                255, 0, 0, 0),
                                                          ),
                                                        ),
                                                        Text(
                                                          ' Rp 100.000',
                                                          style: TextStyle(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 12,
                                                            color: Colors.black45,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      '13-09-2023 20:12',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '25 bar X',
                                                          style: TextStyle(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 12,
                                                            color: Color.fromARGB(
                                                                255, 0, 0, 0),
                                                          ),
                                                        ),
                                                        Text(
                                                          ' Rp 100.000',
                                                          style: TextStyle(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 12,
                                                            color: Colors.black45,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomPaint(
                                                size: Size(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .80,
                                                    1),
                                                painter: DashedLinePainter(),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Total Transaksi',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  ),
                                                ),
                                                Text(
                                                  'Rp1.000.000,-',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomPaint(
                                                size: Size(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .80,
                                                    1),
                                                painter: DashedLinePainter(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          const Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "No. Pemesanan",
                                          style: TextStyle(
                                            fontFamily: 'Poppins-bold',
                                            fontSize: 14,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                        Text(
                                          'SMKO003280382032',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                128, 38, 198, 1.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Waktu Pemesanan",
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                            ),
                                            Text(
                                              '13-09-2023 03:59',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Waktu Pembayaran",
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                            ),
                                           Text(
                                                    "13-09-2023 21:59",
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 12,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  
                      const Positioned(
                        left: 0,
                        right: 0,
                        bottom: -50,
                        child: Icon(
                          Icons.close_rounded,
                          color: Color.fromARGB(184, 255, 255, 255),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    const double dashWidth = 5.0;
    const double dashSpace = 5.0;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}