import 'package:crypto_app/data/repositories/crypto_repository_imp.dart';
import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:crypto_app/domain/entities/preference_entity.dart';
import 'package:crypto_app/domain/usecases/get_all_crypto_usecase.dart';
import 'package:crypto_app/presentation/providers/home_page/list_preference_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllCryptoProvider =
    Provider((ref) => GetAllCryptoUseCase(repository: CryptoRepository()));

final getAllCryptoUseCaseStateNotifierProvider =
    StateNotifierProvider.autoDispose<GetAllCryptoUseCaseStateNotifierProvider,
        AsyncValue<List<CryptoEntity>>>((ref) {
  return GetAllCryptoUseCaseStateNotifierProvider(ref);
});

class GetAllCryptoUseCaseStateNotifierProvider
    extends StateNotifier<AsyncValue<List<CryptoEntity>>> {
  final AutoDisposeStateNotifierProviderRef ref;

  late final GetAllCryptoUseCase _service;

  GetAllCryptoUseCaseStateNotifierProvider(this.ref)
      : super(const AsyncValue.data(<CryptoEntity>[])) {
    _service = ref.watch(getAllCryptoProvider);
    getCryptos();
  }

  Future<void> getCryptos() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _service(200));
    state.whenData((value) =>
        ref.read(cryptoListNotifierProvider.notifier).setList(value));
  }
}

final cryptoListNotifierProvider =
    StateNotifierProvider<CryptoListNotifier, List<CryptoEntity>>(
        (ref) => CryptoListNotifier(ref));

class CryptoListNotifier extends StateNotifier<List<CryptoEntity>> {
  StateNotifierProviderRef<CryptoListNotifier, List<CryptoEntity>> ref;
  List<CryptoEntity> fullList;
  final int _rangeData2Fetch;
  int _lastIndex;

  CryptoListNotifier(this.ref)
      : fullList = [],
        _rangeData2Fetch = 10,
        _lastIndex = 0,
        super([]);

  void setList(List<CryptoEntity> list) {
    for (var crypto in list) {
      if (ref
          .read(preferenceNotifierProvider.notifier)
          .hasPreference(crypto.symbol.toUpperCase())) {
        crypto.favorite = true;
      } else {
        crypto.favorite = false;
      }
    }
    fullList = list;
    fetchData();
  }

  void fetchData() {
    _sort(fullList);
    state = [
      ...state,
      ...fullList.sublist(_lastIndex, _lastIndex + _rangeData2Fetch)
    ];
    _lastIndex = state.length;
    _sort(state);
  }

  void toggle(CryptoEntity cryptoEntity) {
    state = [
      for (final crypto in state)
        if (crypto.id == cryptoEntity.id)
          crypto.copyWith(favorite: !crypto.favorite)
        else
          crypto
    ];
    if (ref
        .read(preferenceNotifierProvider.notifier)
        .hasPreference(cryptoEntity.symbol.toUpperCase())) {
      ref
          .read(preferenceNotifierProvider.notifier)
          .removePreference(PreferenceEntity(symbol: cryptoEntity.symbol));
    } else {
      ref
          .read(preferenceNotifierProvider.notifier)
          .savePreference(PreferenceEntity(symbol: cryptoEntity.symbol));
    }
  }

  void _sort(List<CryptoEntity> list) {
    list.sort((a, b) {
      if (a.favorite && !b.favorite) {
        return -1;
      } else if (!a.favorite && b.favorite) {
        return 1;
      } else {
        return 0;
      }
    });
  }
}
