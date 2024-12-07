// string_validators.dart
extension StringValidators on String {
  bool get isValidEmail {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$');
    return emailRegex.hasMatch(this);
  }

  bool isValidPassword(int minLength) {
    return length >= minLength;
  }

  bool isValidName(int minLength) {
    return length >= minLength && RegExp(r'^[a-zA-Z ]+\$').hasMatch(this);
  }

  bool get isValidPhoneNumber {
    final RegExp emailRegex = RegExp(r"^[6-9]\d{9}$");
    return emailRegex.hasMatch(this);
  }

  String get capitalizeFirst {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
