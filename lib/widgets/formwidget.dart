import 'package:flutter/material.dart';
import 'package:myfirstapp/widgets/buttonwidget.dart';
import 'package:myfirstapp/widgets/textformfieldwidget.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    if (!value.contains('@')) {
      return "Enter a valid email";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    if (!value.contains('@')) {
      return "Enter a Valid email";
    }
    return null;
  }

  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Sign in',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10),
            Textformfieldwidget(
              controller: _emailController,
              label: "Email",
              validator: emailValidator,
              icon: Icons.email,
            ),
            SizedBox(height: 25),
            Textformfieldwidget(
              controller: _passwordController,
              label: "Password",
              validator: passwordValidator,
              icon: Icons.password,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
         
          // ButtonWidget(label: 'Sign in', vertical: 20, horizontal: 20),
          
          ],
        ),
      ),
    );
  }
}
