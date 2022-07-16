import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Color
Color cBlackColor = Color(0xff121212);
Color cWhiteColor = Color(0xffFFFFFF);
Color cLightOrange = Color(0xffE1875E);
Color cDarkOrange = Color(0xffF25656);
Color cGreenColor = Color(0xff22B890);
Color cGreyColor = Color(0xff434343);
Color cLightGreyColor = Color(0xffC4C4C4);
Color cDarkGreyColor = Color(0xff2E2E2E);
Color cManualGreyColor = Color(0xff838A8F);

//gradient
LinearGradient secondaryGradient = LinearGradient(
  colors: [cLightOrange, cDarkOrange],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient pinkGradient = LinearGradient(
  colors: [Color(0xffED1CFF), Color(0xffFA7171)],
  end: Alignment.bottomRight,
);

LinearGradient greenGradient = LinearGradient(
  colors: [Color(0xff60E25D), Color(0xffE9EC58)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient blueGradient = LinearGradient(
  colors: [Color(0xff5DD2E2), Color(0xff589CEC)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

//Font
TextStyle WhiteFont = GoogleFonts.inter(color: cWhiteColor);
TextStyle greyFont = GoogleFonts.inter(color: cManualGreyColor);

//Font weight
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

//default radius and margin
final double defaultRadius = 16;
final double defaultMargin = 50;
final double smallLogo = 52;
