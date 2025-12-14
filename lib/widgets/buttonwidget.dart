import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  const ButtonWidget({super.key,required this.label,required this.vertical,required this.horizontal});
  final String label;
  final double vertical;
  final double horizontal;
  @override 
  Widget build(BuildContext context){
    return Container(
      margin:EdgeInsets.only(left:horizontal/2,right:horizontal/2),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient:LinearGradient(
          colors:[Colors.blue,Colors.purple],
          begin:Alignment.topLeft,
          end:Alignment.bottomRight
        ),
        borderRadius:BorderRadius.circular(12)
      ),
      child:MaterialButton(
        onPressed:(){

        },
        padding:  EdgeInsets.symmetric(vertical: vertical),
        child:Text(
          label,
          style:TextStyle(color:Colors.white)
        )
      )
    );
  }
}