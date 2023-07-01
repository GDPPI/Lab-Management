import 'package:easyflow/layers/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/utils/validators_util.dart';
import '../../../widgets/text_field_secure_widget.dart';
import '../sign_up_controller.dart';

class RepeatPasswordSignUpPage extends StatelessWidget {
  const RepeatPasswordSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
         final controller = GetIt.I.get<SignUpController>();
    return Scaffold(
      appBar: AppBarWidget(value: 4, subtitle: 'Confirmar senha'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: controller.formKeyRepeatPassword,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    TextFieldSecureWidget(
                      label: "Senha novamente",
                      controller: controller.repeatPasswordTextController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      security: true,
                      validator: (value) => Validators.combine(
                        [
                          () => Validators.isNotEmpty(value),
                          () => Validators.isEqualPassword(
                              controller.passwordTextController.text, "$value")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                color: Colors.white,
                child: ElevatedButton(
                  onPressed: () => controller.repeatPassword(context),
                  child: const Text("Finalizar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
