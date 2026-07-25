
import"package:flutter/material.dart";

class CustomButton extends StatelessWidget{
 final String text;
 final void Function()? onTap;
 const CustomButton({super.key, required this.text,required this.onTap});
 @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap:onTap,
            child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(30),
              color:Colors.indigo,
            ),
            child:Text(text,style:TextStyle(
              fontSize:25,
              fontWeight:FontWeight.bold,
              color:Colors.white,
            )),
          ));
  }
}