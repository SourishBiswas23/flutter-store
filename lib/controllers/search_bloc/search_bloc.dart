import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store/data/models/error_model.dart';
import 'package:store/data/models/product_model.dart';
import 'package:store/data/repository/product_data.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchStateInitial()) {
    on<SearchByCategoryEvent>((event, emit) async {
      if (event.category != state.title) {
        emit(Searching(title: event.category));
        var response = await _productData.getProductListByCategory(
          category: event.category,
        );
        if (response is List<ProductModel>) {
          if (response.isEmpty) {
            emit(
              ProductNotFoundState(title: event.category),
            );
          } else {
            emit(
              ProductCategoryListState(
                productList: response,
                title: event.category,
              ),
            );
          }
        } else if (response is ErrorModel) {
          emit(ErrorSearchState(errorMessage: response.errorMessage));
        }
      }
    });
    on<SearchByIdEvent>((event, emit) async {
      if (event.id != state.title) {
        emit(Searching(title: event.id));
        var response = await _productData.getProductById(
          id: event.id,
        );
        if (response is ProductModel) {
          emit(
            ProductById(
              product: response,
              title: event.id,
            ),
          );
        } else if (response is ErrorModel) {
          emit(ErrorSearchState(errorMessage: response.errorMessage));
        }
      }
    });
    add(const SearchByCategoryEvent(category: 'All'));
  }
  final ProductData _productData = ProductData();
}
