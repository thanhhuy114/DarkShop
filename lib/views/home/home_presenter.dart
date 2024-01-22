import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/data/models/product_type.dart';
import 'package:darkshop/data/repositories/product_repository.dart';
import 'package:darkshop/data/repositories/product_type_repository.dart';

abstract class HomeView {
  displayProductType(List<ProductTypeModel> list);
  displayProducts(List<Product> list);
  displayProductPromotion(List<Product> list);
}

class HomePresenter {
  final HomeView _view;
  HomePresenter(this._view);

  loadProductPromotion() {
    ProductRepository.getProductPromotion().then((products) => _view.displayProductPromotion(products));
  }

  loadProductType() {
    ProductTypeRepository.getAllProductType()
        .then((productTypes) => _view.displayProductType(productTypes));
  }

  loadAllProducts() {
    ProductRepository.getAllProducts()
        .then((products) => _view.displayProducts(products));
  }
}
