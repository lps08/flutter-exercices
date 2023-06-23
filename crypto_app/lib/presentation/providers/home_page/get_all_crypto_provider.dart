import 'package:crypto_app/data/repositories/crypto_repository.dart';
import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:crypto_app/domain/usecases/get_all_crypto_usecase.dart';
import 'package:crypto_app/presentation/providers/home_page/crypto_list_provider.dart';
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
    getUsers();
  }

  Future<void> getUsers() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _service(50));
    state.whenData((value) =>
        ref.read(cryptoListNotifierProvider.notifier).setList(value));
  }
}
