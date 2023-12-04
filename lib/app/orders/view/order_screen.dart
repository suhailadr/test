import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus/app/customers/view/widgets/costomer_tile.dart';
import 'package:technaureus/app/customers/view_model/customer_bloc.dart';
import 'package:technaureus/app/main_page/view/main_screen.dart';
import 'package:technaureus/app/products/view/product_screen.dart';
import 'package:technaureus/core/common/app_routes.dart';
import 'package:technaureus/core/utils/app_colors.dart';
import 'package:technaureus/core/utils/widgets/custom_app_bar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CustomerBloc>(context).add(GetAllCustomers());
    return WillPopScope(
      onWillPop: () async {
        pageNotifier.value = 0;
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: CustomAppBar(
            pop: () {
              pageNotifier.value = 0;
            },
            title: 'Choose Customer',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<CustomerBloc, CustomerState>(
                  builder: (context, state) {
                    if (state is CustomerLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is CustomerLoaded) {
                      return ListView.builder(
                          itemCount: state.customers!.length,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          itemBuilder: (context, index) {
                            return CostomerTile(
                              onTap: () {
                                AppRoute.push(ProductScreen(
                                  id: state.customers![index].id,
                                  title: state.customers![index].name,
                                ));
                              },
                              customer: state.customers![index],
                            );
                          });
                    }
                    if (state is CustomerError) {
                      return Center(
                        child: Text(state.error!),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
