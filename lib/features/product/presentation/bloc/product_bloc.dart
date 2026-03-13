import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductFormState()) {

    on<TitleChanged>((event, emit) {
      final isValid = event.title.isNotEmpty && state.price > 0;

      emit(
        state.copyWith(
          title: event.title,
          status:
          isValid ? ProductStatus.valid : ProductStatus.invalid,
        ),
      );
    });

    on<DescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<PriceChanged>((event, emit) {
      final isValid =
          state.title.isNotEmpty && event.price > 0;

      emit(
        state.copyWith(
          price: event.price,
          status:
          isValid ? ProductStatus.valid : ProductStatus.invalid,
        ),
      );
    });

    on<IsNegotiableChanged>((event, emit) {
      emit(state.copyWith(isNegotiable: event.value));
    });

    on<SubmitProduct>((event, emit) async {

      // INVALID SUBMIT
      if (state.status != ProductStatus.valid) {
        emit(
          state.copyWith(
            status: ProductStatus.failure,
            errorMessage: "Invalid form",
          ),
        );
        return;
      }

      // SUBMITTING
      emit(state.copyWith(status: ProductStatus.submitting));

      await Future.delayed(Duration.zero);

      // SUCCESS
      emit(state.copyWith(status: ProductStatus.success));
    });
  }
}