import 'package:crypto_app/data/models/crypto_model.dart';
import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:crypto_app/domain/mappers/mapper.dart';

class CryptoModelToEntityMapper implements Mapper<CryptoModel, CryptoEntity> {
  @override
  CryptoModel fromEntity(CryptoEntity entity) {
    return CryptoModel(
      id: entity.id,
      name: entity.name,
      symbol: entity.symbol,
      cmcRank: entity.cmcRank,
      quote: Quote(
        convert: entity.convert,
        price: entity.price,
        percentChange1h: entity.percentChange1h,
        percentChange24h: entity.percentChange24h,
      ),
    );
  }

  @override
  CryptoEntity fromModel(model) {
    return CryptoEntity(
      id: model.id!,
      name: model.name!,
      symbol: model.symbol!,
      cmcRank: model.cmcRank!,
      convert: model.quote!.convert!,
      price: model.quote!.price!,
      percentChange1h: model.quote!.percentChange1h!,
      percentChange24h: model.quote!.percentChange24h!,
    );
  }
}
