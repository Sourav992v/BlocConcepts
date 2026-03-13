import 'package:equatable/equatable.dart';

class ProductState extends Equatable{
  final String title;
  final String description;
  final int price;
  final bool isNegotiable;

  const ProductState({
    this.title = "",
    this.description = "",
    this.price = 0,
    this.isNegotiable = false
});

  ProductState copyWith(
  {
    String? title,
    String? description,
    int? price,
    bool? isNegotiable,
}
      ){
    return ProductState(
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      isNegotiable: isNegotiable ?? this.isNegotiable
    );
  }
  @override
  List<Object?> get props => [title, description, price, isNegotiable];

}