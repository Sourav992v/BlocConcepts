import 'package:bloc_equatable_impl/features/product/bloc/product_bloc.dart';
import 'package:bloc_equatable_impl/features/product/view/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create:(_) => ProductBloc(),
        child: ProductPage(),
      ),
    );
  }
}


