import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quizz_app/auth/presentation/providers/auth_provider.dart';
import 'package:quizz_app/config/routes/routes.dart';
import 'package:quizz_app/quizz/presentation/screens/all_quizzes_screen.dart';
import 'package:quizz_app/quizz/presentation/screens/create_quizz_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void didChangeDependencies() async {
    const storage = FlutterSecureStorage();
    username = await storage.read(key: 'username');
    setState(() {});
    super.didChangeDependencies();
  }

  String? username;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            CircleAvatar(
              radius: 100,
              backgroundImage: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',
              ).image,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              username ?? 'Nombre',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
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
        actions: [
          IconButton(
            onPressed: () {
              navigatePush(
                context,
                const CreateQuizzScreen(),
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: const AllQuizzesScreen(),
    );
  }
}
