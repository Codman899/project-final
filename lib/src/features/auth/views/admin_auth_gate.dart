import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:vidhyatri/src/shared/constants/routes.dart';

class AdminAuthGate extends StatelessWidget {
  const AdminAuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      auth: FirebaseAuth.instance,
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          debugPrint("SignedIn");
          context.go(adminRoute);
        }),
      ],
      headerBuilder: (context, constraints, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset('assets/images/admin.jpeg'),
          ),
        );
      },
      subtitleBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: action == AuthAction.signIn
              ? const Text('Welcome to Admin App, please sign in!')
              : const Text('Welcome to Admin App, please sign up!'),
        );
      },
      footerBuilder: (context, action) {
        return const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'By signing in, you agree to our terms and conditions.',
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
      sideBuilder: (context, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset("assets/images/admin.jpeg"),
          ),
        );
      },
    );
  }
}
