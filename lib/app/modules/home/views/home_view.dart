import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF100000),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Color(0xFF100000),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Image.asset('assets/logononame.png'),
                  ),
                  Expanded(
                    child: Center(
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
                    Positioned(
                      bottom: 340,
                      left: 10,
                      right: 10,
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
                        onTap: () {
                          // handle the tap event here
                        },
                        child: Center(
                          child: Text(
                            'LAINNYA >>',
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
                      bottom: 50,
                      right: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 170.0,
                            child: Row(
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
                                  child: Text('Button 1'),
                                ),
                                SizedBox(width: 40.0),
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
                                  child: Text('Button 2'),
                                ),
                                SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: Row(
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
                                  child: Text('Button 3'),
                                ),
                                SizedBox(width: 40.0),
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
                                  child: Text('Button 4'),
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