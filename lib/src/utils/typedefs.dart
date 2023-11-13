import 'package:fpdart/fpdart.dart';
import 'package:mymny/src/utils/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
