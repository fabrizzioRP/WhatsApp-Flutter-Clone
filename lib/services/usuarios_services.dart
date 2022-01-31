import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsuarioServices {}

class User extends ChangeNotifier {
  final List<File> _image = [];
  bool _isViewedHistory = false;
  bool _isModeDark = false;

  User();

  List<File> get image => _image;

  void guardaPicture(File file) {
    _image.add(file);
    notifyListeners();
  }

  bool get isViewedHistory => _isViewedHistory;

  set isViewedHistory(bool value) {
    _isViewedHistory = value;
    notifyListeners();
  }

  bool get isModeDark => _isModeDark;

  ThemeData get currentTheme => _isModeDark
      ? ThemeData.dark().copyWith(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.tealAccent.shade700,
          ),
          scaffoldBackgroundColor: const Color(0xff16202B),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff2B3541),
          ),
        )
      : ThemeData.light().copyWith(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.green.shade600,
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.teal.shade800,
          ),
        );

  set isModeDark(bool value) {
    _isModeDark = value;
    notifyListeners();
  }
}
