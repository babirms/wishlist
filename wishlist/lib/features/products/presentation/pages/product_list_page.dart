import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';
import 'package:wishlist/features/products/presentation/cubit/product_cubit.dart';
import 'package:wishlist/features/products/presentation/cubit/product_state.dart';
import 'package:wishlist/features/products/presentation/widgets/product_list_item_widget.dart';
import 'package:wishlist/features/products/presentation/widgets/product_on_wishlist_widget.dart';
import 'package:wishlist/features/wishlist/data/entities/wishlist_entity.dart';
import 'package:wishlist/shared/ui/custom_colors.dart';
import 'package:wishlist/shared/ui/widgets/texts/page_title_widget.dart';
import 'package:wishlist/shared/ui/widgets/warnings/error_warning_widget.dart';
import 'package:wishlist/shared/utils/toggle_selection.dart';

class ProductListPage extends StatefulWidget {
  final String userId;

  const ProductListPage({super.key, required this.userId});

  @override
  State<StatefulWidget> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<ProductEntity> selectedItems = [];

  List<ProductEntity> allProducts = [];
  late WishlistEntity currentWishlist;

  @override
  void initState() {
    super.initState();

    context.read<ProductCubit>().getProductsList(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selectedItems.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                /// Adiciona os itens selecionados a [currentWishlist]
                currentWishlist.productList.addAll(selectedItems);

                /// Atualiza a wishlist no Firestore
                context
                    .read<ProductCubit>()
                    .addProductToWishlist(wishlist: currentWishlist);

                /// Exibe mensagem de sucesso
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Itens adicionados na lista de desejos com sucesso!'),
                  ),
                );
                setState(() {
                  selectedItems.clear();
                });
              },
              label: Text(
                  'Adicionar a lista de desejos (${selectedItems.length})'),
              icon: const Icon(Icons.check),
              backgroundColor: CustomColors.primaryPink02,
            )
          : null,
      body: BlocListener<ProductCubit, ProductState>(
        listener: (context, state) async {
          if (state is ProductSuccess) {
            setState(() {
              allProducts = state.allProductList;
              currentWishlist = state.userWishlist;
            });
          } else if (state is UpdatedWishlistProductsSuccess) {
            setState(() {
              currentWishlist = state.userWishlist;
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 36),
              const PageTitleWidget(
                title: 'Bem-vindo',
                subtitle: 'Produtos disponíveis',
              ),
              BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                if (state is ProductLoading) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                } else if (state is ProductSuccess ||
                    state is UpdatedWishlistProductsSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: allProducts.length,
                      itemBuilder: (context, index) {
                        if (currentWishlist.productList.any((product) =>
                            product.id.contains(allProducts[index].id))) {
                          return ProductOnWishlistWidget(
                            title: allProducts[index].name,
                          );
                        } else {
                          return ProductListItemWidget(
                            title: allProducts[index].name,
                            isSelected:
                                selectedItems.contains(allProducts[index]),
                            onPressed: () => setState(() {
                              toggleSelection(
                                  selectedItems: selectedItems,
                                  item: allProducts[index]);
                            }),
                          );
                        }
                      },
                    ),
                  );
                } else if (state is ProductInitial) {
                  return Container();
                }
                return const Expanded(
                    child: Center(
                  child: ErrorWarningWidget(
                    margin: EdgeInsets.zero,
                  ),
                ));
              }),
              if (selectedItems.isNotEmpty) const SizedBox(height: 70)
            ],
          ),
        ),
      ),
    );
  }
}
