part of 'product_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductsLoadEvent extends ProductsEvent {
  final String url = '${MString.BASE_URL}/products/';
  final bool isInitial;
  ProductsLoadEvent({
    required this.isInitial,
  });

  @override
  List<Object> get props => [url, isInitial];
}

/// [ProductsLoadExistingProductsEvent] added, because when user searches or
/// chooses categories in CatalogScreen, and switches to HomeScreen, the
/// productsModel will appear as user searched before
/// (only searched products will appear), thats why I added
/// [ProductsLoadExistingProductsEvent], after this event will appear
/// existing model.
/* class ProductsLoadExistingProductsEvent extends ProductsEvent {
  final String url = '${MString.BASE_URL}/products/';
  final bool isInitial;
  const ProductsLoadExistingProductsEvent({
    required this.isInitial,
  });

  @override
  List<Object> get props => [url, isInitial];
} */

class ProductsSortByPriceEvent extends ProductsEvent {
  final String order;
  final bool isInitial;
  final String url;

  ProductsSortByPriceEvent({
    required this.order,
    required this.isInitial,
  }) : url = "${MString.BASE_URL}/products/?ordering=$order";

  @override
  List<Object> get props => [order, isInitial, url];
}

class ProductsFilterEvent extends ProductsEvent {
  final String url;
  final bool isInitial;
  final int categoryId;
  ProductsFilterEvent({
    required this.isInitial,
    required this.categoryId,
  }) : url = '${MString.BASE_URL}/products/?category=$categoryId';

  @override
  List<Object> get props => [url, isInitial, categoryId];
}

class ProductsSearchEvent extends ProductsEvent {
  final String url;
  final String productName;
  final bool isInitial;

  ProductsSearchEvent({
    required this.productName,
    required this.isInitial,
  }) : url = '${MString.BASE_URL}/products/?search=$productName';

  @override
  List<Object> get props => [url, productName, isInitial];
}

class ProductsLoadingEvent extends ProductsEvent {}
