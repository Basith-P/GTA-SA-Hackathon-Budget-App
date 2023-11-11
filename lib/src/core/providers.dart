import 'package:appwrite/appwrite.dart';
import 'package:centsible/src/constants/appwrite_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [Appwrite]

final appWriteClientProvider = Provider((_) => Client()
    .setEndpoint(AppwriteConstants.endPoint)
    .setProject(AppwriteConstants.projectId)
    .setSelfSigned());
