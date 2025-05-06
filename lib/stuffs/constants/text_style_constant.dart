import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MTextStyle {
  static const appBarTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 21.78 / 18,
    color: Color(0xFF1E1E1E),
  );

  static TextStyle ui_30Semi(Color color) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 30,
        height: 36.31 / 30,
        color: color,
      ),
    );
  }

  static TextStyle ui_16Semi(Color color) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 19.36 / 16,
        color: color,
      ),
    );
  }

  static TextStyle ui_16Medium(Color color) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 19.36 / 16,
        color: color,
      ),
    );
  }

  static TextStyle ui_12Medium(Color color) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 16 / 12,
        color: color,
      ),
    );
  }

  static TextStyle ui_16MediumHeight28(Color color) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 28 / 16,
        color: color,
      ),
    );
  }

  static TextStyle ui_20Bold(Color color) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 23.36 / 20,
        color: color,
      ),
    );
  }

  static TextStyle ui_14Regular(Color color) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 16.94 / 14,
        color: color,
      ),
    );
  }

  static TextStyle ui_14Medium(Color color) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 16.94 / 14,
        color: color,
      ),
    );
  }

  static final Medium30 = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w500, fontSize: 24, color: Color(0xFF727372)),
  );

  static final Regular14 = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xFF717372)),
  );
  static final h1_20regular = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: Color(0xFF0C0C0C),
      height: 23.44 / 16,
    ),
  );

  static final h3_14Light = GoogleFonts.roboto(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w300, fontSize: 14, color: Color(0xFF454545)),
  );

  static TextStyle h3_14Regular(Color color) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 16.41 / 14,
        color: color,
      ),
    );
  }

  static final h3_14LightLineThroughColor = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: Color(0xFFABABAB),
      decoration: TextDecoration.lineThrough,
      height: 16.41 / 14,
    ),
  );

  static TextStyle h5_16Medium(Color color) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 34.32 / 16,
        color: color,
      ),
    );
  }

  static TextStyle h4_18Medium(Color color) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: color,
      ),
    );
  }

  static TextStyle h3_14Small(Color color) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 21 / 14,
        color: color,
      ),
    );
  }

  static TextStyle h5_20Bold(Color color) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        height: 23.44 / 20,
        color: color,
      ),
    );
  }

  static TextStyle h6_24Medium(Color color) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        height: 28 / 24,
        color: color,
      ),
    );
  }

  /* static final MEDIUM = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 3.78,
      color: Color(0xFF1E1E1E),
    ),
  ); */

  /* static final REGULAR = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: SizeConfig.defaultSize * 1.4,
  );

  static final MEDIUM = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: SizeConfig.defaultSize * 1.4,
  );

  static final BOLD = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: SizeConfig.defaultSize * 1.4,
  );

  //REGULAR
  static final REGULAR_DEFAULT = REGULAR.copyWith(color: COLOR_CONST.textColor);
  static final REGULAR_DEFAULT_16 =
      REGULAR_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final REGULAR_DEFAULT_18 =
      REGULAR_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final REGULAR_DEFAULT_20 =
      REGULAR_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2);

  static final REGULAR_PRIMARY =
      REGULAR.copyWith(color: COLOR_CONST.primaryColor);
  static final REGULAR_PRIMARY_16 =
      REGULAR_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final REGULAR_PRIMARY_18 =
      REGULAR_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final REGULAR_PRIMARY_20 =
      REGULAR_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2);

  static final REGULAR_WHITE = REGULAR.copyWith(color: Colors.white);
  static final REGULAR_WHITE_16 =
      REGULAR_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final REGULAR_WHITE_18 =
      REGULAR_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final REGULAR_WHITE_20 =
      REGULAR_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2);

  //MEDIUM (SEMIBOLD)
  static final MEDIUM_DEFAULT = MEDIUM.copyWith(color: COLOR_CONST.textColor);
  static final MEDIUM_DEFAULT_16 =
      MEDIUM_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final MEDIUM_DEFAULT_18 =
      MEDIUM_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final MEDIUM_DEFAULT_20 =
      MEDIUM_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2);

  static final MEDIUM_PRIMARY =
      MEDIUM.copyWith(color: COLOR_CONST.primaryColor);
  static final MEDIUM_PRIMARY_16 =
      MEDIUM_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final MEDIUM_PRIMARY_18 =
      MEDIUM_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final MEDIUM_PRIMARY_20 =
      MEDIUM_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2);
  static final MEDIUM_PRIMARY_24 =
      MEDIUM_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.4);

  static final MEDIUM_WHITE = MEDIUM.copyWith(color: Colors.white);
  static final MEDIUM_WHITE_16 =
      MEDIUM_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final MEDIUM_WHITE_18 =
      MEDIUM_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final MEDIUM_WHITE_20 =
      MEDIUM_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2);

  //BOLD
  static final BOLD_DEFAULT = BOLD.copyWith(color: COLOR_CONST.textColor);
  static final BOLD_DEFAULT_16 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final BOLD_DEFAULT_18 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final BOLD_DEFAULT_20 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2);
  static final BOLD_DEFAULT_24 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final BOLD_DEFAULT_26 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.6);

  static final BOLD_PRIMARY = BOLD.copyWith(color: COLOR_CONST.primaryColor);
  static final BOLD_PRIMARY_16 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final BOLD_PRIMARY_18 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final BOLD_PRIMARY_20 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2);
  static final BOLD_PRIMARY_24 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final BOLD_PRIMARY_26 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.6);

  static final BOLD_WHITE = BOLD.copyWith(color: Colors.white);
  static final BOLD_WHITE_16 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final BOLD_WHITE_18 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final BOLD_WHITE_20 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2);
  static final BOLD_WHITE_26 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.6);
  static final BOLD_WHITE_32 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 3.2);

  ///Singleton factory
  static final FONT_CONST _instance = FONT_CONST._internal();

  factory FONT_CONST() {
    return _instance;
  }

  FONT_CONST._internal(); */
}
