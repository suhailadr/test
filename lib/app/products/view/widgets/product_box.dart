import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus/app/customers/view_model/customer_bloc.dart';
import 'package:technaureus/app/products/model/product.dart';
import 'package:technaureus/app/products/view_model/product_bloc.dart';
import 'package:technaureus/core/utils/app_colors.dart';
import 'package:technaureus/core/utils/app_urls.dart';
import 'package:technaureus/core/utils/size_extenstion.dart';
import 'package:technaureus/core/utils/string_extention.dart';

class ProductBox extends StatelessWidget {
  final int? userId;
  final Product product;
  const ProductBox({
    super.key,
    required this.product,
    this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade300)],
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: AppUrls.mediaBaseUrl + product.image!,
            height: 100,
            width: 100,
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 22.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name!.capitalize(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text("\$ ${product.price!.toString()}/-"),
                    ],
                  ),
                ),
                const VerticalDivider(),
                BlocBuilder<CustomerBloc, CustomerState>(
                    builder: (context, state) {
                  if (state is ProductAdded &&
                      state.products!.contains(product.id)) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                          color: AppColors.appBlue,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.remove,
                                size: 4.w,
                                color: Colors.white,
                              )),
                          3.width,
                          Text(
                            state.products!
                                .where((element) => element == product.id)
                                .length
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          2.width,
                          InkWell(
                              onTap: () {
                                BlocProvider.of<CustomerBloc>(context).add(
                                    AddProductToCart(products: [
                                  ...state.products!,
                                  product.id!
                                ]));
                              },
                              child: Icon(
                                Icons.add,
                                size: 4.w,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    );
                  } else {
                    MaterialButton(
                      onPressed: () {
                        BlocProvider.of<CustomerBloc>(context)
                            .add(AddProductToCart(products: [product.id!]));
                      },
                      color: AppColors.appBlue,
                      textColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
                      height: 1.h,
                      minWidth: 10,
                      child: const Text('Add'),
                    );
                  }
                  return MaterialButton(
                    onPressed: () {
                      BlocProvider.of<CustomerBloc>(context)
                          .add(AddProductToCart(products: [product.id!]));
                    },
                    color: AppColors.appBlue,
                    textColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    height: 1.h,
                    minWidth: 10,
                    child: const Text('Add'),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
