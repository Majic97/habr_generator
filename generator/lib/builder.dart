import 'package:build/build.dart';
import 'package:generator/generator.dart';

import 'package:source_gen/source_gen.dart';

Builder generateLogger(BuilderOptions options) =>
    SharedPartBuilder([Test1Generator()], 'logger_generator');
