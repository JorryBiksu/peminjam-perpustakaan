import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_book.dart';
import '../../../data/model/response_pinjam.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class BukuDetailController extends GetxController  with StateMixin<List<Data>>{

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
    try{

      final response = await ApiProvider.instance().get("${Endpoint
          .book}/${Get.parameters['id']!}");

      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        if (responseBook.data!.isEmpty){
          change(null, status: RxStatus.empty());
        } else {
          change(responseBook.data!, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null){
          log(("dio ${e.response?.data['message']}"));
          change(null, status: RxStatus.error("dio ${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error("cek "+(e.message ?? "")));
      }
    } catch (e) {
      change(null, status: RxStatus.error("catch "+e.toString()));
    }
  }
}
