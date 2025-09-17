import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class S5131 extends StatelessWidget {
  const S5131({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16,
        children: [
          Text('Das ist ein Text', style: GoogleFonts.lato()),
          Text('Das ist ein Text', style: GoogleFonts.besley()),
          Text('Das ist ein Text', style: GoogleFonts.honk()),
          Text('Das ist ein Text', style: GoogleFonts.paprika()),
        ],
      ),
    );
  }
}
