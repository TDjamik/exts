extension on String {
  String get encoded {
    final output = StringBuffer();
    for (final codePoint in runes) {
      output.writeCharCode(codePoint + 1);
    }
    return output.toString();
  }
}
// void main() {
//   final secret = 'abc'.encoded;
//   print(secret);
// }