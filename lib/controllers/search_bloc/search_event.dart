part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object> get props => [];
}

class SearchByCategoryEvent extends SearchEvent {
  const SearchByCategoryEvent({required this.category});
  final String category;
}

class SearchByIdEvent extends SearchEvent {
  const SearchByIdEvent({required this.id});
  final String id;
}
