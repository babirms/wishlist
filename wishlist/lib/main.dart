import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:wishlist/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:wishlist/features/auth/presentation/pages/login_page.dart';
import 'package:wishlist/features/auth/presentation/pages/register_page.dart';
import 'package:wishlist/features/auth/presentation/pages/reset_password_page.dart';
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
      routes: {
        '/': (context) => BlocProvider(
              create: (context) => LoginCubit(Sl.get<AuthRepository>()),
              child: const LoginPage(),
            ),
        '/register': (context) => BlocProvider(
              create: (context) => RegisterCubit(Sl.get<AuthRepository>()),
              child: const RegisterPage(),
            ),
        '/reset-password': (context) => BlocProvider(
              create: (context) => LoginCubit(Sl.get<AuthRepository>()),
              child: const ResetPasswordPage(),
            ),
      },
    );
  }
}
