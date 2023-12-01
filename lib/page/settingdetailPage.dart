// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, camel_case_types, file_names, prefer_typing_uninitialized_variables

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gastrack/animation/BounceAnimation.dart';
import 'package:gastrack/page/addAlamatPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gastrack/controller/updatedatauserController.dart';
import 'package:gastrack/provider/UserProvider.dart';

class Changename extends StatefulWidget {
  const Changename({super.key});

  @override
  State<Changename> createState() => _MyHomePageState_Changename();
}

class _MyHomePageState_Changename extends State<Changename> {
  final UpdateDataUserController _controller = UpdateDataUserController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          "Ubah Username",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          controller: _controller.txtUsername,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Ubah username baru',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromRGBO(249, 1, 131, 1.0),
                            )),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan username baru Anda';
                            }
                            return null;
                          },
                          onChanged: (_) {
                            setState(() {
                              _isButtonEnabled =
                                  _formKey.currentState!.validate();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _isButtonEnabled
                          ? const Color.fromRGBO(249, 1, 131, 1.0)
                          : const Color.fromARGB(255, 223, 223, 223),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: _isButtonEnabled
                              ? const Color.fromARGB(255, 122, 122, 122)
                                  .withOpacity(0.55)
                              : const Color.fromARGB(255, 122, 122, 122)
                                  .withOpacity(0),
                          spreadRadius: 0, // Seberapa jauh bayangan menyebar
                          blurRadius: 5, // Seberapa kabur bayangan
                          offset: const Offset(0, 4), // Posisi bayangan (x, y)
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                      ),
                      onPressed: _isButtonEnabled
                          ? () {
                              _controller.ChangeName();
                            }
                          : null,
                      child: const Text(
                        "Update",
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
          ),
        ),
      ),
    );
  }
}

class Changeperusahaan extends StatefulWidget {
  const Changeperusahaan({super.key});

  @override
  State<Changeperusahaan> createState() => _MyHomePageState_Changeperusahaan();
}

class _MyHomePageState_Changeperusahaan extends State<Changeperusahaan> {
  final UpdateDataUserController _controller = UpdateDataUserController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          "Ubah Nama Perusahaan",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          controller: _controller.txtPerusahaan,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Ubah perusahaan baru',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromRGBO(249, 1, 131, 1.0),
                            )),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan nama perusahaan baru Anda';
                            }
                            return null;
                          },
                          onChanged: (_) {
                            setState(() {
                              _isButtonEnabled =
                                  _formKey.currentState!.validate();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _isButtonEnabled
                          ? const Color.fromRGBO(249, 1, 131, 1.0)
                          : const Color.fromARGB(255, 223, 223, 223),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: _isButtonEnabled
                              ? const Color.fromARGB(255, 122, 122, 122)
                                  .withOpacity(0.55)
                              : const Color.fromARGB(255, 122, 122, 122)
                                  .withOpacity(0),
                          spreadRadius: 0, // Seberapa jauh bayangan menyebar
                          blurRadius: 5, // Seberapa kabur bayangan
                          offset: const Offset(0, 4), // Posisi bayangan (x, y)
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                      ),
                      onPressed: _isButtonEnabled
                          ? () {
                              _controller.ChangePerusahaan();
                            }
                          : null,
                      child: const Text(
                        "Update",
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
          ),
        ),
      ),
    );
  }
}

class Changeemail extends StatefulWidget {
  const Changeemail({super.key});

  @override
  State<Changeemail> createState() => _MyHomePageState_Changeemail();
}

