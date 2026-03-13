import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class TitleChanged extends ProductEvent{
  final String title;

  const TitleChanged(this.title);

  @override
  List<Object?> get props => [title];
}

class DescriptionChanged extends ProductEvent{
  final String description;

  const DescriptionChanged(this.description);

  @override
  List<Object?> get props => [description];
}

class PriceChanged extends ProductEvent{
  final int price;

  const PriceChanged(this.price);

  @override
  List<Object?> get props => [price];


}

class IsNegotiableChanged extends ProductEvent{
  final bool isNegotiable;

  const IsNegotiableChanged(this.isNegotiable);

  @override
  List<Object?> get props => [isNegotiable];
}