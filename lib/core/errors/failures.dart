abstract class Failure {
  final String error;

  const Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);
}
