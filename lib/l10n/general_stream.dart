import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en')) {
    loadLocale();
  }

  Future<void> loadLocale() async {
    final sp = await SharedPreferences.getInstance();
    final code = sp.getString('language_code') ?? 'en';

    emit(Locale(code));
  }

  Future<void> changeLocale(String code) async {
    final sp = await SharedPreferences.getInstance();

    await sp.setString('language_code', code);

    emit(Locale(code));
  }
}
