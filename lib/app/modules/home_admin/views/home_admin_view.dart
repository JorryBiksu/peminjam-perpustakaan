import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_register.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  const HomeAdminView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    String? user = StorageProvider.read(StorageKey.idUser);
    String? username = StorageProvider.read(StorageKey.username);
    String? idUser = StorageProvider.read(StorageKey.idUser);
    return Scaffold(
        backgroundColor: Color(0xFF100000),
        body: Column(
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
                    child: InkWell(
                      onTap: showLogoutDialog,
                      child: Text(
                        '$username',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Hammersmith',
                            fontSize: 24),
                      ),
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
                        'LIST BUKU \n'
                            'PERPUSTAKAAN',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Hammersmith',
                            fontSize: 24),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 20,
                      child: Text(
                        '\nBUKU TERBARU',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Hammersmith',
                            fontSize: 24),
                      ),
                    ),
                    Positioned(
                      bottom: 340,
                      left: 10,
                      right: 20,
                      child: Container(
                        height: 320, // set the height of the container
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, count) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 180,
                                  height: 320,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 310,
                      right: 10,
                      child: InkWell(
                        onTap: () => Get.toNamed(Routes.BOOK_ADMIN),
                        child: Center(
                          child: Text(
                            'TAMBAH BUKU >>',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hammersmith',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 170.0,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // handle button tap event here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(10, 100),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        primary: Colors.white,
                                      ),
                                      child: Container(
                                        width: 45, // specify the width here
                                        height: 45, // specify the height here
                                        child: Image.asset('assets/history.png'),
                                      ),
                                    ),
                                    SizedBox(height: 2.0), // Spacer untuk memberikan jarak antara button dan teks
                                    Text(
                                      'HISTORY', // Teks yang ingin ditampilkan
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Hammersmith',
                                        fontSize: 16, // Ubah ukuran teks sesuai kebutuhan Anda
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 40.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // handle button tap event here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(10, 100),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        primary: Colors.white,
                                      ),
                                      child: Container(
                                        width: 45, // specify the width here
                                        height: 45, // specify the height here
                                        child: Image.asset('assets/koleksi.png'),
                                      ),
                                    ),
                                    SizedBox(height: 2.0), // Spacer untuk memberikan jarak antara button dan teks
                                    Text(
                                      'KOLEKSI', // Teks yang ingin ditampilkan
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Hammersmith',
                                        fontSize: 16, // Ubah ukuran teks sesuai kebutuhan Anda
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 120.0,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // handle button tap event here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(10, 100),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        primary: Colors.white,
                                      ),
                                      child: Container(
                                        width: 45, // specify the width here
                                        height: 45, // specify the height here
                                        child: Image.asset('assets/petugas.png'),
                                      ),
                                    ),
                                    SizedBox(height: 2.0), // Spacer untuk memberikan jarak antara button dan teks
                                    Text(
                                      'PETUGAS', // Teks yang ingin ditampilkan
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Hammersmith',
                                        fontSize: 16, // Ubah ukuran teks sesuai kebutuhan Anda
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 40.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // handle button tap event here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(10, 100),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        primary: Colors.white,
                                      ),
                                      child: Container(
                                        width: 45, // specify the width here
                                        height: 45, // specify the height here
                                        child: Image.asset('assets/about.png'),
                                      ),
                                    ),
                                    SizedBox(height: 2.0), // Spacer untuk memberikan jarak antara button dan teks
                                    Text(
                                      'ABOUT', // Teks yang ingin ditampilkan
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Hammersmith',
                                        fontSize: 16, // Ubah ukuran teks sesuai kebutuhan Anda
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1, // 30% of the screen height
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
        )
    );
  }
}
void showLogoutDialog() {
  Get.dialog(
    AlertDialog(
      title: Text('Logout'),
      content: Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () {
            // Close the dialog without logging out
            Get.back();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Logout the user and navigate to the login page
            // You can use the `StorageProvider` to clear the user's session data
            // and then navigate to the login page using `Get.offNamed()`

            // Example:
            StorageProvider.clearAll();
            Get.offNamed(Routes.LOGIN);
          },
          child: Text('Logout'),
        ),
      ],
    ),
  );
}