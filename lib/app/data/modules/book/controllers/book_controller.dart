import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../constant/endpoint.dart';
import '../../../model/response_book.dart';
import '../../../provider/app_provider.dart';


class BookController extends GetxController with StateMixin<List<DataBook>> {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getData() async {
  change(null, status: RxStatus.loading());
  try {
    final response = await ApiProvider.instance().get(Endpoint.book);
    if (response.statusCode == 200) {
      final ResponseBook responseBook = ResponseBook.fromJson(response.data);
    if (responseBook.data!.isEmpty) {
      change(null, status: RxStatus.empty());
    }else{
      change(responseBook.data, status: RxStatus.success());
    }
  }else{
      change (null, status: RxStatus.error("Gagal mengambil data"));
  }
  } on DioException
     catch (e){
    if (e. response != null){
      if (e. response?.data != null){
      change (null, status: RxStatus.error("${e.response?.data['message']}"));
      }
  }else{
  change (null, status: RxStatus.error(e.message ?? ""));
  }
    } catch (e) {
  change (null, status: RxStatus.error(e.toString()));
  }

}}