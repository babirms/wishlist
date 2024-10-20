import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';
import 'package:wishlist/features/wishlist/data/entities/wishlist_entity.dart';
import 'package:wishlist/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:wishlist/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:wishlist/features/wishlist/presentation/widgets/empty_wishlist_widget.dart';
import 'package:wishlist/features/wishlist/presentation/widgets/wishlist_item_widget.dart';
import 'package:wishlist/shared/ui/custom_colors.dart';
import 'package:wishlist/shared/ui/widgets/texts/page_title_widget.dart';
import 'package:wishlist/shared/ui/widgets/warnings/error_warning_widget.dart';
import 'package:wishlist/shared/utils/toggle_selection.dart';

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
  bool isEditingList = false;

  final List<ProductEntity> selectedItems = [];

  late WishlistEntity currentWishlist;

  @override
  void initState() {
    super.initState();

    context.read<WishlistCubit>().getWishlist(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selectedItems.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                /// Atualiza a wishlist no Firestore
                context.read<WishlistCubit>().removeProductsFrom(
                    wishlist: currentWishlist,
                    updatedProductList: selectedItems);
              },
              label:
                  Text('Remover da lista de desejos (${selectedItems.length})'),
              icon: const Icon(Icons.delete_outline_rounded),
              backgroundColor: CustomColors.primaryPink02,
            )
          : null,
      body: BlocListener<WishlistCubit, WishlistState>(
        listener: (context, state) async {
          if (state is WishlistUpdatedSuccess) {
            /// Atualiza a atual wishilist
            setState(() {
              currentWishlist = state.wishlist;
              selectedItems.clear();
              if (currentWishlist.productList.isNotEmpty) {
                showEditButton = true;
                isEditingList = false;
              }
            });

            /// Exibe snackbar de sucesso
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Lista atualizada com sucesso!')));
          } else if (state is WishlistError) {
            /// Exibe snackbar de erro
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else if (state is WishlistLoadedSuccess) {
            setState(() {
              currentWishlist = state.wishlist;
              if (currentWishlist.productList.isNotEmpty) {
                showEditButton = true;
              }
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
                          elevation: 4,
                          shadowColor: Colors.black87),
                      onPressed: () => setState(() {
                            isEditingList = !isEditingList;

                            if (!isEditingList) {
                              selectedItems.clear();
                            }
                          }),
                      icon: Icon(
                        isEditingList ? Icons.close : Icons.edit_outlined,
                        color: Colors.white,
                        size: 32,
                      ))
              ]),
              if (isEditingList)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                      'Você está no modo de edição da lista. Selecione os itens que deseja remover abaixo:'),
                ),
              BlocBuilder<WishlistCubit, WishlistState>(
                builder: (context, state) {
                  if (state is WishlistLoading || state is WishlistInitial) {
                    return const Expanded(
                        child: Center(child: CircularProgressIndicator()));
                  } else if (state is WishlistLoadedSuccess ||
                      state is WishlistUpdatedSuccess) {
                    if (currentWishlist.productList.isEmpty) {
                      return Expanded(
                        child: EmptyWishlistWidget(
                          onAddItemPressed: widget.onAddItemPressed,
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: currentWishlist.productList.length,
                          itemBuilder: (context, index) {
                            return WishlistItemWidget(
                              isSelected: selectedItems.contains(
                                currentWishlist.productList[index],
                              ),
                              title: currentWishlist.productList[index].name,
                              onRemovePressed: isEditingList
                                  ? () => setState(() {
                                        toggleSelection(
                                            selectedItems: selectedItems,
                                            item: currentWishlist
                                                .productList[index]);
                                      })
                                  : null,
                            );
                          },
                        ),
                      );
                    }
                  }
                  return const Expanded(
                    child: ErrorWarningWidget(),
                  );
                },
              ),
              if (selectedItems.isNotEmpty) const SizedBox(height: 70)
            ],
          ),
        ),
      ),
    );
  }
}
