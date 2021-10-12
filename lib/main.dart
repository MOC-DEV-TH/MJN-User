import 'package:MJN/LocalString/LocalString.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/AccountDetailView.dart';
import 'package:MJN/views/ChangePasswordView.dart';
import 'package:MJN/views/ContactUsView.dart';
import 'package:MJN/views/CreateServiceTicketView.dart';
import 'package:MJN/views/HomeView.dart';
import 'package:MJN/views/LoginView.dart';
import 'package:MJN/views/NewLoginView.dart';
import 'package:MJN/views/NotificationView.dart';
import 'package:MJN/views/PaymentView.dart';
import 'package:MJN/views/SecondLoginView.dart';
import 'package:MJN/views/ServiceComplainView.dart';
import 'package:MJN/views/SignUpView.dart';
import 'package:MJN/views/tabView.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(
    new GetMaterialApp(
      translations: LocalString(),
      locale: Locale('en', 'US'),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                button: TextStyle(color: Colors.white),
              )),
      debugShowCheckedModeBanner: false,
      routes: {
        TabScreens.routeName: (ctx) => TabScreens(),
        ChangePasswordView.routeName: (ctx) => ChangePasswordView(),
        CreateServiceTicketView.routeName: (ctx) => CreateServiceTicketView(),
        SecondLoginVIew.routeName: (ctx) => SecondLoginVIew(),
      },
      home: SplashScreen(),
    ),
  );
}



class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: Locale('en', 'US'),
      title: 'Splash Screen with Lottie Animation',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {


  AnimationController _controller;
  final loginDataStorage = GetStorage();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (5)),
      vsync: this,
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        'assets/splash_lottie_network.json',
        controller: _controller,
        height: MediaQuery.of(context).size.height * 1,
        animate: true,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(() =>

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => loginDataStorage.read(TOKEN) != null
                          ? TabScreens()
                          : LoginView()),
                ));
        },
      ),
    );
  }
}
