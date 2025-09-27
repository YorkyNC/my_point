sealed class Result<Data, Failure extends Exception> {
  factory Result.success(Data data) = SuccessResult;

  factory Result.failure(Failure failure) = FailureResult;

  bool get isSuccessful;

  bool get isFailure;

  Data? get data;

  Failure? get failure;

  void fold(void Function(Failure failure) param0,
      void Function(Data response) param1);
}

class SuccessResult<Data, Failure extends Exception> implements Result<Data, Failure> {
  const SuccessResult(this.data);

  @override
  final Data data;

  @override
  Failure? get failure => null;

  @override
  bool get isFailure => false;

  @override
  bool get isSuccessful => true;

  @override
  void fold(void Function(Failure failure) param0,
      void Function(Data response) param1) => param1(data);
}

class FailureResult<Data, Failure extends Exception> implements Result<Data, Failure> {
  const FailureResult(this.failure);

  @override
  final Failure failure;

  @override
  Data? get data => null;

  @override
  bool get isFailure => true;

  @override
  bool get isSuccessful => false;

  @override
  void fold(void Function(Failure failure) param0,
      void Function(Data response) param1) => param0(failure);
}