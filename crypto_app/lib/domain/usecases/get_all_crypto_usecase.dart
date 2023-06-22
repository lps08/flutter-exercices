import 'package:crypto_app/data/models/crypto_model.dart';
import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:crypto_app/domain/mappers/cryto_model_to_entity_mapper.dart';
import 'package:crypto_app/domain/mappers/mapper.dart';
import 'package:crypto_app/domain/repository/repository.dart';

class GetAllCryptoUseCase {
  Repository<CryptoModel> repository;
  final Mapper _mapper;
  GetAllCryptoUseCase({required this.repository})
      : _mapper = CryptoModelToEntityMapper();

  Future<List<CryptoEntity>> call(int limit) async {
    List<CryptoEntity> listCryptoEntity = [];
    List<CryptoModel> listCryptoModel = await repository.getAll(limit);
    listCryptoModel
        .forEach((model) => listCryptoEntity.add(_mapper.fromModel(model)));
    return listCryptoEntity;
  }
}
