import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pelayanan_laundri/pages/dashboard.dart';
import 'package:pelayanan_laundri/utils/constants.dart';
import 'package:pelayanan_laundri/widgets/app_button.dart';
import 'package:pelayanan_laundri/widgets/input_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmPasswordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  registration() async {
    if (password != null &&
        namecontroller.text != "" &&
        emailcontroller.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registrasi Berhasil'),
          ),
        );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Dashboard()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Constants.primaryColor,
              content: const Text('Password Proviede is too weak'),
            ),
          );
        } else if (e.code == "email-allready") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Constants.primaryColor,
              content: const Text('Account Already Exists'),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0.0,
                top: -20.0,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset("assets/images/mesin.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 15.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ),
                        const Center(
                          child: Column(
                            children: [
                              Text(
                                "CREATE YOUR",
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'FontPuppins',
                                ),
                              ),
                              Text(
                                "ACCOUNT",
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'FontPuppins',
                                ),
                              ),
                              Text(
                                "Laundree! sudah menantikan kamu, ayo mulai laporkan keadaan terkini.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontFamily: 'FontPuppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(24.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InputWidget(
                                controller: namecontroller,
                                keyboardType: TextInputType.name,
                                topLabel: "Nama Lengkap",
                                hintText: "Masukan Nama Lengkap",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Nama lengkap tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              InputWidget(
                                controller: emailcontroller,
                                keyboardType: TextInputType.emailAddress,
                                topLabel: "Email",
                                hintText: "Masukan email",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email tidak boleh kosong';
                                  } else if (!value.contains('@')) {
                                    return 'Email harus valid';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              InputWidget(
                                controller: passwordcontroller,
                                keyboardType: TextInputType.visiblePassword,
                                topLabel: "Password",
                                obscureText: true,
                                hintText: "Masukan password",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              InputWidget(
                                controller: confirmPasswordcontroller,
                                keyboardType: TextInputType.visiblePassword,
                                topLabel: "Konfirmasi Password",
                                obscureText: true,
                                hintText: "Masukan password",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Konfirmasi password tidak boleh kosong';
                                  } else if (value != passwordcontroller.text) {
                                    return 'Konfirmasi password harus sama dengan password';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              AppButton(
                                type: ButtonType.PRIMARY,
                                text: "Daftar",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      email = emailcontroller.text;
                                      name = namecontroller.text;
                                      password = passwordcontroller.text;
                                    });
                                    registration();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
