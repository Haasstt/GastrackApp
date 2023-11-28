// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, file_names
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class BaseProvider extends GetConnect {
  var host = "192.168.1.25:8000";
  var Url = "";
  var Urlupdatedatauser = "";
  var header = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${SpUtil.getString('token')!}'
  };

  BaseProvider() {
    Url = "http://$host/api/pelanggan";
  }
}

// Route::post('/pelanggan/login', [ApiPelangganController::class, 'login_action']);

// Route::middleware('auth:sanctum')->group(function () {
//     Route::post('/pelanggan/logout', [ApiPelangganController::class, 'logout']);
//     Route::put('/pelanggan/update/{id}', [ApiPelangganController::class, 'edit_action']);
//     Route::get('/pelanggan/getupdate/{id}', [ApiPelangganController::class, 'edit_index']);
//     Route::post('/pembelian/create', [ApiPembelianController::class, 'create_transaksi']);
// }); 