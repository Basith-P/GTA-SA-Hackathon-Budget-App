import 'package:appwrite/appwrite.dart';
import 'package:centsible/src/utils/constants/appwrite_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [Appwrite]

final appWriteClientProvider = Provider((_) => Client()
    .setEndpoint(AppwriteConstants.endPoint)
    .setProject(AppwriteConstants.projectId)
    .setSelfSigned());

final accountProvider =
    Provider((ref) => Account(ref.read(appWriteClientProvider)));

final databasesProvider =
    Provider((ref) => Databases(ref.read(appWriteClientProvider)));
