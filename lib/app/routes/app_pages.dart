import 'package:get/get.dart';

import '../data/modules/add_peminjaman/bindings/add_peminjaman_binding.dart';
import '../data/modules/add_peminjaman/views/add_peminjaman_view.dart';
import '../data/modules/book/bindings/book_binding.dart';
import '../data/modules/book/views/book_view.dart';
import '../data/modules/home/bindings/home_binding.dart';
import '../data/modules/home/views/home_view.dart';
import '../data/modules/login/bindings/login_binding.dart';
import '../data/modules/login/views/login_view.dart';
import '../data/modules/register/bindings/register_binding.dart';
import '../data/modules/register/views/register_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BOOK,
      page: () => const BookView(),
      binding: BookBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PEMINJAMAN,
      page: () => const AddPeminjamanView(),
      binding: AddPeminjamanBinding(),
    ),
  ];
}
