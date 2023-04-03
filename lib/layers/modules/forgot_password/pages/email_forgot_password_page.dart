import 'package:easyflow/layers/modules/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/validators_util.dart';
import '../../../widgets/text_field_secure_widget.dart';

class EmailForgotPasswordPage extends GetView<ForgotPasswordController> {
  const EmailForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: controller.formKey1,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Esqueceu sua senha?',
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                label: Text("Digite seu email"),
                 prefixIcon: Icon(Icons.email_outlined),
                hintText: "Email",
                ),
                controller: controller.emailTextController,
                keyboardType: TextInputType.emailAddress,
               
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => Validators.combine(
                  [
                    () => Validators.isNotEmpty(value),
                    () => Validators.isEmail(value)
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.sendCode();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                child: const Text(
                  "Enviar código",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
