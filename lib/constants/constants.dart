export 'color_constant.dart';
export 'text_style_constant.dart';
export 'image_constant.dart';
export 'icon_constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/color_constant.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppLaunch {
  static bool launch = false;
}

class Go {
  static to(context, destination,
      {bool lazy = false, Function(dynamic)? hasThen}) {
    /// hasThen implementation is like so
    /// hasThen: (value) => setState(() => results.isFavorite)
    if (lazy) {
      hasThen == null
          ? WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => destination,
                ),
              );
            })
          : WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (context) => destination,
                    ),
                  )
                  .then(hasThen);
            });
    } else if (hasThen != null) {
      Navigator.of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => destination,
            ),
          )
          .then(hasThen);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => destination,
        ),
      );
    }
  }

  static replace(context, destination, {bool lazy = false}) {
    if (lazy) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => destination,
        ),
      );
    }
  }
}

class MString {
  static const installmentEmpty =
      'Этот раздел предназначен для тех кто уже покупал товары в рассрочку';
  static String get BASE_URL => '';
  /*  static String get BASE_URL =>
      dote.env['BASE_URL'] ?? 'BASE_URl is not specified';

  static String get ONE_C_BASE_URL =>
      dotenv.env['ONE_C_BASE_URL'] ?? 'ONE_C_BASE_URl is not specified';

  static String get ONE_C_USERNAME =>
      dotenv.env['ONE_C_USERNAME'] ?? 'ONE_C_BASE_URl is not specified';

  static String get ONE_C_PASSWORD =>
      dotenv.env['ONE_C_PASSWORD'] ?? 'ONE_C_BASE_URl is not specified'; */
}

class MToast {
  showRed(message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: MColor.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  showBlack(message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: MColor.gray,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}

class MPadding {
  static const padding16 = 16.0;
}
