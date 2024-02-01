import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.parameters['judul']}'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.tanggalPinjamController,
              decoration: InputDecoration(
                hintText: "Masukan tanggal pinjam",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Tidak Boleh Kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.tanggalKembaliController,
              decoration: InputDecoration(
                hintText: "Masukan tanggal pinjam",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Tidak Boleh Kosong";
                }
                return null;
              },
            ), Obx(() => controller.loading.value?
            CircularProgressIndicator():
            ElevatedButton(onPressed: (){
              controller.pinjam();
            }, child: Text("Pinjam"))
            )
          ],
        ).paddingOnly(left: 12, right: 12),
      ),
    );
  }
}
