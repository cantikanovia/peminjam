import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../constant/endpoint.dart';
import '../../../provider/app_provider.dart';


class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  post() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.register,
            data:
            {
              "nama": namaController.text.toString(),
              "username": usernameController.text.toString(),
              "telp": telpController.text.toString(),
              "alamat": alamatController.text.toString(),
              "password": passwordController.text.toString()
            }
        );
        if (response.statusCode == 201) {
          Get.back();
          Get.snackbar("Pemberitahuan", "Register Berhasil", backgroundColor: Colors.green);
          Get.offAllNamed(Routes.LOGIN);
        } else {
          Get.snackbar("Sorry", "Register Gagal", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);

      if (e.response != null) {
        if(e.response!.statusCode == 500){
          Get.snackbar("Eror", "username sudah ada");
        }else{
          if (e.response?.data != null) {
            Get.snackbar("Sorry", "${e.response?.data['message']}",
                backgroundColor: Colors.orange);
          }
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
