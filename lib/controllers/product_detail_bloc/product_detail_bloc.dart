import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store/data/models/product_model.dart';
import 'package:store/routes.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductState(product: event.product));
      await AppNavigator.push(route: Routes.productDetailScreen);
    });
    on<RemoveProductScreenEvent>((event, emit) async {
      await AppNavigator.pop();
    });
  }
}
