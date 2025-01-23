import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauthtest/constants/appwrite_constants.dart';

final clientProvider = Provider((ref) {
  final client = Client()
      .setEndpoint(AppwriteConstants.endpoint)
      .setProject(AppwriteConstants.projektId);
  return client;
});

final accountProvider = Provider((ref) {
  final client = ref.watch(clientProvider);
  return Account(client);
});
