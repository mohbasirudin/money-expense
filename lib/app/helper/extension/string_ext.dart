extension StrExt on String {
  String lower() {
    try {
      return toLowerCase();
    } catch (e) {
      return this;
    }
  }
}
