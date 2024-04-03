import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import 'package:dio/src/form_data.dart' as dioFormData;
import 'package:file_picker/file_picker.dart';

class AddBookController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController kategoriId = TextEditingController();
  final TextEditingController judul = TextEditingController();
  final TextEditingController penulis = TextEditingController();
  final TextEditingController penerbit = TextEditingController();
  File? image;
  final TextEditingController tahunTerbit = TextEditingController();

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

  Future<void> pickImageFromStorage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      if (file.size > 1000000) {
        // File size is larger than 1 MB
        Get.snackbar('Error', 'File is too large', backgroundColor: Colors.red);
      } else {
        List<int> imageBytes = file.bytes!;
        Uint8List uint8List = Uint8List.fromList(imageBytes);
        image = File.fromRawPath(uint8List.buffer.asUint8List());
        // Use the `uint8List` variable to upload the image data
      }
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  Future<void> addBook() async {
    loading.value = true;
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        dioFormData.FormData formData = dioFormData.FormData.fromMap({
          "kategori_id": kategoriId.text,
          "judul": judul.text,
          "penulis": penulis.text,
          "penerbit": penerbit.text,
          "gambar": await dio.MultipartFile.fromFile(image!.path, filename: 'gambar.jpg'),
          "tahun_terbit": tahunTerbit.text,
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