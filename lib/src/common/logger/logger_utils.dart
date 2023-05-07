// coverage:ignore-file
import 'package:logger/logger.dart' as logger;

abstract class Logger {
  Logger._();

  static logger.Logger log = logger.Logger(
    printer: logger.PrettyPrinter(),
  );

  static logger.Logger logNoStack = logger.Logger(
    printer: logger.PrettyPrinter(methodCount: 0),
  );
}
