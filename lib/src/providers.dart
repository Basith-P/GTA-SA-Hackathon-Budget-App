import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/utils/constants/appwrite_constants.dart';

final appWriteClientProvider = Provider(
  (_) => Client()
      .setEndpoint(AppwriteConstants.endPoint)
      .setProject(AppwriteConstants.projectId)
      .setSelfSigned(),
);

final accountProvider = Provider(
  (ref) => Account(ref.watch(appWriteClientProvider)),
);

final databasesProvider =
    Provider((ref) => Databases(ref.read(appWriteClientProvider)));

final currentUserProvider = StateProvider<User?>((ref) => null);
