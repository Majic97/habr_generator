import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:source_gen/source_gen.dart';

import 'annotation.dart';

class Visitor extends SimpleElementVisitor<void> {
  //ключ - тип ошибки, знчение - список инстансов относящихся к ней
  String className = '';
  Map<String, String> printData = {};

  @override
  void visitConstructorElement(ConstructorElement element) {
    final elementReturnType = element.type.returnType.toString();
    className = elementReturnType.replaceFirst('*', '');
  }

  @override
  void visitFieldElement(FieldElement element) {
    var instanceName = element.name;
    var data = const TypeChecker.fromRuntime(PrintAnn)
            .annotationsOf(element)
            .first
            .getField('data')
            ?.toStringValue() ??
        '';

    printData[instanceName] = data;
  }
}
