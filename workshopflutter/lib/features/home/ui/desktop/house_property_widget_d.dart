import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HousePropertyWidget extends StatelessWidget {
  final String value;

  const HousePropertyWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Text(
          value,
          style: GoogleFonts.notoSans(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
