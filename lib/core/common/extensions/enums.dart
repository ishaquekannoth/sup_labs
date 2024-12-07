// field_type.dart
enum FieldType {
  eMail,
  password,
  name,
  phoneNumber,
}

extension FieldTypeExtension on FieldType {
  String get name {
    switch (this) {
      case FieldType.eMail:
        return "Email";
      case FieldType.password:
        return "Password";
      case FieldType.name:
        return "Name";
      case FieldType.phoneNumber:
        return "Phone Number";
      default:
        return "";
    }
  }
}
