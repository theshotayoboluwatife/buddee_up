import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final bool hidePassword;


  const CustomTextFormField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.remove_red_eye,
    this.hidePassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 500,
        decoration: const BoxDecoration(
         // shape:BoxShape.circle
        ),
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter appropriate data';
              } else {
                null;
              }
              return null;
            },
            controller: myController,
            decoration: InputDecoration(
                labelText: fieldName,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade300),
                ),
                labelStyle: GoogleFonts.poppins(color: Colors.black, fontSize: 15)),

          ),
        ),
      ),
    );
  }
}
