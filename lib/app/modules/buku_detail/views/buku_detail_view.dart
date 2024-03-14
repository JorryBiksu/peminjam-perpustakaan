import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: const Center(
        child: Text(
          'BukuDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
