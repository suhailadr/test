import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:technaureus/app/customers/model/customer.dart';
import 'package:technaureus/app/customers/view_model/customer_bloc.dart';
import 'package:technaureus/app/main_page/view/main_screen.dart';
import 'package:technaureus/app/products/model/product.dart';
import 'package:technaureus/app/products/view_model/product_bloc.dart';
import 'package:technaureus/core/common/app_routes.dart';
import 'package:technaureus/core/utils/app_colors.dart';
import 'package:technaureus/core/utils/widgets/app_dialogs.dart';
import 'package:technaureus/core/utils/widgets/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CustomerAdapter());
  Hive.registerAdapter(CustomerModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductBloc()),
          BlocProvider(create: (context) => CustomerBloc())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Technoureus',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appBlue),
            useMaterial3: true,
          ),
          home: const MainScreen(),
          navigatorKey: AppRoute.navigatorKey,
          scaffoldMessengerKey: AppDialogBoxes.rootScaffoldMessengerKey,
        ),
      );
    });
  }
}
