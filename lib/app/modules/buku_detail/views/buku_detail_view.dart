import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/response_book.dart';
import '../controllers/buku_detail_controller.dart';

class BukuDetailView extends GetView<BukuDetailController> {
  const BukuDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BukuDetailView'),
        centerTitle: true,
      ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text("${state[index].judul}"),
              subtitle: Text("${state[index].penulis}"),
              trailing: Text("${state[index].kategori}"),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ))
    );
  }
}
