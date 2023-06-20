import 'package:crypto_app/data/models/crypto_model.dart';
import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:crypto_app/domain/mappers/cryto_model_to_entity_mapper.dart';
import 'package:crypto_app/domain/mappers/mapper.dart';
import 'package:crypto_app/domain/repository/repository.dart';

class GetCryptoFromSymbolUseCase {
  Repository<CryptoModel> repository;
  final Mapper _mapper;
  GetCryptoFromSymbolUseCase({required this.repository})
      : _mapper = CryptoModelToEntityMapper();

  Future<CryptoEntity> call(String symbol) async {
    CryptoModel cryptoModel = await repository.get(symbol);
    return _mapper.fromModel(cryptoModel);
  }
}
