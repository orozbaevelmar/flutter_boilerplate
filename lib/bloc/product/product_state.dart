part of 'product_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsInitialLoading extends ProductsState {
  final String message;
  const ProductsInitialLoading({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductsInitialError extends ProductsState {
  final String message;
  const ProductsInitialError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductsEmpty extends ProductsState {
  final String emptyListText;
  const ProductsEmpty({required this.emptyListText});

  @override
  List<Object> get props => [emptyListText];
}

class ProductsLoaded extends ProductsState {
  final ProductsModel productsModel;
  final LoadingMore? loading;
  final LoadMoreError? error;
  const ProductsLoaded({
    required this.productsModel,
    this.loading,
    this.error,
  });

  @override
  List<Object?> get props => [productsModel, loading, error];
}