class _MyHomePageState_Changeemail extends State<Changeemail> {
  final UpdateDataUserController _controller = UpdateDataUserController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          "Ubah Email",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          controller: _controller.txtEmail,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Ubah email baru',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromRGBO(249, 1, 131, 1.0),
                            )),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan email baru Anda';
                            } else if (!isValidEmail(value)) {
                              return 'Format email Anda tidak sesuai ketentuan';
                            }
                            return null;
                          },
                          onChanged: (_) {
                            setState(() {
                              _isButtonEnabled =
                                  _formKey.currentState!.validate();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _isButtonEnabled
                          ? const Color.fromRGBO(249, 1, 131, 1.0)
                          : const Color.fromARGB(255, 223, 223, 223),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: _isButtonEnabled
                              ? const Color.fromARGB(255, 122, 122, 122)
                                  .withOpacity(0.55)
                              : const Color.fromARGB(255, 122, 122, 122)
                                  .withOpacity(0),
                          spreadRadius: 0, // Seberapa jauh bayangan menyebar
                          blurRadius: 5, // Seberapa kabur bayangan
                          offset: const Offset(0, 4), // Posisi bayangan (x, y)
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                      ),
                      onPressed: _isButtonEnabled
                          ? () {
                              _controller.ChangeEmail();
                            }
                          : null,
                      child: const Text(
                        "Update",
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
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }
}

class Changephone extends StatefulWidget {
  const Changephone({super.key});

  @override
  State<Changephone> createState() => _MyHomePageState_Changephone();
}

class _MyHomePageState_Changephone extends State<Changephone> {
  final UpdateDataUserController _controller = UpdateDataUserController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;
  List<Map<String, dynamic>> Datauser = [];

  @override
  void initState() {
    UserProvider().getDatauser(SpUtil.getInt('id')).then((value) {
      if (value.statusCode == 200) {
        var data = value.body['datauser'];
        setState(() {
          Datauser.add(data);
        });
        EasyLoading.dismiss();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    return ChangeTelp(context);
  }

  Scaffold ChangeTelp(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          "Ubah No. Telp",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          controller: _controller.txtnotelp,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Container(
                                color: const Color.fromRGBO(249, 1, 131, 1.0),
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: const Text(
                                  "+62",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                )),
                            labelText: '(tidak perlu menulis angka 0 pertama)',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromRGBO(249, 1, 131, 1.0),
                            )),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan nomor telepon Anda';
                            } else if (value.length < 11) {
                              return 'Nomor telepon minimal 11 digit';
                            } else if (value.length > 14) {
                              return 'Nomor telepon maksimal 14 digit';
                            } else if (value.contains(' ')) {
                              return 'Nomor telepon tidak menggunakan spasi';
                            } else if (value.contains(RegExp(r'[a-z]')) ||
                                value.contains(RegExp(r'[A-Z]')) ||
                                value.contains(RegExp(r'[;\/,.*()=#+_-]'))) {
                              return 'Nomor telepon hanya boleh menggunakan angka';
                            }
                            return null;
                          },
                          onChanged: (_) {
                            setState(() {
                              _isButtonEnabled =
                                  _formKey.currentState!.validate();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _isButtonEnabled
                          ? const Color.fromRGBO(249, 1, 131, 1.0)
                          : const Color.fromARGB(255, 223, 223, 223),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: _isButtonEnabled
                              ? const Color.fromARGB(255, 122, 122, 122)
                                  .withOpacity(0.55)
                              : const Color.fromARGB(255, 122, 122, 122)
                                  .withOpacity(0),
                          spreadRadius: 0, // Seberapa jauh bayangan menyebar
                          blurRadius: 5, // Seberapa kabur bayangan
                          offset: const Offset(0, 4), // Posisi bayangan (x, y)
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                      ),
                      onPressed: _isButtonEnabled
                          ? () {
                              _controller.ChangeTelp();
                            }
                          : null,
                      child: const Text(
                        "Update",
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
          ),
        ),
      ),
    );
  }

}

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _MyHomePageState_Changepassword();
}

class _MyHomePageState_Changepassword extends State<Changepassword> {
  final UpdateDataUserController _controller = UpdateDataUserController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;
  bool _isPasswordlamaVisible = true;
  bool _isPasswordbaruVisible = true;
  bool _isConfirmPasswordVisible = true;

  void _togglePasswordLamaVisibility() {
    setState(() {
      _isPasswordlamaVisible = !_isPasswordlamaVisible;
    });
  }

