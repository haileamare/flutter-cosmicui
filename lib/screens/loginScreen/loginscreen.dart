import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfirstapp/screens/homescreen/homescreen.dart';
import 'package:myfirstapp/screens/spalsh/splash.dart';
import 'package:myfirstapp/widgets/buttonwidget.dart';
import 'package:myfirstapp/widgets/formwidget.dart';
import 'package:myfirstapp/widgets/iconwidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void onPressed(){
  Navigator.push(
    context,
    MaterialPageRoute(builder:(context)=> const HomeScreen())
  );
  }
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;

    double width = screenwidth > 320 ? screenwidth * 0.8 : screenwidth * 0.7;
    double height = screenheight > 816 ? screenheight : screenheight * 0.5;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image10.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: width,
                height: height * 0.3,
                child: Image.asset('logo/logo.png'),
              ),
            ),
            Expanded(
              child: Card(
                shadowColor: Color.fromARGB(10, 0, 0, 0),
                color: Colors.black.withValues(alpha: 0.4),
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    children: [
                      FormWidget(),
                      ButtonWidget(
                        label: 'Sign in',
                        vertical: 15,
                        horizontal: 20,
                        onPressed: onPressed
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.grey, thickness: 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                'Sign in with',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Divider(color: Colors.grey, thickness: 1),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:100,right:100,bottom:20,top:20),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [
                             Iconwidget(iconpath: "icons/facebook.svg",color:Colors.blue,colorfilter: Colors.black,),
                             Iconwidget(iconpath: "icons/Logo_of_Twitter.svg", colorfilter:Colors.blue, color:Color.fromARGB(0, 240, 240, 240),),
                             Iconwidget(iconpath:"icons/google.svg"),
                          ],
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.all(16),
                        child:SizedBox(
                          child:Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style:TextStyle(color:Colors.grey)
                              ),
                              Text(
                                'Sign up',
                                style:TextStyle(color:Colors.lightBlue)
                              ),
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
