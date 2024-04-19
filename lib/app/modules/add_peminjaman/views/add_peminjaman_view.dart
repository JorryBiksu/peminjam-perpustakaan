import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF100000),
      appBar: AppBar(
        backgroundColor: Color(0xFFF58634),
        title: Text(
          'Pinjam Buku ${Get.parameters['judul'].toString()}',
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'Montserrat',
              fontSize: 15.0,
              letterSpacing: -0.5,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),

      body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
                children: [

                  Container(
                    margin: const EdgeInsets.only(top: 40.0, bottom: 5.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                      "${Endpoint.image}${Get.parameters['gambar']}",
                        height: 200, // Ukuran gambar dalam Card
                      ),

                        ),
                      ),
                    ),

                  Container(
                    child: Column(
                      children: [

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Text(
                                  'Tanggal Pinjam',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFFFFFFFF),
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  child: DateTimePicker(
                                    controller: controller.tanggalPinjamController,
                                    decoration: InputDecoration(
                                      hintText: 'Masukan Tanggal Pinjam',
                                      hintStyle: TextStyle(color: Color(0xFFFFFFFF)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    dateMask: 'yyyy-MM-dd',
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    dateLabelText: 'Date',
                                    onChanged: (val) => print(val),
                                    validator: (val) {
                                      print(val);
                                      return null;
                                    },
                                    onSaved: (val) => print(val),
                                  )
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 3,
                        ),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Text(
                                  'Tanggal Kembali',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFFFFFFFF),
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  child: DateTimePicker(
                                    controller: controller.tanggalKembaliController,
                                    decoration: InputDecoration(
                                      hintText: 'Masukan Tanggal Kembali',
                                      hintStyle: TextStyle(color: Color(0xFFFFFFFF)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    dateMask: 'yyyy-MM-dd',
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    dateLabelText: 'Date',
                                    onChanged: (val) => print(val),
                                    validator: (val) {
                                      print(val);
                                      return null;
                                    },
                                    onSaved: (val) => print(val),
                                  )
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      children: [
                        Obx(() => controller.loadingaddpinjam.value?
                        CircularProgressIndicator():
                        InkWell(
                            onTap: (){
                              controller.postPinjamBuku();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFFF58634), Color(0xFFFED3237)],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "PINJAM BUKU",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hammersmith',
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]
            ),
          )
      ),

    );
  }
}