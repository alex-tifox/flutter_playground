import 'package:flutter/material.dart';
import 'package:flutter_playground/authentication_scope/auth_bloc.dart';

class AuthenticationScope extends StatefulWidget {
  const AuthenticationScope({
    super.key,
    required this.child,
    required this.errorBuilder,
  });

  final Widget child;
  final Widget Function(BuildContext) errorBuilder;

  @override
  State<AuthenticationScope> createState() => _AuthenticationScopeState();

  static AuthBloc of(BuildContext context) {
    final authBloc =
        context.dependOnInheritedWidgetOfExactType<_InheritedAuthBloc>();
    if (authBloc == null) {
      throw Exception('AuthBloc not found in context');
    }
    return authBloc.authBloc;
  }

  static void login(BuildContext context) {
    final authBloc = of(context);
    authBloc.login();
  }

  static void logout(BuildContext context) {
    final authBloc = of(context);
    authBloc.logout();
  }

  static bool isAuthorized(BuildContext context) {
    final authBloc = of(context);
    return authBloc.isAuthorized;
  }
}

class _AuthenticationScopeState extends State<AuthenticationScope> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc();
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedAuthBloc(
      authBloc: _authBloc,
      child: StreamBuilder<AuthState>(
        stream: _authBloc.stream,
        initialData: _authBloc.currentState,
        builder: (_, snapshot) {
          if (snapshot.hasData && snapshot.data == AuthState.authenticated) {
            return widget.child;
          }

          return const LogInOutScreen(isLogin: true);
        },
      ),
    );
  }
}

class _InheritedAuthBloc extends InheritedWidget {
  const _InheritedAuthBloc({required this.authBloc, required super.child});

  final AuthBloc authBloc;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

class LogInOutScreen extends StatelessWidget {
  const LogInOutScreen({required this.isLogin, super.key});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => isLogin
              ? AuthenticationScope.login(context)
              : AuthenticationScope.logout(context),
          child: isLogin ? const Text('Login') : const Text('Logout'),
        ),
      ],
    );
  }
}
