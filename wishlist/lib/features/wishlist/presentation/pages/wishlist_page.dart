import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:wishlist/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:wishlist/features/wishlist/presentation/widgets/empty_wishlist_widget.dart';
import 'package:wishlist/shared/ui/custom_colors.dart';
import 'package:wishlist/shared/ui/widgets/page_title_widget.dart';
import 'package:wishlist/shared/ui/widgets/warnings/error_warning_widget.dart';

class WishlistPage extends StatefulWidget {
  final Function() onAddItemPressed;
  final String userId;

  const WishlistPage(
      {super.key, required this.onAddItemPressed, required this.userId});

  @override
  State<StatefulWidget> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool showEditButton = false;

  @override
  void initState() {
    super.initState();

    context.read<WishlistCubit>().getWishlist(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<WishlistCubit, WishlistState>(
        listener: (context, state) async {
          if (state is WishlistUpdatedSuccess) {
            /// Exibe snackbar de sucesso
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Lista atualizada com sucesso!')));
          } else if (state is WishlistError) {
            /// Exibe snackbar de erro
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else if (state is WishlistLoading) {
            setState(() {
              showEditButton = true;
            });
          }
        },
        child: Padding(
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
                if (showEditButton)
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
              ]),
              BlocBuilder<WishlistCubit, WishlistState>(
                builder: (context, state) {
                  if (state is WishlistLoading || state is WishlistInitial) {
                    return const Expanded(
                        child: Center(child: CircularProgressIndicator()));
                  } else if (state is WishlistLoadedSuccess) {
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.wishlist.productList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(state.wishlist.productList[index].name),
                          );
                        },
                      ),
                    );
                  } else if (state is WishlistError) {
                    return const Expanded(
                      child: ErrorWarningWidget(),
                    );
                  }

                  return Expanded(
                    child: EmptyWishlistWidget(
                      onAddItemPressed: widget.onAddItemPressed,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
