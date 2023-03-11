import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store/controllers/search_bloc/search_bloc.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final SearchBloc _searchBloc;
  CategoriesBloc({required SearchBloc searchBloc})
      : _searchBloc = searchBloc,
        super(CategoriesState(selectedCategory: 'All')) {
    on<SelectedCategoryEvent>((event, emit) {
      if (event.title != state.selectedCategory) {
        _searchBloc.add(SearchByCategoryEvent(category: event.title));
        emit(CategoriesState(selectedCategory: event.title));
      }
    });
    on<DeselectItemsEvent>((event, emit) {
      emit(CategoriesState(selectedCategory: ''));
    });
  }
}
