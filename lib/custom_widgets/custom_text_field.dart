import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController myController;
  final String fieldName;

  const CustomTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(

        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: TextField(
            style: TextStyle(color: Colors.white
            ),
            controller: myController,
            decoration: InputDecoration(
              hintText: fieldName,
              hintStyle: TextStyle(color: Colors.white54),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
                labelStyle: GoogleFonts.poppins(color: Colors.white54, fontSize: 15, fontWeight: FontWeight.w500),

          ),
        ),
      ),
    )
    );
  }
}