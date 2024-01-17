// ignore_for_file: depend_on_referenced_packages, file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gastrack/animation/animations.dart';
import 'package:gastrack/loading.dart';
import 'package:gastrack/provider/TransaksiProvider.dart';
import 'package:lottie/lottie.dart';
import 'package:sp_util/sp_util.dart';

class RiwayatTransaksiPage extends StatefulWidget {
  const RiwayatTransaksiPage({super.key});

  @override
  State<RiwayatTransaksiPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RiwayatTransaksiPage> {
  List<Map<String, dynamic>> Data = [];

  List<Map<String, dynamic>> DataDetail = [];

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
    TransaksiProvider().getTransaksiUser(SpUtil.getInt('id')).then((value) {
      if (value.statusCode == 200) {
        var data = value.body['data'];
        setState(() {
          for (var element in data) {
            setState(() {
              Data.add(element);
            });
          }
        });
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
          message: pesan,
          icon: const Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.white,
          ),
          duration: const Duration(seconds: 3),
        ).show(context);
      } else {
        print(value.statusCode);
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
      }
    });
  }

  void GetDataDetail(id) {
    customLoading(context);
    setState(() {
      DataDetail.clear();
    });
    setState(() {
      gagalmemuat = false;
    });
    TransaksiProvider().getDetailTransaksiUser(id).then((value) {
      if (value.statusCode == 200) {
        Navigator.pop(context);
        var data = value.body['data'];
        setState(() {
          DataDetail.addAll([data]);
        });
        _showPopupDetailTransaksi(context);
      } else if (value.statusCode == 422) {
        Navigator.pop(context);
        var pesan = value.body['message'];
        setState(() {
          message = pesan;
          gagalmemuat = !gagalmemuat;
        });
      } else {
        Navigator.pop(context);
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
      }
    });
  }

  @override
  void initState() {
    GetData();
    super.initState();
  }

   Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SizedBox(
          child: Stack(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 120, left: 5, right: 5, bottom: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Data.isEmpty
                      ? Column(
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    datakosong
                                        ? Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.symmetric(
                                                    vertical: 10),
                                                child: const Icon(
                                                  Icons.no_backpack_outlined,
                                                  size: 50,
                                                ),
                                              ),
                                              Text(
                                                '${(message)}',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          )
                                        : gagalmemuat
                                            ? Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.symmetric(
                                                            vertical: 5),
                                                    child: const Icon(
                                                      Icons.cloud_off,
                                                      size: 50,
                                                      color: Colors.black26,
                                                    ),
                                                  ),
                                                  const Text(
                                                    'Offline',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins',
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Stack(
                                                children: [
                                                  SizedBox(
                                                    height: 90,
                                                    width: 90,
                                                    child: Lottie.asset(
                                                        'assets/js/loadingPage.json',
                                                        fit: BoxFit.cover),
                                                  ),
                                                  const Positioned(
                                                    top: 65,
                                                    child: SizedBox(
                                                      width: 90,
                                                      child: Text(
                                                        'Memuat',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: [
                            Column(
                              children: Data.map((index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.25), // Warna bayangan
                                        spreadRadius:
                                            0, // Seberapa jauh bayangan menyebar
                                        blurRadius: 4, // Seberapa kabur bayangan
                                        offset: const Offset(
                                            0, 1), // Posisi bayangan (x, y)
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        FadeAnimation(
                                          0.5,
                                          SizedBox(
                                            height: 90,
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'resi ${(index['resi'])}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        'Total Tagihan',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Rp${(index['total_tagihan'])}',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Poppins-bold',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    GetDataDetail(
                                                        index['id_transaksi']
                                                            .toString());
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FadeAnimation(
                                          0.7,
                                          SizedBox(
                                            height: 90,
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${(index['status_pembayaran'])}',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                        249, 1, 131, 1.0),
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
                              }).toList(),
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
        ),
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
                height: 550,
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
                          children: DataDetail.map((index) {
                            return SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                          color:
                                              Color.fromRGBO(249, 1, 131, 1.0),
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Nomor Resi',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins-bold',
                                                                fontSize: 12,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                              ),
                                                            ),
                                                            Text(
                                                              ': ',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins-bold',
                                                                fontSize: 12,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Pelanggan',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins-bold',
                                                                fontSize: 12,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                              ),
                                                            ),
                                                            Text(
                                                              ': ',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins-bold',
                                                                fontSize: 12,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Nomor HP',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins-bold',
                                                                fontSize: 12,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                              ),
                                                            ),
                                                            Text(
                                                              ': ',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins-bold',
                                                                fontSize: 12,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Alamat',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins-bold',
                                                                fontSize: 12,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                              ),
                                                            ),
                                                            Text(
                                                              ': ',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins-bold',
                                                                fontSize: 12,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${(index['resi'])}',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromRGBO(
                                                                    0, 0, 0, 1),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${(index['pelanggan'])}',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromRGBO(
                                                                    0, 0, 0, 1),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${(index['no_hp'])}',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromRGBO(
                                                                    0, 0, 0, 1),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${(index['alamat'])}',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromRGBO(
                                                                    0, 0, 0, 1),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Pesanan Awal',
                                              style: TextStyle(
                                                fontFamily: 'Poppins-bold',
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5))),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              padding: const EdgeInsets.all(7),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Colors.black12),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 7),
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          'Tanggal',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-bold',
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Jumlah Transaksi',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-bold',
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Harga',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-bold',
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${(index['pesanan_awal']['tanggal_pesanan'])}',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 10,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${(index['pesanan_awal']['jumlah_bar'].toString())} bar',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 10,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Rp${(index['pesanan_awal']['harga_pesanan'])}',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 10,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Pesanan Akhir',
                                              style: TextStyle(
                                                fontFamily: 'Poppins-bold',
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5))),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              padding: const EdgeInsets.all(7),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Colors.black12),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 7),
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          'Tanggal',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-bold',
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Jumlah Transaksi',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-bold',
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Harga',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-bold',
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${(index['pesanan_akhir']['tanggal_pesanan'])}',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 10,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${(index['pesanan_akhir']['jumlah_bar'].toString())} bar',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 10,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Rp${(index['pesanan_akhir']['harga_pesanan'])}',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 10,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Semua Pesanan',
                                              style: TextStyle(
                                                fontFamily: 'Poppins-bold',
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5))),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              padding: const EdgeInsets.all(7),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Colors.black12),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 7),
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          'Tanggal',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-bold',
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Jumlah Transaksi',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-bold',
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Harga',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-bold',
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 70,
                                                    child:
                                                        SingleChildScrollView(
                                                      physics:
                                                          const BouncingScrollPhysics(),
                                                      child: Column(
                                                        children:
                                                            index['pesanan']
                                                                .map<Widget>(
                                                                    (item) {
                                                          return Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                item[
                                                                    'tanggal_pesanan'],
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 10,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                ),
                                                              ),
                                                              Text(
                                                                '${item['jumlah_bar']} bar',
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 10,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                ),
                                                              ),
                                                              Text(
                                                                ' Rp ${item['harga_pesanan']}',
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
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
