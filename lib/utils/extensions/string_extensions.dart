extension ExtensionOnString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(
        r"[a-z\d!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z\d!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z\d](?:[a-z\d-]*[a-z\d])?\.)+[a-z\d](?:[a-z\d-]*[a-z\d])?");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword => length <= 7 ? true : false;

  bool get isValidPhoneNumber {
    final phoneRegExp =
        RegExp(r"^[+]?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}$");
    return phoneRegExp.hasMatch(this);
  }

  String capitalizeFirstWord() {
    if (trim().isEmpty) {
      return '';
    }
    return split(' ')
        .map((element) =>
            "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}")
        .join(" ");
  }
}