  void _togglePasswordBaruVisibility() {
    setState(() {
      _isPasswordbaruVisible = !_isPasswordbaruVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          "Ubah Password",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          controller: _controller.txtLastPass,
                          obscureText: _isPasswordlamaVisible,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: _togglePasswordLamaVisibility,
                              child: Icon(
                                _isPasswordlamaVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            labelText: 'Password lama',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromRGBO(249, 1, 131, 1.0),
                            )),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan kata sandi lama Anda';
                            }
                            return null; // Return null if the input is valid
                          },
                          onChanged: (_) {
                            setState(() {
                              _isButtonEnabled =
                                  _formKey.currentState!.validate();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          controller: _controller.txtNewPass,
                          obscureText: _isPasswordbaruVisible,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: _togglePasswordBaruVisibility,
                              child: Icon(
                                _isPasswordbaruVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            labelText: 'Password baru',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromRGBO(249, 1, 131, 1.0),
                            )),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'Masukkan kata sandi Anda';
                            }
                            if (!isPasswordValid(value)) {
                              return 'Minimal 8 karakter terdiri dari huruf kapital dan angka';
                            }
                            return null; // Return null if the input is valid
                          },
                          onChanged: (_) {
                            setState(() {
                              _isButtonEnabled =
                                  _formKey.currentState!.validate();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          controller: _controller.txtConfirmNewPass,
                          obscureText: _isConfirmPasswordVisible,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: _toggleConfirmPasswordVisibility,
                              child: Icon(
                                _isConfirmPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            labelText: 'Konfirmasi password baru',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromRGBO(249, 1, 131, 1.0),
                            )),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan konfirmasi kata sandi Anda';
                            }
                            return null; // Return null if the input is valid
                          },
                          onChanged: (_) {
                            setState(() {
                              _isButtonEnabled =
                                  _formKey.currentState!.validate();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _isButtonEnabled
                          ? const Color.fromRGBO(249, 1, 131, 1.0)
                          : const Color.fromARGB(255, 223, 223, 223),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: _isButtonEnabled
                              ? const Color.fromARGB(255, 122, 122, 122)
                                  .withOpacity(0.55)
                              : const Color.fromARGB(255, 122, 122, 122)
                                  .withOpacity(0),
                          spreadRadius: 0, // Seberapa jauh bayangan menyebar
                          blurRadius: 5, // Seberapa kabur bayangan
                          offset: const Offset(0, 4), // Posisi bayangan (x, y)
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                      ),
                      onPressed: _isButtonEnabled
                          ? () {
                              _controller.ChangePass();
                            }
                          : null,
                      child: const Text(
                        "Ubah Password",
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
          ),
        ),
      ),
    );
  }

  bool isPasswordValid(String password) {
    final RegExp passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9]).{8,}$');
    return passwordRegExp.hasMatch(password);
  }
}

class ChangeAlamat extends StatefulWidget {
  const ChangeAlamat({super.key});

  @override
  State<ChangeAlamat> createState() => _MyHomePageState_ChangeAlamat();
}

class _MyHomePageState_ChangeAlamat extends State<ChangeAlamat> {
  List<Map<String, dynamic>> Data = [];
  bool gagalmemuat = false;
  var message;

  void GetData() {
    setState(() {
      gagalmemuat = false;
    });
    UserProvider().getDetailuser(SpUtil.getInt('id')).then((value) {
      if (value.statusCode == 200) {
        var data = value.body['datauser'];
        setState(() {
          Data.clear();
          Data.addAll([data]);
        });
        print(Data);
        EasyLoading.dismiss();
      } else if (value.hasError == true) {
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

  @override
  void initState() {
    GetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          "Alamat Anda",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Data.isEmpty
            ? Column(children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const CircularProgressIndicator(
                    strokeWidth: 1,
                    color: Color.fromRGBO(249, 1, 131, 1.0),
                  ),
                ),
              ])
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(36, 249, 1, 129),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              width: 1,
                              color: const Color.fromRGBO(249, 1, 131, 1.0),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: Data.map((index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Perusahaan ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '${(index['nama_pemilik'])}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins-bold',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${(index['nama_perusahaan'])}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins-bold',
                                    color: Colors.black,
                                  ),
                                ),
                                index['koordinat'] == null
                                    ? const Text(
                                        '',
                                      )
                                    : Text(
                                        '${(index['koordinat'])}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          color: Colors.black26,
                                        ),
                                      ),
                                Text(
                                  '${(index['alamat'])}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                ),
                                index['koordinat'] == null
                                    ? Belum_pinpoint()
                                    : Sudah_pinpoint(),
                              ],
                            );
                          }).toList(),
                        ),
                      )),
                ],
              ),
      ),
    );
  }

  Column Sudah_pinpoint() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Row(
                children: [
                  Icon(Icons.place_outlined,
                      size: 20, color: Color.fromARGB(255, 39, 193, 0)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Sudah Pinpoint',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        fontFamily: 'Poppins-bold',
                        color: Color.fromARGB(255, 39, 193, 0)),
                  ),
                ],
              ),
            ),
            const Icon(Icons.check_circle,
                size: 20, color: Color.fromARGB(255, 39, 193, 0)),
          ],
        ),
        BounceAnimation(
          0.1,
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black26)),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const MapsAlamat(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              child: const Text(
                "Ubah Alamat",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Column Belum_pinpoint() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.place_outlined,
                      size: 20, color: Color.fromARGB(255, 251, 5, 5)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Belum Pinpoint',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        fontFamily: 'Poppins-bold',
                        color: Color.fromARGB(255, 251, 5, 5)),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 1,
                  vertical: 1,
                ),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 251, 5, 5),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Icon(Icons.close_rounded,
                    size: 15, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ],
          ),
        ),
        BounceAnimation(
          0.1,
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black26)),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const MapsAlamat(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              child: const Text(
                "Atur Pinpoint",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
