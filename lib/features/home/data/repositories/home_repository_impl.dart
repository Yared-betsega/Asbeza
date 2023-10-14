import 'package:asbeza/asbeza.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource dataSource;

  HomeRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, Transaction>> spend(Transaction newTransaction) async {
    try {
      final TransactionModel transactionModel =
          await dataSource.spend(model: newTransaction);
      return Right<Failure, Transaction>(transactionModel);
    } catch (e) {
      return Left<Failure, Transaction>(ServerFailure(e.toString()));
    }
  }

  @override
  List<Object?> get props => [];

  @override
  Future<Either<Failure, UserProfile>> loadHome() async {
    try {
      final UserProfileModel userProfileModel = await dataSource.loadHome();
      return Right<Failure, UserProfileModel>(userProfileModel);
    } catch (e) {
      return Left<Failure, UserProfileModel>(ServerFailure(e.toString()));
    }
  }
}
