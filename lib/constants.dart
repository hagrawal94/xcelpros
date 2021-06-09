import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kPrimary = Colors.cyan.shade800;

BoxDecoration background = BoxDecoration(
  gradient: LinearGradient(
      colors: [
        Colors.black,
        Colors.cyan.shade600,
      ],
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated),
);

TextStyle headingBold = GoogleFonts.ubuntu(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white);
TextStyle heading = GoogleFonts.ubuntu(fontSize: 32, color: Colors.white);
TextStyle defaultGrey = GoogleFonts.ubuntu(fontSize: 18, color: Colors.grey);
TextStyle defaultWhite = GoogleFonts.ubuntu(fontSize: 18, color: Colors.white);
TextStyle defaultBlack = GoogleFonts.ubuntu(fontSize: 18, color: Colors.black);
TextStyle defaultPrimary = GoogleFonts.ubuntu(fontSize: 18, color: kPrimary);
TextStyle defaultOrange = GoogleFonts.ubuntu(fontSize: 14, color: Colors.orange);
