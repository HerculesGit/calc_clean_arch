abstract class UseCase<Params, Result> {
  Future<Result> call({required Params params});
}
