// ignore_for_file: valid_regexps, non_constant_identifier_names

class Validators {
  static String? isNotEmpty(String? value) {
    if (value!.isEmpty || value == '') {
      return "Este campo é obrigatório!";
    }
    return null;
  }

  static String? IsName(String? value) {
    if (RegExp(r"^([A-Z][a-z].* [A-Z][a-z].*)").hasMatch(value!) == false) {
      return "Este nome é inválido!";
    }
    return null;
  }

  static String? isEmail(String? value) {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value!) ==
        false) {
      return "Este email é inválido!";
    }
    return null;
  }

  static String? isPassword(String? value) {
    List<String> erros = [];

    if (value!.length < 8) {
      erros.add("Deve ter pelo menos 8 caracteres!");
    }
    if (RegExp(r"^(?=.*[A-Z])").hasMatch(value) == false) {
      erros.add("Deve conter pelo menos uma letra maiúscula!");
    }
    if (RegExp(r"^(?=.*[a-z])").hasMatch(value) == false) {
      erros.add("Deve conter pelo menos uma letra minúscula!");
    }
    if (RegExp(r"^(?=.*?[0-9])").hasMatch(value) == false) {
      erros.add("Deve conter pelo menos um digito!");
    }
    if (RegExp(r"^(?=.*?[!@#\$&*~])").hasMatch(value) == false) {
      erros.add("Deve conter pelo menos um caractere especial!");
    }
    if (erros.isNotEmpty) {
      return erros.join("\n");
    } else {
      return null;
    }
  }

  static String? isEqualPassword(String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return "As duas senhas devem ser iguais!";
    }
    return null;
  }

  static String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}
