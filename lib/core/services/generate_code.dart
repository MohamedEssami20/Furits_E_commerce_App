import 'dart:math';

String generateCode() {
    var random = Random();
    int code = 1000 + random.nextInt(9000);
    return code.toString();
  }
