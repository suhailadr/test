import 'package:flutter/material.dart';
import 'package:technaureus/app/cart/view/cart_screen.dart';
import 'package:technaureus/app/customers/view/customer_screen.dart';
import 'package:technaureus/app/home_page/view/home_screen.dart';
import 'package:technaureus/app/orders/view/order_screen.dart';
import 'package:technaureus/app/returns/view/customer_screen.dart';

ValueNotifier<int> pageNotifier = ValueNotifier(0);
List<Widget> pages = const [
  HomeScreen(),
  OrderScreen(),
  CartScreen(),
  ReturnScreen(),
  CustomerScreen()
];

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pageNotifier,
        builder: (context, value, _) {
          return Scaffold(
            body: pages[value],
            bottomNavigationBar: BottomNavigationBar(
                elevation: 20,
                currentIndex: value,
                onTap: (newValue) {
                  pageNotifier.value = newValue;
                },
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_chart_sharp), label: "New Order"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), label: "Cart"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.keyboard_return_outlined),
                      label: "Return"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.groups), label: "Customers"),
                ]),
          );
        });
  }
}
