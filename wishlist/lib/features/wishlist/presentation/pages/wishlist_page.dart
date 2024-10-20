import 'package:flutter/material.dart';
import 'package:wishlist/shared/ui/custom_colors.dart';
import 'package:wishlist/shared/ui/widgets/page_title_widget.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<StatefulWidget> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const PageTitleWidget(
                title: 'Minha Lista',
                subtitle: 'Lista de desejos',
              ),
              IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: CustomColors.primaryPink,
                  ),
                  onPressed: () {
                    print('ao vivo editando a minha lista');
                  },
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: Colors.white,
                  ))
            ])
          ],
        ),
      ),
    );
  }
}
