import 'package:bloc_equatable_impl/core/mixins/validation_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> with ValidationMixin{
  ProductBloc() : super(const ProductFormState()) {

    on<TitleChanged>((event, emit) {
      final isValid = isValidTitle(event.title) && isValidPrice(state.price);

      emit(
        state.copyWith(
          title: event.title,
          status:
          isValid ? ProductStatus.valid : ProductStatus.invalid,
        ),
      );
    });

    on<DescriptionChanged>((event, emit) {

      final isValid = isValidDescription(event.description);
      emit(state.copyWith(description: isValid ? event.description : ""));
    });

    on<PriceChanged>((event, emit) {
      final isValid =
          isValidTitle(state.title) && isValidPrice(event.price);

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