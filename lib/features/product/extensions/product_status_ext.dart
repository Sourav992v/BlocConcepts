import 'package:bloc_equatable_impl/features/product/presentation/bloc/product_state.dart';

extension ProductStatusX on ProductStatus{

  bool get isLoading => this == ProductStatus.submitting;
  bool get isSuccess => this == ProductStatus.success;
  bool get isError => this == ProductStatus.failure;
  bool get isValidForm => this == ProductStatus.valid;

}

extension ProductSateX on ProductState {
  bool get canSubmit => status == ProductStatus.valid;
  bool get showError => status == ProductStatus.failure;
}