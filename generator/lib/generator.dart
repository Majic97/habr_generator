import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'annotation.dart';
import 'visitor.dart';

class Test1Generator extends GeneratorForAnnotation<Sigma> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = Visitor();
    element.visitChildren(visitor);

    print(visitor.printData);

    var buffer = StringBuffer();

    buffer.writeln("extension \$${visitor.className} on ${visitor.className}{");

    visitor.printData.keys.forEach((element) {
      String data = visitor.printData[element]!;
      buffer.writeln("void print_$element(){ ");
      buffer.writeln("  print(\"Annotation $data\");");
      buffer.writeln("  }");
    });

    buffer.writeln('}');

    return buffer.toString();
  }
}
