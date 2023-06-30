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
        percentChange7d: entity.percentChange7d,
        percentChange30d: entity.percentChange30d,
        marketCap: entity.marketCap,
        marketCapDominance: entity.marketCapDominance,
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
      percentChange7d: model.quote!.percentChange7d!,
      percentChange30d: model.quote!.percentChange30d!,
      marketCap: model.quote!.marketCap!,
      marketCapDominance: model.quote!.marketCapDominance!,
    );
  }
}
