import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/registerResponse_model.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:frontend/state/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier()
    : super(AuthState(isLoading: false, error: null, loginResponse: null));

  Future<bool> login(String email, String password) async {
    log("3rd");
    state = state.copyWith(isLoading: true, error: null);
    try {
      final res = await AuthService.login(email, password);
      log("4th");
      log(res.toString());
      state = state.copyWith(isLoading: false, loginResponse: res);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  void logout() {
    state = AuthState(isLoading: false, error: null, loginResponse: null);
  }
}

class AuthRegisterNotifier extends StateNotifier<AuthRegisterState> {
  AuthRegisterNotifier()
    : super(
        AuthRegisterState(
          isLoading: false,
          error: null,
          registerResponse: null,
        ),
      );

  Future<void> register(String name, String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final res = await AuthService.register(name, password, email);
      if (res.containsKey("error")) {
        state = state.copyWith(isLoading: false, error: res["error"]);
      } else {
        state = state.copyWith(
          isLoading: false,
          registerResponse: RegisterResponseModel.fromJson(res),
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
