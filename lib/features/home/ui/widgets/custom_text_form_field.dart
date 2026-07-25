
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{
  final String tilte;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const CustomTextFormField({super.key,required this.tilte,required this.validator,required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text(tilte,style:TextStyle(
            fontSize:16,
            fontWeight:FontWeight.w500,
          )),
          SizedBox(height:10),
          TextFormField(
            validator:validator,
            controller:controller,
            onTapUpOutside:(v){
             FocusScope.of(context).unfocus();
            },
            decoration:InputDecoration(
             fillColor:Colors.grey.shade200,
             filled:true,
             focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(30),
             borderSide: BorderSide.none,
             ),
             enabledBorder:OutlineInputBorder(
             borderRadius: BorderRadius.circular(30),
             borderSide: BorderSide.none,
             ),
             border:OutlineInputBorder(
             borderRadius: BorderRadius.circular(30),
             ),
            ),
          ),
      ],
    );
  }
}