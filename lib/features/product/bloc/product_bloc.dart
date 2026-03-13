

import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_event.dart';
import 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState>{


 ProductBloc(): super(const ProductState()){

   on<TitleChanged>(
       (event, emit) => emit(state.copyWith(title: event.title))

   );

   on<DescriptionChanged>(
       (event, emit) => emit(state.copyWith(description: event.description))
   );

   on<PriceChanged>(
       (event, emit) => emit(state.copyWith(price: event.price))
   );

   on<IsNegotiableChanged>(
       (event, emit) => emit(state.copyWith(isNegotiable: event.isNegotiable))
   );
 }



}