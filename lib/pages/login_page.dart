import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pelayanan_laundri/pages/dashboard.dart';
import 'package:pelayanan_laundri/pages/lupapassword.dart';
import 'package:pelayanan_laundri/utils/constants.dart';
import 'package:pelayanan_laundri/widgets/app_button.dart';
import 'package:pelayanan_laundri/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "", password = "";

  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'User-Not-Found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Constants.primaryColor,
            content: Text('No User Found for that Email'),
          ),
        );
      } else if (e.code == 'Wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Constants.primaryColor,
            content: Text('Wrong Password Provided by user'),
          ),
        );
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
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'FontPuppins'),
                              ),
                              Text(
                                "ACCOUNT",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'FontPuppins'),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "Laundree! sudah menantikan kamu, ayo mulai laporkan keadaan terkini.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontFamily: 'FontPuppins'),
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
                          color: Colors.white),
                      padding: const EdgeInsets.all(24.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Input Widget Textfield for Email
                              InputWidget(
                                controller: emailcontroller,
                                keyboardType: TextInputType.emailAddress,
                                topLabel: "Email",
                                hintText: "Masukan email",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email tidak boleh kosong';
                                  }
                                  return null;
                                },
                                // onSaved: (value) {
                                //   _email = value!;
                                // },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              // Input Widget Textfield for Password
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
                                // onSaved: (value) {
                                //   _password = value!;
                                // },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LupaPassword(),
                                      ));
                                },
                                child: const Text(
                                  "Lupa Password ?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              AppButton(
                                type: ButtonType.PRIMARY,
                                text: "Masuk",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      email = emailcontroller.text;
                                      password = passwordcontroller.text;
                                    });
                                  }
                                  signIn();
                                },
                              )
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
