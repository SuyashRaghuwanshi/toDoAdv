import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/notifier/auth_notifier.dart';
import 'package:frontend/state/auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  log("2nd");
  return AuthNotifier();
});

final authRegisterProvider =
    StateNotifierProvider<AuthRegisterNotifier, AuthRegisterState>((ref) {
      return AuthRegisterNotifier();
    });
