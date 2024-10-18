import 'package:flutter/material.dart';
import 'package:wishlist/features/auth/presentation/pages/login_page.dart';
import 'package:wishlist/shared/service_injector.dart';
import 'package:wishlist/shared/ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sl.init();

  runApp(const WishlistApp());
}

class WishlistApp extends StatelessWidget {
  const WishlistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: MaterialTheme.lightScheme().toColorScheme(),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
