import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:wishlist/features/splash/presentation/cubit/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().loginSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
      listener: (context, state) async {
        if (state is SplashLocalUserFound) {
          await Navigator.of(context).pushNamedAndRemoveUntil(
            '/home',
            (Route<dynamic> route) => false,
          );
        } else {
          await Navigator.of(context).pushNamedAndRemoveUntil(
            '/login',
            (Route<dynamic> route) => false,
          );
        }
      },
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
