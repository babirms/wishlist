import 'package:flutter/material.dart';
import 'package:wishlist/features/auth/presentation/widgets/logout_dialog_widget.dart';
import 'package:wishlist/shared/ui/widgets/page_title_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 36),
            const PageTitleWidget(
              title: 'Configurações',
              margin: EdgeInsets.only(top: 24),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Resetar Senha'),
              onTap: () async =>
                  await Navigator.of(context).pushNamed('/reset-password'),
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Sair da conta'),
              onTap: () async => await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const LogoutDialogWidget();
                },
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
