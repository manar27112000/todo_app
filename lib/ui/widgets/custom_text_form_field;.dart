import 'package:flutter/material.dart';

 typedef Validator=String? Function(String?);
class CustomTextFormField extends StatelessWidget {
  Widget label;
  TextInputType? type;
  bool isecureText;
  Validator? validator;
  TextEditingController? controller;
   CustomTextFormField({required this.label,required this.type,
     this.isecureText=false,  this.validator,
     controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller:controller ,
          validator:validator ,
          obscureText: isecureText,
          keyboardType: type,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            label:label,

            labelStyle: const TextStyle(fontSize: 16,color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 1,color:Colors.grey)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 1,color: Colors.red)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 1,color:Colors.white)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 1,color:Colors.grey)
            ),


          ),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
