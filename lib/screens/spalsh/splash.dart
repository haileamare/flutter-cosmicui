import 'package:flutter/material.dart';
import 'package:myfirstapp/screens/loginScreen/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState() {
  super.initState();

  Future.delayed(const Duration(seconds: 3), () {
    if (mounted) { // 👈 always check mounted
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  });
}


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image10.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Expanded(child: Center(child: Image.asset('logo/loader.png'))),

              Padding(
                padding: EdgeInsets.only(bottom: 16, top: 10),
                child: Image.asset(
                  'logo/flutter_logo.png',
                  width: width * 0.2,
                  height: width * 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
