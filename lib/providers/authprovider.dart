import 'package:flutter/material.dart';
import 'package:weatherapp/models/auth.dart';
import 'package:weatherapp/services/authservice.dart';

class Authprovider extends ChangeNotifier {
  Auth? auth;
  Future<bool> Login({required String PassWord, required String Email}) async {
    final response = await Authservice.login(email: Email, password: PassWord);
    return response.status;
  }

  Future<bool> Regesiter({
    required String PassWord,
    required String Email,
    required String Phone,
    required String UserName,
  }) async {
    final response = await Authservice.register(
      email: Email,
      password: PassWord,
      phone: Phone,
      name: UserName,
    );
    return response.status;
  }
}
