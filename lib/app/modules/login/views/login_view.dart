import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff100000),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 400,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 32),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: controller.usernameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelText: "EMAIL",
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 25),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          isDense: true,
                        ),
                        validator: (value) {
                          if (value!.length < 2) {
                            return "Username tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: controller.passwordController,
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelText: "PASSWORD",
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 25),
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          isDense: true,
                        ),
                        validator: (value) {
                          if (value!.length < 2) {
                            return "Password tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(
                                () => controller.loading.value
                                    ? Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              controller.login();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              // Change this to the desired color
                                              onPrimary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 32,
                                                      vertical: 12),
                                              child: Text('LOGIN'),
                                            ),
                                          ),
                                          CircularProgressIndicator(),
                                        ],
                                      )
                                    : Container(
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromRGBO(237, 50, 55, 1.0),
                                                Color.fromRGBO(245, 134, 52, 1.0),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              controller.login();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                              onPrimary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 32,
                                                      vertical: 12),
                                              child: Text('LOGIN'),
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Tidak mempunyai akun?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.REGISTER),
                                child: Text(
                                  'Sign Up                             ',
                                  style: TextStyle(
                                    color: Color(0xffF58634),
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                Text(
                  'Copyright Jo\'R 2024',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
