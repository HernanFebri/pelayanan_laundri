import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pelayanan_laundri/pages/dashboard.dart';
import 'package:pelayanan_laundri/pages/onboarding.dart';
import 'package:pelayanan_laundri/pages/login_page.dart';
import 'package:pelayanan_laundri/pages/register_page.dart';
import 'package:pelayanan_laundri/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Laundry UI",
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.scaffoldbackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        initialRoute: "/",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const Onboarding();
      });
    case "/login":
      return MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      });
    case "/register":
      return MaterialPageRoute(builder: (BuildContext context) {
        return RegisterPage();
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Dashboard();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return const Onboarding();
      });
  }
}
