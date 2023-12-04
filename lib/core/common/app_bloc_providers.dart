import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static Future<Widget> providers() async {
    // add the providee to the specific folder
    return MultiBlocProvider(
      providers: const [
        //  BlocProvider(create: (ctx) => AddressBloc()),
      ],
      child: const SizedBox(),
    );
  }
}
