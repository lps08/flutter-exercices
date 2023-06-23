import 'package:crypto_app/data/models/crypto_model.dart';
import 'package:crypto_app/domain/repository/crypto_repository.dart';

import '../datasources/remote/crypto_remote_datasource.dart';

class CryptoRepository extends Repository<CryptoModel> {
  CryptoRepository({super.remoteDatasource = const CryptoRemoteDataSources()});
}
