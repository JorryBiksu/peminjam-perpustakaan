import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_admin_controller.dart';

class BookAdminView extends GetView<BookAdminController> {
  const BookAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BookView'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.ADD_BOOK),child: Icon(Icons.add),
        ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index){
            Data dataBook = state[index];
            return ListTile(
                title: Text("${dataBook.judul}"),
                subtitle: Text("Penulis ${dataBook.penulis}\n${dataBook.penerbit} - ${dataBook.tahunTerbit}")
            );
          },
          separatorBuilder: (context, index) => Divider(),
        ))
    );
  }
}
