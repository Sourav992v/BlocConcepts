import 'package:bloc_equatable_impl/features/product/presentation/bloc/product_bloc.dart';
import 'package:bloc_equatable_impl/features/product/presentation/bloc/product_event.dart';
import 'package:bloc_equatable_impl/features/product/presentation/bloc/product_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('ProductBloc', () {

    test('initial state', () {
      expect(ProductBloc().state,
          const ProductFormState());
    });

    blocTest<ProductBloc, ProductState>(
      'valid form emits valid state',
      build: () => ProductBloc(),
      act: (bloc) {
        bloc.add(const TitleChanged("Laptop"));
        bloc.add(const PriceChanged(1000));
      },
      expect: () => [
        const ProductFormState(
          title: "Laptop",
          status: ProductStatus.invalid,
        ),
        const ProductFormState(
          title: "Laptop",
          price: 1000,
          status: ProductStatus.valid,
        ),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'invalid submit emits failure',
      build: () => ProductBloc(),
      act: (bloc) => bloc.add(const SubmitProduct()),
      expect: () => [
        const ProductFormState(
          status: ProductStatus.failure,
          errorMessage: "Invalid form",
        ),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'submit success flow',
      build: () => ProductBloc(),
      act: (bloc) async {
        bloc.add(const TitleChanged("Phone"));
        bloc.add(const PriceChanged(500));
        bloc.add(const SubmitProduct());
      },

      // ⭐ IMPORTANT FIX
      wait: const Duration(milliseconds: 10),

      expect: () => [
        const ProductFormState(
          title: "Phone",
          status: ProductStatus.invalid,
        ),
        const ProductFormState(
          title: "Phone",
          price: 500,
          status: ProductStatus.valid,
        ),
        const ProductFormState(
          title: "Phone",
          price: 500,
          status: ProductStatus.submitting,
        ),
        const ProductFormState(
          title: "Phone",
          price: 500,
          status: ProductStatus.success,
        ),
      ],
    );

  });
}