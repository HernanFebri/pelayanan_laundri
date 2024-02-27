import 'package:flutter/material.dart';
import 'package:pelayanan_laundri/utils/constants.dart';
import 'package:pelayanan_laundri/utils/helper.dart';
import 'package:pelayanan_laundri/widgets/app_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            scale: 1.2,
            alignment: Alignment(0, -0.3),
            image: AssetImage("assets/images/illustration.png"),
          ),
        ),
        child: Center(
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
                        type: ButtonType.PRIMARY,
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
                        text: "Daftar",
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
      ),
    );
  }
}
