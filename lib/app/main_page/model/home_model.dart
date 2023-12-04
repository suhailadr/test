import 'package:flutter/material.dart';
import 'package:technaureus/app/main_page/view/main_screen.dart';
import 'package:technaureus/app/products/view/product_screen.dart';
import 'package:technaureus/core/common/app_routes.dart';
import 'package:technaureus/core/utils/widgets/app_dialogs.dart';

class HomeModel {
  IconData? icon;
  String? label;
  final Function()? onTap;
  HomeModel({this.icon, this.label, this.onTap});
}

List<HomeModel> homeItems = [
  HomeModel(
    icon: Icons.groups,
    label: 'Customers',
    onTap: () {
      pageNotifier.value = 4;
    },
  ),
  HomeModel(
      icon: Icons.card_giftcard,
      label: 'Products',
      onTap: () => AppRoute.push(const ProductScreen())),
  HomeModel(
    icon: Icons.add_chart,
    label: 'New Order',
    onTap: () {
      pageNotifier.value = 1;
    },
  ),
  HomeModel(
    icon: Icons.keyboard_return,
    label: 'Return Order',
    onTap: () {
      pageNotifier.value = 3;
    },
  ),
  HomeModel(
    icon: Icons.payment,
    label: 'Add Payment',
    onTap: () {
      AppDialogBoxes.showErrorBox('No Action Implemented', title: "No Action");
    },
  ),
  HomeModel(
    icon: Icons.receipt,
    label: "Today's Order",
    onTap: () {
      AppDialogBoxes.showErrorBox('No Action Implemented', title: "No Action");
    },
  ),
  HomeModel(
    icon: Icons.receipt_long,
    label: "Today's Summary",
    onTap: () {
      AppDialogBoxes.showErrorBox('No Action Implemented', title: "No Action");
    },
  ),
  HomeModel(
    icon: Icons.route,
    label: 'Routes',
    onTap: () {
      AppDialogBoxes.showErrorBox('No Action Implemented', title: "No Action");
    },
  ),
];
