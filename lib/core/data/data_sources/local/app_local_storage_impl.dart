import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_local_storage.dart';

class AppLocalStorageImpl implements AppLocalStorage {
  final Completer<SharedPreferences> _instance = Completer<SharedPreferences>();

  AppLocalStorageImpl() {
    SharedPreferences.getInstance().then(_instance.complete);
  }

  @override
  Future<bool> clear() async {
    try {
      final shared = await _instance.future;
      return shared.clear();
    } on Exception catch (e) {
      debugPrint('LocalStorage error => putBool: $e');
      return false;
    }
  }

  @override
  Future<String> getData(String key) async {
    try {
      final prefs = await _instance.future;
      return prefs.getString(key) ?? '';
    } on Exception catch (e) {
      debugPrint('LocalStorage error => getString: $e');
      return 'Chave não encontrada';
    }
  }

  @override
  Future<bool> saveData(String key, String value) async {
    try {
      final prefs = await _instance.future;
      return prefs.setString(key, value);
    } on Exception catch (e) {
      debugPrint('LocalStorage error => getString: $e');
      return false;
    }
  }
}
