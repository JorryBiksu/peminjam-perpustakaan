import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import 'package:dio/src/form_data.dart' as dioFormData;
import 'package:file_picker/file_picker.dart';

class AddBookController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController kategoriId = TextEditingController();
  final TextEditingController gambarController = TextEditingController();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  File? image;
  File? imageFile; // tambahkan variabel imageFile untuk menampilkan gambar yang diupload
  final TextEditingController tahunController = TextEditingController();

  final loading = false.obs;
  final picker = ImagePicker();

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


  Future<void> addBook() async {
    loading.value = true;
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        dioFormData.FormData formData = dioFormData.FormData.fromMap({
          "kategori_id": kategoriId.text,
          "judul": judulController.text,
          "penulis": penulisController.text,
          "penerbit": penerbitController.text,
          "gambar": gambarController.text,
          "tahun_terbit": tahunController.text,
        });

        final response = await ApiProvider.instance().post(Endpoint.addbook, data: formData);
        if (response.statusCode == 201) {
          Get.back();
          Get.snackbar("Berhasil", "Menambahkan Buku", backgroundColor: Colors.green);
        } else {
          Get.snackbar("Sorry", "Menambahkan Buku Gagal", backgroundColor: Colors.orange);
        }
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    } finally {
      loading.value = false;
    }
  }

  void increment() => count.value++;
}
