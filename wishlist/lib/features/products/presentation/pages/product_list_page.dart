import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';
import 'package:wishlist/features/products/presentation/cubit/product_cubit.dart';
import 'package:wishlist/features/products/presentation/cubit/product_state.dart';
import 'package:wishlist/shared/ui/custom_colors.dart';
import 'package:wishlist/shared/ui/widgets/page_title_widget.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<ProductEntity> selectedItems = [];

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

    context.read<ProductCubit>().getProductsList();
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
        listener: (context, state) async {},
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
                      itemCount: state.productList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(state.productList[index].name),
                          trailing: IconButton(
                            icon: Icon(
                              selectedItems.contains(state.productList[index])
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color: CustomColors.primaryPink,
                            ),
                            onPressed: () =>
                                toggleSelection(state.productList[index]),
                          ),
                        );
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
