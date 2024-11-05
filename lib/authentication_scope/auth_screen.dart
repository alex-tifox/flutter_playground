import 'package:flutter/material.dart';
import 'package:flutter_playground/authentication_scope/authentication_scope.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationScope(
          child: Column(
            children: [
              Builder(builder: (context) {
                return Text(
                  'isAuthenticated: ${AuthenticationScope.of(context).isAuthorized}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AuthenticationScope.of(context).isAuthorized
                        ? Colors.green
                        : Colors.red,
                  ),
                );
              }),
              const LogInOutScreen(
                isLogin: false,
              ),
            ],
          ),
          errorBuilder: (_) => const SizedBox.shrink()),
    );
  }
}
