import 'package:chitchat/utils/extensions/string_extensions.dart';

mixin ValidatorMixin {
  String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return "Please enter your email address";
    } else if (!email.trim().isValidEmail) {
      return "Please enter a valid email address.";
    }
    return null;
  }

  String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Please enter your password";
    } else if (password.trim().toString().length < 8) {
      return "Password should be at least 8 characters long";
    }
    return null;
  }

  String? confirmPasswordValidation(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Please enter your password";
    } else if (confirmPassword != password) {
      return "Both passwords do not match";
    }
    return null;
  }

  String? nameValidation(String? name) {
    if (name == null || name.isEmpty) {
      return "Please enter your first name";
    } else if (!name.isValidName) {
      return "Please enter a valid name";
    }
    return null;
  }

  String? phoneValidation(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Please enter your phone number";
    } else if (!phone.isValidPhoneNumber) {
      return "Please enter a valid phone number";
    }
    return null;
  }
}
