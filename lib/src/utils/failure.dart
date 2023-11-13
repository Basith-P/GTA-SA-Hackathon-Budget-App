class Failure {
  const Failure(this.message, [this.st]);

  final String message;
  final StackTrace? st;
}
