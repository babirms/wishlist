import 'package:flutter/material.dart';
import 'package:wishlist/features/auth/data/entities/user_entity.dart';
import 'package:wishlist/features/products/presentation/pages/product_list_page.dart';
import 'package:wishlist/features/settings/presentation/pages/settings_page.dart';
import 'package:wishlist/features/wishlist/presentation/pages/wishlist_page.dart';

class HomePage extends StatefulWidget {
  final UserEntity user;

  const HomePage({super.key, required this.user});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

          /// Caso selecione o item "Produtos"
          _currentIndex == 0
              ? ProductListPage(userId: widget.user.id)

              /// Caso selecione o item "Minha lista"
              : _currentIndex == 1
                  ? WishlistPage(
                      onAddItemPressed: () => setState(() {
                        _currentIndex = 0;
                      }),
                      userId: widget.user.id,
                    )

                  /// Caso selecione o item "Configurações"
                  : const SettingsPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            label: 'Minha lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
