import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/repos/product_repo_impl.dart';
import 'package:fruits_hub/core/repos/product_repos.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../repos/orders_repo/orders_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(
    FirebaseAuthService(),
  );
  getIt.registerSingleton<DataBaseService>(
    FirestoreService(),
  );
  getIt.registerSingleton<ProductRepos>(
    ProductRepoImpl(
      dataBaseService: getIt.get<DataBaseService>(),
    ),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
      dataBaseService: getIt.get<DataBaseService>(),
    ),
  );

  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(
      dataBaseService: getIt.get<DataBaseService>(),
    ),
  );
}
