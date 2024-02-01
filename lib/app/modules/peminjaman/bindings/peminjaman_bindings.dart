import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_xiirplc/app/modules/peminjaman/controllers/peminjaman_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeminjamanController>(
          () => PeminjamanController(),
    );
  }
}
