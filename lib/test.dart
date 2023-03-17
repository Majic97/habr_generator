import "package:generator/annotation.dart"; // аннотации из нашего пакета
import 'dart:core';

part 'test.g.dart'; // ссылка на сгенерированный в будущем файл

@Sigma()
class TestClass {
  @PrintAnn("Hello")
  String message = "message";
}
