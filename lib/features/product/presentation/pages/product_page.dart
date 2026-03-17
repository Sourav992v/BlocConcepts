import 'package:bloc_equatable_impl/features/product/extensions/product_status_ext.dart';
import 'package:bloc_equatable_impl/features/product/presentation/bloc/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';


class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {

        switch (state.status) {

          case ProductStatus.success:
            ScaffoldMessenger.of(context)
                .showSnackBar(
              const SnackBar(content: Text("Saved Successfully")),
            );
            break;

          case ProductStatus.failure:
            ScaffoldMessenger.of(context)
                .showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? "Error"),
              ),
            );
            break;

          default:
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Product Form")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              TextField(
                onChanged: (v) =>
                    context.read<ProductBloc>()
                        .add(TitleChanged(v)),
                decoration:
                const InputDecoration(labelText: "Title"),
              ),

              TextField(
                onChanged: (v) =>
                    context.read<ProductBloc>()
                        .add(DescriptionChanged(v)),
                decoration:
                const InputDecoration(labelText: "Description"),
              ),

              TextField(
                keyboardType: TextInputType.number,
                onChanged: (v) =>
                    context.read<ProductBloc>()
                        .add(
                      PriceChanged(int.tryParse(v) ?? 0),
                    ),
                decoration:
                const InputDecoration(labelText: "Price"),
              ),

              BlocBuilder<ProductBloc, ProductState>(
                builder: (_, state) {
                  return SwitchListTile(
                    value: state.isNegotiable,
                    title: const Text("Negotiable"),
                    onChanged: (v) => context
                        .read<ProductBloc>()
                        .add(IsNegotiableChanged(v)),
                  );
                },
              ),

              const SizedBox(height: 20),

              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                 if(state.status.isLoading){
                   return const CircularProgressIndicator();
                 }

                 if (state.status.isSuccess){
                   return const Text("Success");
                 }

                 if(state.showError){
                   return Text(state.errorMessage ?? "Error");
                 }
                  return ElevatedButton(
                    onPressed: state.canSubmit
                        ? () => context
                        .read<ProductBloc>()
                        .add(const SubmitProduct())
                        : null,
                    child: const Text("Submit"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}