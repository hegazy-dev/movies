import '../data_sources/auth_remote_data_source.dart';

abstract class AuthRepository {
  Future<void> sendPasswordResetEmail(String email);

}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<void> sendPasswordResetEmail(String email) {
  
    return _remoteDataSource.sendPasswordResetEmail(email);
  }
}
