import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intership_assigment/models/item.dart';
import 'package:intership_assigment/repositories/items_repository.dart';


// Events
abstract class ItemsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadItems extends ItemsEvent {}

// States
abstract class ItemsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ItemsInitial extends ItemsState {}

class ItemsLoading extends ItemsState {}

class ItemsLoaded extends ItemsState {
  final List<Item> items;

  ItemsLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class ItemsError extends ItemsState {
  final String error;

  ItemsError(this.error);

  @override
  List<Object?> get props => [error];
}

// BLoC
class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final ItemsRepository itemsRepository;

  ItemsBloc({required this.itemsRepository}) : super(ItemsInitial()) {
    on<LoadItems>((event, emit) async {
      emit(ItemsLoading());
      try {
        final items = await itemsRepository.getItems();
        emit(ItemsLoaded(items));
      } catch (error) {
        emit(ItemsError(error.toString()));
      }
    });
  }
}
