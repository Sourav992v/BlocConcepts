import 'package:equatable/equatable.dart';

enum ProductStatus {
  initial,
  valid,
  invalid,
  submitting,
  success,
  failure,
}

sealed class ProductState extends Equatable {
  final String title;
  final String description;
  final int price;
  final bool isNegotiable;
  final ProductStatus status;
  final String? errorMessage;

  const ProductState({
    required this.title,
    required this.description,
    required this.price,
    required this.isNegotiable,
    required this.status,
    this.errorMessage,
  });

  ProductState copyWith({
    String? title,
    String? description,
    int? price,
    bool? isNegotiable,
    ProductStatus? status,
    String? errorMessage,
  });

  @override
  List<Object?> get props =>
      [title, description, price, isNegotiable, status, errorMessage];
}

class ProductFormState extends ProductState {
  const ProductFormState({
    super.title = "",
    super.description = "",
    super.price = 0,
    super.isNegotiable = false,
    super.status = ProductStatus.initial,
    super.errorMessage,
  });

  @override
  ProductFormState copyWith({
    String? title,
    String? description,
    int? price,
    bool? isNegotiable,
    ProductStatus? status,
    String? errorMessage,
  }) {
    return ProductFormState(
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      isNegotiable: isNegotiable ?? this.isNegotiable,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}