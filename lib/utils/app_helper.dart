class AppHelper {
  static bool isNullOrEmptyString(text) {
    if (text == null || text.isEmpty) {
      return true;
    }
    return false;
  }
}
