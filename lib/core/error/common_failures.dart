

import 'package:sup_labs_task/core/error/failure.dart';

class DefaultFailure extends Failure {
  DefaultFailure({super.message = 'Network error occurred'});
}

final class ResponseParsingFailure extends Failure {
  String? errorMessage;
  ResponseParsingFailure(
      {this.errorMessage =
          "Response received successfully..Unable to parse JSON"});

  @override
  String toString() => '$errorMessage';
}
