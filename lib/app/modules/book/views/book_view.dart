import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/response_book.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? username = StorageProvider.read(StorageKey.idUser);
    return Scaffold(
        appBar: AppBar(
          title: const Text('BookView'),
          centerTitle: true,
        ),
        body: controller.obx((state) => Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Color(0xFF100000),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // this will align the children to the far left and right of the container
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Image.asset('assets/logononame.png'),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Text(
                      '$username',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Hammersmith',
                          fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF58634), Color(0xFFFED3237)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 20,
                      child: Text(
                        'PINJAM BUKU \n'
                            'PERPUSTAKAAN',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Hammersmith',
                            fontSize: 24),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Text(
                        '\nBUKU TERBARU',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Hammersmith',
                            fontSize: 24),
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2, // number of columns in the grid
                        children: state!.map((dataBook) => GestureDetector(
                          onTap: () => Get.toNamed(Routes.BUKU_DETAIL, parameters: {
                            'id' : (dataBook.id ??0).toString(),
                          }),
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(dataBook.gambar ?? '', height: 150,),
                                Text("${dataBook.judul}"),
                                Text("Penulis ${dataBook.penulis}\n${dataBook.penerbit} - ${dataBook.tahunTerbit}"),
                                ElevatedButton(onPressed: ()=> Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                                  'id' : (dataBook.id ??0).toString(), 'judul' :dataBook.judul ?? '-'
                                }), child: Text("Pinjam")),
                              ],
                            ),
                          ),
                        )).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height* 0.1, // 30% of the screen height
              color: Color(0xFF100000),
              child: Center(
                child: Text(
                  'Copyright ©Jo\'R 2024',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Hammersmith',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ), onLoading: Center(child: CupertinoActivityIndicator())
        )
    );
  }
}
