import 'package:dartpad_gen_cli/dartpad_gen_cli.dart';

void main(List<String> fileNames) {
  final dartpadGenerator = DartpadGenerator(fileNames: fileNames);
  dartpadGenerator.invokeGenerator();
}
