import 'package:flutter/material.dart';
import 'package:pelayanan_laundri/utils/constants.dart';
import 'package:pelayanan_laundri/utils/helper.dart';
import 'package:pelayanan_laundri/widgets/app_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 300,
              left: 0,
              right: 0,
              top: 0,
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 50,
              child: Image.asset(
                "assets/images/logo2.png",
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 20.0,
                      ),
                      decoration: BoxDecoration(
                        color: Constants.scaffoldbackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            "Selamat Datang Di Laundri !",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            "ini adalah versi pertama aplikasi laundry kami, silakan masuk atau buat akun di bawah",
                            style: TextStyle(
                              color: Color.fromRGBO(74, 77, 84, 1),
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          AppButton(
                            type: ButtonType.PLAIN,
                            text: "Masuk",
                            onPressed: () {
                              nextScreen(context, "/login");
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          AppButton(
                            type: ButtonType.PRIMARY,
                            text: "Daftar Akun",
                            onPressed: () {
                              nextScreen(context, "/register");
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
