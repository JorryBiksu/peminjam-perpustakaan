import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddBookView'),
        centerTitle: true,
      ),
      body: GetBuilder<AddBookController>(
        init: AddBookController(),
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Kategori ID'),
                  controller: controller.kategoriId,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Judul'),
                  controller: controller.judulController,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Penulis'),
                  controller: controller.penulisController,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Penerbit'),
                  controller: controller.penerbitController,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Gambar'),
                  controller: controller.gambarController,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Tahun Terbit'),
                  controller: controller.tahunController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.addBook();
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}