class Failure {
  final String? message;
  final StackTrace? stackTrace;
  const Failure({
    this.message,
    this.stackTrace,
  });
}

class Success {
  final String? message;
  final StackTrace? stackTrace;
  const Success({
    this.message,
    this.stackTrace,
  });
}
