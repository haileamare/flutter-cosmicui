import 'package:flutter/material.dart';

class _Textformfieldstate extends State<Textformfieldwidget>{

Widget build(BuildContext context){
  return TextFormField(
   controller: widget.controller,
   validator: widget.validator,
   decoration: InputDecoration(
    label:Text(widget.label),
    icon: Icon(widget.icon,color: Color.fromRGBO(6, 217, 245, 0.494),),
      enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: const BorderSide(color: Colors.grey, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: const BorderSide(color: Colors.blue, width: 2),
    ),
    
   ),
  );
}
}
class Textformfieldwidget extends StatefulWidget{
final TextEditingController controller;
final IconData icon;
final String label;
final String? Function(String?)? validator;
const Textformfieldwidget({super.key,required this.controller,required this.label,required this.validator,required this.icon});
State<Textformfieldwidget> createState()=>_Textformfieldstate();
}