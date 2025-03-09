import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/model/load_more/load_more.dart';
import 'package:flutter_boilerplate/model/product.dart';
import 'package:flutter_boilerplate/model/result.dart';
import 'package:flutter_boilerplate/repository/product.dart';
import 'package:flutter_boilerplate/utils/m_strings.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsLoadEvent>(_getProducts);
    on<ProductsSortByPriceEvent>(_getSortedByPriceProducts);
    on<ProductsFilterEvent>(_getFilter);
    on<ProductsSearchEvent>(_getSearchedProducts);
    on<ProductsLoadingEvent>(_loadingIndicator);
    //on<ProductsLoadExistingProductsEvent>(_loadExistingProduct);
  }
  ProductsModel products = ProductsModel(
    count: 0,
    next: null,
    previous: null,
    results: [],
  );

  /// [extraProducts] for search and categories and for orderByPrice
  ProductsModel extraProducts = ProductsModel(
    count: 0,
    next: null,
    previous: null,
    results: [],
  );

  _loadingIndicator(ProductsLoadingEvent event, emit) async {
    emit(const ProductsInitialLoading(message: 'Fetching products....'));
  }

  /* _loadExistingProduct(ProductsLoadExistingProductsEvent event, emit) async {
    emit(const ProductsInitialLoading(message: 'Fetching products....'));
    print("PRODUCT ===${products.results?.isNotEmpty}");
    if (products.results?.isNotEmpty ?? false) {
      emit(ProductsLoaded(
          productsModel: products, emptyListText: 'Hе найдено продуктов'));
      print("EXISTING Products loaded");
      return;
    }
    print("Shouldn't load");
    await _goForward(
        event.isInitial, event.url, emit, 'В каталоге отсутствует продукт');
  } */

  _getSearchedProducts(ProductsSearchEvent event, emit) async {
    await _goForwardSearchFilter(event.isInitial, event.url, emit,
        'В каталоге нет продукта с таким именем');
  }

  _getProducts(ProductsLoadEvent event, emit) async {
    await _goForward(
        event.isInitial, event.url, emit, 'В каталоге отсутствует продукт');
  }

  _getFilter(ProductsFilterEvent event, emit) async {
    await _goForwardSearchFilter(event.isInitial, event.url, emit,
        'Не имеестся продуктов в этой категории');
  }

  _getSortedByPriceProducts(ProductsSortByPriceEvent event, emit) async {
    await _goForwardSearchFilter(
        event.isInitial, event.url, emit, 'В каталоге отсутствует продукт');
  }

  _goForward(
      bool isInitialEvent, String urlEvent, emit, String emptyListText) async {
    bool isInitial = isInitialEvent;
    String url = '';
    if (isInitial) {
      products = ProductsModel(
        count: 0,
        next: null,
        previous: null,
        results: [],
      );
      url = urlEvent;
      emit(const ProductsInitialLoading(message: 'Fetching products....'));
    } else {
      url = products.next ?? '';

      emit(ProductsLoaded(
          productsModel: products,
          loading: LoadingMore(message: 'Fetching more products...')));
    }
    final response = await ProductsRepository.getProducts(url: url);

    response.fold(
      (l) => isInitial
          ? emit(const ProductsInitialError(message: 'Failed to load products'))
          : emit(ProductsLoaded(
              productsModel: products,
              error: LoadMoreError(message: 'Failed to load more products'))),
      (r) {
        if (isInitial) {
          products = ProductsModel(
            count: r.count,
            next: r.next,
            previous: r.previous,
            results: r.results,
          );
          bool isListEmpty = products.results?.isEmpty ?? true;
          if (isListEmpty) {
            emit(ProductsEmpty(emptyListText: emptyListText));
            return;
          }
        } else {
          List<Results> res = r.results ?? [];

          products = ProductsModel(
            count: r.count,
            next: r.next,
            previous: r.previous,
            results: products.results! + res,
          );
        }
        emit(ProductsLoaded(productsModel: products));
      },
    );
  }

  _goForwardSearchFilter(
      bool isInitialEvent, String urlEvent, emit, String emptyListText) async {
    bool isInitial = isInitialEvent;
    String url = '';
    if (isInitial) {
      extraProducts = ProductsModel(
        count: 0,
        next: null,
        previous: null,
        results: [],
      );
      url = urlEvent;
      emit(const ProductsInitialLoading(message: 'Fetching products....'));
    } else {
      url = extraProducts.next ?? '';

      emit(ProductsLoaded(
          productsModel: extraProducts,
          loading: LoadingMore(message: 'Fetching more products...')));
    }
    final response = await ProductsRepository.getProducts(url: url);

    response.fold(
      (l) => isInitial
          ? emit(const ProductsInitialError(message: 'Failed to load products'))
          : emit(ProductsLoaded(
              productsModel: extraProducts,
              error: LoadMoreError(message: 'Failed to load more products'))),
      (r) {
        if (isInitial) {
          extraProducts = ProductsModel(
            count: r.count,
            next: r.next,
            previous: r.previous,
            results: r.results,
          );
          bool isListEmpty = extraProducts.results?.isEmpty ?? true;
          if (isListEmpty) {
            emit(ProductsEmpty(emptyListText: emptyListText));
            return;
          }
        } else {
          List<Results> res = r.results ?? [];

          extraProducts = ProductsModel(
            count: r.count,
            next: r.next,
            previous: r.previous,
            results: extraProducts.results! + res,
          );
        }
        emit(ProductsLoaded(productsModel: extraProducts));
      },
    );
  }
}
