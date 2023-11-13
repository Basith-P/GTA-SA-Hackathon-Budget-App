class Failure extends Error {
  Failure(this.message, [this.st]);

  final String message;
  final StackTrace? st;
}
