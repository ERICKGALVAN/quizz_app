import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizz_app/auth/presentation/providers/auth_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          children: [
            const Spacer(),
            TextButton(
              onPressed: () {
                ref.read(authProvider.notifier).logout();
              },
              child: const Text(
                'Cerrar sesión',
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
      ),
      body: const Column(
        children: [
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
        ],
      ),
    );
  }
}
