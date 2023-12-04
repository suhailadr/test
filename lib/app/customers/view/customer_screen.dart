import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus/app/customers/view/widgets/add_costomer_form.dart';
import 'package:technaureus/app/customers/view/widgets/costomer_tile.dart';
import 'package:technaureus/app/customers/view_model/customer_bloc.dart';
import 'package:technaureus/app/main_page/view/main_screen.dart';
import 'package:technaureus/core/utils/app_colors.dart';
import 'package:technaureus/core/utils/size_extenstion.dart';
import 'package:technaureus/core/utils/widgets/app_dialogs.dart';
import 'package:technaureus/core/utils/widgets/app_text_field.dart';
import 'package:technaureus/core/utils/widgets/custom_app_bar.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

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
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            pop: () {
              pageNotifier.value = 0;
            },
            title: 'Customers',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              AppTextField(
                onChanged: (text) {
                  if (text.isEmpty) {
                    BlocProvider.of<CustomerBloc>(context)
                        .add(GetAllCustomers());
                  }
                  BlocProvider.of<CustomerBloc>(context)
                      .add(SearchCustomers(query: text));
                },
                hintText: 'Search',
                controller: TextEditingController(),
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
                    2.respWidth,
                    InkWell(
                      onTap: () {
                        AppDialogBoxes.showBottomSheet(
                            title: 'Add Customer', child: AddCustomerForm());
                      },
                      child: CircleAvatar(
                          radius: 2.h,
                          backgroundColor: AppColors.appBlue,
                          child: const Icon(
                            Icons.add,
                            color: AppColors.white,
                          )),
                    ),
                    2.respWidth
                  ],
                ),
              ),
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
