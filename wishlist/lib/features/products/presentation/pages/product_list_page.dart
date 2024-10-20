import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';
import 'package:wishlist/features/products/presentation/cubit/product_cubit.dart';
import 'package:wishlist/features/products/presentation/cubit/product_state.dart';
import 'package:wishlist/features/products/presentation/widgets/product_list_item_widget.dart';
import 'package:wishlist/features/products/presentation/widgets/product_on_wishlist_widget.dart';
import 'package:wishlist/shared/ui/widgets/page_title_widget.dart';

class ProductListPage extends StatefulWidget {
  final String userId;

  const ProductListPage({super.key, required this.userId});

  @override
  State<StatefulWidget> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<ProductEntity> selectedItems = [];

  List<ProductEntity> allProducts = [];
  List<ProductEntity> currentWishlistProducts = [];

  void toggleSelection(ProductEntity item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    context.read<ProductCubit>().getProductsList(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: selectedItems.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
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
            )
          : null,
      body: BlocListener<ProductCubit, ProductState>(
        listener: (context, state) async {
          if (state is ProductSuccess) {
            setState(() {
              allProducts = state.allProductList;
              currentWishlistProducts = state.userWishlistProductsList;
            });
          }
        },
        child:
            BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductSuccess) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 36),
                  const PageTitleWidget(
                    title: 'Bem-vindo',
                    subtitle: 'Produtos disponíveis',
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: allProducts.length,
                      itemBuilder: (context, index) {
                        if (currentWishlistProducts
                            .contains(allProducts[index])) {
                          return ProductOnWishlistWidget(
                            title: allProducts[index].name,
                          );
                        } else {
                          return ProductListItemWidget(
                            title: allProducts[index].name,
                            isSelected:
                                selectedItems.contains(allProducts[index]),
                            onPressed: () =>
                                toggleSelection(allProducts[index]),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return Container();
        }),
      ),
    );
  }
}
