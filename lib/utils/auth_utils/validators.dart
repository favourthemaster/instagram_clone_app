class Validators {
  static final RegExp passwordRegex = RegExp(r'^.{8,}$');
  static final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
}
