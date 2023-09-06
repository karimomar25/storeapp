import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubits/cubit/get_products_cubit.dart';
import 'package:storeapp/screens/home_page.dart';
import 'package:storeapp/screens/update_page.dart';
import 'package:storeapp/services/get_all_products_service.dart';

void main() {
  runApp(BlocProvider(
    create: (context) {
      return GetProductsCubit(service: GetAllProductService());
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdatePage.id: (context) => UpdatePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
