import 'package:frontend/models/loginResponse_model.dart';
import 'package:frontend/models/registerResponse_model.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final LoginResponse? loginResponse;

  AuthState({
    required this.isLoading,
    required this.error,
    required this.loginResponse,
  });

  AuthState copyWith({
    bool? isLoading,
    String? error,
    LoginResponse? loginResponse,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }
}

class AuthRegisterState {
  final bool isLoading;
  final String? error;
  final RegisterResponseModel? registerResponse;

  AuthRegisterState({
    required this.isLoading,
    required this.error,
    required this.registerResponse,
  });

  AuthRegisterState copyWith({
    bool? isLoading,
    String? error,
    RegisterResponseModel? registerResponse,
  }) {
    return AuthRegisterState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      registerResponse: registerResponse ?? this.registerResponse,
    );
  }
}
