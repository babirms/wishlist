import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/features/auth/presentation/cubit/logout/logout_cubit.dart';
import 'package:wishlist/features/auth/presentation/cubit/logout/logout_state.dart';
import 'package:wishlist/shared/service_injector.dart';

class LogoutDialogWidget extends StatelessWidget {
  const LogoutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(Sl.get<AuthRepository>()),
      child: BlocListener<LogoutCubit, LogoutState>(
        listener: (context, state) async {
          if (state is LogoutSuccess) {
            await Navigator.of(context).pushNamedAndRemoveUntil(
              '/login',
              (Route<dynamic> route) => false,
            );
          } else if (state is LogoutError) {
            /// Fecha o dialog
            Navigator.pop(context);

            /// Exibe snackbar de erro
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: BlocBuilder<LogoutCubit, LogoutState>(
          builder: (context, state) {
            if (state is LogoutLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return AlertDialog(
              title: const Text('Sair da conta'),
              content: const Text('Tem certeza que deseja sair da sua conta?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                TextButton(
                  onPressed: () async =>
                      await context.read<LogoutCubit>().logout(),
                  child: Text(
                    'Sair',
                    style: TextStyle(color: Colors.red[900]),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
