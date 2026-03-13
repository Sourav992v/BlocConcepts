import 'package:bloc_equatable_impl/features/product/bloc/product_bloc.dart';
import 'package:bloc_equatable_impl/features/product/bloc/product_event.dart';
import 'package:bloc_equatable_impl/features/product/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product From"),),
      body: Padding(padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "Title",
            ),
            onChanged: (value) =>
            context.read<ProductBloc>().add(TitleChanged(value))
          ),

          TextField(
            decoration: const InputDecoration(labelText: "Description"),
            onChanged: (value) => context.read<ProductBloc>().add(DescriptionChanged(value)),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Price"),
            onChanged: (value) =>
                context.read<ProductBloc>()
                    .add(PriceChanged(int.tryParse(value) ?? 0)),
          ),

          BlocBuilder<ProductBloc, ProductState>(builder:
          (context, state) {
            return SwitchListTile(
              title: const Text("Negotiable"),
                value: state.isNegotiable, onChanged: (value) => context.read<ProductBloc>().add(IsNegotiableChanged(value)));

          }
          ),
          SizedBox(height: 20,),

          BlocBuilder<ProductBloc, ProductState>(
              builder: (_, state) =>
                  Text("State: \n$state",style: const TextStyle(fontSize:16),)
          ),

        ],
      ),),
    );
  }
}
