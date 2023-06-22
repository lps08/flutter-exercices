import 'package:crypto_app/data/repositories/crypto_repository.dart';
import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:crypto_app/domain/usecases/get_all_crypto_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllCryptoProvider =
    Provider((ref) => GetAllCryptoUseCase(repository: CryptoRepository()));

// final cryptosNotifierProvider =
//     StateNotifierProvider<CryptosNotifier, List<CryptoEntity>>(
//   (ref) => CryptosNotifier(),
// );

// final responseCryptoProvider = FutureProvider.autoDispose((ref) async {
//   final provider = ref.watch(getAllCryptoProvider);
//   return provider(10);
// });

final cryptosProvider = StateNotifierProvider.autoDispose<CryptoAsyncNotifier,
    AsyncValue<List<CryptoEntity>>>((ref) {
  return CryptoAsyncNotifier(ref);
});

class CryptoAsyncNotifier
    extends StateNotifier<AsyncValue<List<CryptoEntity>>> {
  final AutoDisposeStateNotifierProviderRef ref;

  late final GetAllCryptoUseCase _service;

  CryptoAsyncNotifier(this.ref)
      : super(const AsyncValue.data(<CryptoEntity>[])) {
    _service = ref.watch(getAllCryptoProvider);
    getUsers();
  }

  Future<void> getUsers() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _service(10));
  }
}

// final cryptoModifierProvider = Provider.autoDispose
//     .family<List<CryptoEntity>, List<CryptoEntity>>((ref, users) {
//   final provider = ref.watch(cryptoStateChanges);
//   provider.setList(users);
//   return provider.state;
// });

// final cryptoStateChanges =
//     StateProvider.autoDispose((_) => CryptoListNotifier());

// class CryptoListNotifier extends StateNotifier<List<CryptoEntity>> {
//   CryptoListNotifier() : super([]);

//   void setList(List<CryptoEntity> list) {
//     state = list;
//   }

//   void toggle(int id) {
//     state = [
//       for (final crypto in state)
//         if (crypto.id == id)
//           crypto.copyWith(favorite: !crypto.favorite)
//         else
//           crypto
//     ];
//   }
// }
