import 'package:bloc_equatable_impl/features/product/bloc/product_bloc.dart';
import 'package:bloc_equatable_impl/features/product/bloc/product_event.dart';
import 'package:bloc_equatable_impl/features/product/bloc/product_state.dart';
import 'package:bloc_equatable_impl/features/product/view/product_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Product Bloc Test', (){

    blocTest<ProductBloc, ProductState>('updates title correctly',
        build: () => ProductBloc(),
      act: (bloc) => bloc.add(const TitleChanged("Laptop"),),
      expect: () => [
        const ProductState(title: 'Laptop')
      ],
    );

    blocTest<ProductBloc, ProductState>('update description successfully', build: () => ProductBloc(),
    act: (bloc) => bloc.add(DescriptionChanged('description')),
    expect: () => [
      const ProductState(description: 'description')
    ]);

    blocTest<ProductBloc, ProductState>('Price changed successfully', build: () => ProductBloc(),
    act: (bloc) => bloc.add(PriceChanged(11)),
    expect: () => [
      const ProductState(price: 11)
    ]);

  });
}