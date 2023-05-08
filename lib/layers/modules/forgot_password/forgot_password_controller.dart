import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final AuthRepository _repository;
  ForgotPasswordController(this._repository);

  final formKeyEmail = GlobalKey<FormState>();
  final formKeyCheckCode = GlobalKey<FormState>();
  final formKeyNewPassword = GlobalKey<FormState>();

  final emailTextController = TextEditingController();
  final codeTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();

  sendCode(context) {
    if (formKeyEmail.currentState!.validate()) {
      Navigator.of(context).pushNamed(Routes.FORGOT_PASSWORD_CODE);
    }
  }

  checkCode(context) {
    if (formKeyCheckCode.currentState!.validate()) {
      Navigator.of(context).pushNamed(Routes.FORGOT_PASSWORD_NEW_PASSWORD);
    }
  }

  forgotPassword(context) {
    if (formKeyNewPassword.currentState!.validate()) {
      Navigator.of(context).pushNamed(Routes.FORGOT_PASSWORD_SUCCESS);
    }
  }
}
