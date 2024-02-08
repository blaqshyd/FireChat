import 'package:fpdart/fpdart.dart';

import '../constants/app_exports.dart';

typedef FutureEither = Future<Either<Failure, String>>;
typedef FutureEitherType<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEitherType<void>;
typedef FutureVoid = Future<void>;

typedef MapString = Map<String, dynamic>;
typedef MapType<T> = Map<String, T>;
typedef ListOfString = List<String>;
typedef ListOfMapString = List<MapString>;
