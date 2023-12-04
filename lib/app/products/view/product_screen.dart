import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus/app/main_page/view/main_screen.dart';
import 'package:technaureus/app/products/view/widgets/product_box.dart';
import 'package:technaureus/app/products/view_model/product_bloc.dart';
import 'package:technaureus/core/common/app_routes.dart';
import 'package:technaureus/core/utils/app_colors.dart';
import 'package:technaureus/core/utils/size_extenstion.dart';
import 'package:technaureus/core/utils/widgets/app_text_field.dart';
import 'package:technaureus/core/utils/widgets/custom_app_bar.dart';

class ProductScreen extends StatelessWidget {
  final String? title;
  final int? id;
  const ProductScreen({
    super.key,
    this.id,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController serchController = TextEditingController();
    BlocProvider.of<ProductBloc>(context).add(GetProducts());
    return WillPopScope(
      onWillPop: () async {
        pageNotifier.value = 0;
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            pop: () {
              AppRoute.pop();
            },
            title: title ?? 'Nesto Hypermarket',
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextField(
                hintText: 'Search',
                controller: serchController,
                isBordered: true,
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.qr_code,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 25, child: VerticalDivider()),
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Text(
                            'Fruits',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    2.respWidth
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ProductLoaded) {
                    return GridView.builder(
                      itemCount: state.products!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.2, crossAxisCount: 2),
                      itemBuilder: ((context, index) {
                        return ProductBox(
                          userId: id,
                          product: state.products![index],
                        );
                      }),
                    );
                  }
                  if (state is ProductError) {
                    return Center(
                      child: Text(state.error!),
                    );
                  }

                  return const Text('No Data');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
