import 'dart:async';

class AuthBloc {
  final _authController = StreamController<AuthState>.broadcast();
  Stream<AuthState> get stream => _authController.stream;

  AuthState? _currentState;
  AuthState get currentState => _currentState ?? AuthState.unauthenticated;

  // isAuthorized getter
  bool get isAuthorized => currentState == AuthState.authenticated;

  void login() {
    _currentState = AuthState.authenticated;
    _authController.sink.add(AuthState.authenticated);

    Future.delayed(const Duration(seconds: 5), () {
      logout();
    });
  }

  void logout() {
    _currentState = AuthState.unauthenticated;
    _authController.sink.add(AuthState.unauthenticated);
  }

  void dispose() {
    _currentState = null;
    _authController.close();
  }
}

enum AuthState {
  authenticated,
  unauthenticated,
}
