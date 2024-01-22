import 'package:connectivity/connectivity.dart';
import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/data/models/product_type.dart';
import 'package:darkshop/data/repositories/product_repository.dart';
import 'package:darkshop/utils/global_data.dart';
import 'package:darkshop/utils/screen_size.dart';
import 'package:darkshop/views/home/components/countdown.dart';
import 'package:darkshop/views/home/components/custom_scroll.dart';
import 'package:darkshop/views/home/components/product.dart';
import 'package:darkshop/views/home/components/product_promotion.dart';
import 'package:darkshop/views/home/components/product_type.dart';
import 'package:darkshop/views/home/components/search_bar.dart';
import 'package:darkshop/views/home/components/skeleton.dart';
import 'package:darkshop/views/home/components/slider_image.dart';
import 'package:darkshop/views/home/home_presenter.dart';
import 'package:darkshop/views/account/account_presenter.dart';
import 'package:darkshop/views/login/login_screen.dart';
import 'package:darkshop/views/stunning_splash_screen/auth_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin
    implements HomeView {
  late HomePresenter _presenter;
  List<ProductTypeModel> _productTypes = [];
  List<Product> products = [];
  List<Product> productPromotions = [];
  late final ScrollController _scrollProductTypeController;
  late final ScrollController _scrollProductController;
  int _itemProductVisible = 10;
  bool _isLoading = false;
  double _thumbPosition = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: const CustomSearchBar(),
        body: RefreshIndicator(
          color: Colors.red,
          onRefresh: _reLoad,
          child: ListView(
            controller: _scrollProductController,
            children: [
              const SliderImage(),
              _buildProductTypes(),
              const CountDown(),
              _buildPromotionCatalog(),
              Container(
                  margin: const EdgeInsets.only(top: 6),
                  height: 2,
                  color: const Color.fromARGB(255, 244, 208, 157)),
              _buildProducts(),
              Visibility(
                  visible: _isLoading,
                  child: Container(
                    margin: const EdgeInsets.all(7),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ))
            ],
          ),
        ));
  }

  @override
  void initState() {
    ProductRepository.getProductPromotion();
    _scrollProductTypeController = ScrollController();
    _presenter = HomePresenter(this);
    _presenter.loadProductType();
    _presenter.loadAllProducts();
    _presenter.loadProductPromotion();
    _scrollProductTypeController.addListener(_scrollProductTypeListener);
    _scrollProductController = ScrollController();
    _scrollProductController.addListener(_scrollProductListener);
    Connectivity().onConnectivityChanged.listen(connectListenner);
    _checkAuth();

    super.initState();
  }

  SnackBar snackBar(context) => SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/home_screen/sale.png', width: 20, height: 20),
            const SizedBox(width: 5),
            Expanded(
              child: Text('Có rất nhiều deal hấp dẫn đang đợi bạn',
                  style: TextStyle(fontSize: screenWidth * 0.033), maxLines: 2),
            )
          ],
        ),
        backgroundColor: Colors.black.withOpacity(0.65),
        duration: const Duration(seconds: 20),
        action: SnackBarAction(
          textColor: const Color.fromARGB(255, 203, 66, 107),
          label: 'Đăng nhập',
          onPressed: () {
            Navigator.of(context)
                .push(createRoutePushUp(screen: const LoginScreen()));
          },
        ),
      );

  Widget _buildProducts() {
    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: MasonryGridView.count(
        shrinkWrap: true,
        itemCount: _itemProductVisible,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: screenWidth * 0.022,
        crossAxisSpacing: screenWidth * 0.022,
        itemBuilder: (context, index) {
          if (products.isEmpty) {
            return const Skeleton(key: Key(''), height: 200);
          }
          return ProductWidget(product: products[index]);
        },
      ),
    );
  }

  Widget _buildProductTypes() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 10),
        color: const Color.fromARGB(255, 244, 208, 157),
        height: screenWidth * 0.23,
        child: MasonryGridView.count(
          addAutomaticKeepAlives: false,
          controller: _scrollProductTypeController,
          itemCount: _productTypes.length,
          padding: const EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ProductType(
            productType: _productTypes[index],
          ),
          crossAxisCount: 1,
          mainAxisSpacing: 20,
        ),
      ),
      Container(
        height: 10,
        color: const Color.fromARGB(255, 244, 208, 157),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomScroll(
            thumbPosition: _thumbPosition,
          )
        ]),
      )
    ]);
  }

  void _scrollProductTypeListener() async {
    if (_scrollProductTypeController.hasClients) {
      final double maxScrollSize =
          _scrollProductTypeController.position.maxScrollExtent;
      final double currentPosition =
          _scrollProductTypeController.position.pixels;
      setState(() {
        _thumbPosition = (currentPosition * (25 - 8) / maxScrollSize);
      });
    }
  }

  @override
  void dispose() {
    _scrollProductTypeController.removeListener(_scrollProductTypeListener);
    _scrollProductTypeController.dispose();
    _scrollProductController.removeListener(_scrollProductListener);
    _scrollProductController.dispose();
    super.dispose();
  }

  _scrollProductListener() {
    if (_isLoading) return;
    if (_scrollProductController.hasClients) {
      final double maxScrollSize =
          _scrollProductController.position.maxScrollExtent;
      final double currentPosition = _scrollProductController.position.pixels;

      if (maxScrollSize == currentPosition) {
        setState(() => _isLoading = true);
        Future.delayed(const Duration(seconds: 3), () async {
          setState(() {
            _isLoading = false;
            _itemProductVisible += 10;
            if (_itemProductVisible > products.length && products.isNotEmpty) {
              _itemProductVisible = products.length;
            }
          });
        });
      }
    }
  }

  Future<void> _reLoad() async {
    await _presenter.loadProductType();
    await _presenter.loadAllProducts();
    await _presenter.loadProductPromotion();
    _itemProductVisible = 10;
    _checkAuth();
    setState(() {});
  }

  _checkAuth() {
    if (!GlobalData.isToken!) {
      Future.delayed(const Duration(seconds: 4), () {
        ScaffoldMessenger.of(context).showSnackBar(snackBar(context));
      });
    } else {
      //thịnh viết  phần lấy thông tin đăng nhập id = 3
      AuthPresenter.getIdUserbyStore()
          .then((idUser) => AccountPresenter.getUserLogin(idUser!));

      AuthPresenter.getInstance().checkAuth(
          successful: () {},
          onFailure: () {
            if (GlobalData.isConneted!) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar(context));
            }
          });
    }
  }

  Widget _buildPromotionCatalog() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: screenWidth * 0.41,
      child: MasonryGridView.count(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (productPromotions.isEmpty) {
            return Skeleton(
                key: const Key(''), width: (screenWidth - 24) / 3, height: 5);
          }
          return ProductPromotion(product: productPromotions[index]);
        },
        crossAxisCount: 1,
        itemCount: productPromotions.isEmpty ? 10 : productPromotions.length,
        mainAxisSpacing: 6,
      ),
    );
  }

  @override
  displayProductType(List<ProductTypeModel> list) {
    setState(() => _productTypes = list);
  }

  @override
  displayProducts(List<Product> list) {
    setState(() {
      _itemProductVisible = 10;
      list.shuffle();
      products = list;
    });
  }

  @override
  displayProductPromotion(List<Product> list) {
    setState(() => productPromotions = list);
  }
}
