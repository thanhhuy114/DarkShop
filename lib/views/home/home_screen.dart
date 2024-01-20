import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/main.dart';
import 'package:darkshop/utils/screen_size.dart';
import 'package:darkshop/views/account/account_presenter.dart';
import 'package:darkshop/views/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'home_presenter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final ScrollController _scrollController = ScrollController();
  bool _isSnackbarVisible = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   if (MyApp.isLogin == null) {
    //     if (!await AuthPresenter.isTokenAvailable()) {
    //       if (mounted && !_isSnackbarVisible) {
    //         _isSnackbarVisible = true;
    //         ScaffoldMessenger.of(context).showSnackBar(snackBar(context));
    //       }
    //     } else {
    //       await AuthPresenter.getInstance().checkAuth(
    //           successful: () {},
    //           onFailure: () {
    //             setState(() {});
    //           });
    //     }
    //   } else if (!MyApp.isLogin!) {
    //     if (mounted && !_isSnackbarVisible) {
    //       _isSnackbarVisible = true;
    //       ScaffoldMessenger.of(context).showSnackBar(snackBar(context));
    //     }
    //   }
    // });

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: _buildSearchBar(context),
        body: RefreshIndicator(
          color: Colors.red,
          onRefresh: () async {
            setState(() {});
          },
          child: ListView(
            children: [
              _buildSlider(),
              _buildProductTypeCatalog(),
              _buildCountDown(),
              _buildPromotionCatalog(),
              Container(
                  margin: const EdgeInsets.only(top: 6), height: 2, color: cl),
              _buildProductCatalog(),
            ],
          ),
        ));
  }

  AppBar _buildSearchBar(BuildContext context) {
    return AppBar(
        title: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(snackBar(context));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 240, 168, 67),
                        width: 2.5)),
                width: screenWidth * 0.8,
                height: screenHeight * 0.046,
                child: Row(children: [
                  const SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    'Laptop ThinkPad',
                    style: TextStyle(
                        color: Colors.orange, fontSize: screenWidth * 0.037),
                  )),
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 50,
                    height: screenHeight * 0.03,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 231, 190, 163),
                              Color.fromARGB(255, 234, 63, 24)
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft)),
                    child: Center(
                        child: Text('Tìm',
                            style: TextStyle(fontSize: screenWidth * 0.033))),
                  )
                ]),
              )
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer);
  }

  Padding _buildCountDown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          const Text('     DarFla⚡h Sale ',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 85, 85, 87))),
          _buildTimeCard(),
          _buildTimeCard(),
          _buildTimeCard(),
        ],
      ),
    );
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();

    //thịnh viết  phần lấy thông tin đăng nhập id = 3
    if (MyApp.idUserLogin != null) {
      AccountPresenter.getUserLogin(MyApp.idUserLogin!).then((value) {
        setState(() {});
      });
    }
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
        duration: const Duration(minutes: 5),
        action: SnackBarAction(
          textColor: const Color.fromARGB(255, 203, 66, 107),
          label: 'Đăng nhập',
          onPressed: () {
            _isSnackbarVisible = false;
            Navigator.of(context)
                .push(createRoutePushUp(screen: const LoginScreen()));
          },
        ),
      );

  Widget _buildProductCatalog() {
    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: SizedBox(
        height: 1500,
        child: MasonryGridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: screenWidth * 0.022,
          crossAxisSpacing: screenWidth * 0.022,
          itemBuilder: (context, index) {
            return _buildProduct(
                product: Product(
                    id: 1,
                    idType: 1,
                    image: null,
                    imageInfo: null,
                    name:
                        'Laptop Lenovo Thinkpad P52 Core i7-8750H, Ram 32GB, SSD 512GB, 15.6 Inch FHD, Nvidia Quadro P1000',
                    description: 'assets/logo.png',
                    price: 15000000,
                    promotion: 50,
                    repository: 1,
                    postAt: DateTime.now()));
          },
        ),
      ),
    );
  }

  InkWell _buildProduct({required Product product}) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Navigator.of(context).push(createRoutePushThrough(
            screen: Scaffold(
          appBar: AppBar(),
          body: Container(color: Colors.yellow),
        )));
      },
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(149, 157, 165, 0.2),
                offset: Offset(0, 8),
                blurRadius: 24,
                spreadRadius: 0),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(product.description.toString(),
                    fit: BoxFit.contain)),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(product.name,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
              child: Row(
                children: [
                  Text(product.price.toString(),
                      style: TextStyle(
                          fontSize: screenWidth * 0.038,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 243, 88, 77)
                            .withOpacity(0.2)),
                    child: Text('${product.promotion}%',
                        style: TextStyle(
                            fontSize: screenWidth * 0.03, color: Colors.red)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeCard({String time = '00'}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 59, 59),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        time,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 12),
      ),
    );
  }

  Widget _buildSlider() {
    int currentPos = 0;
    int itemCount = 7;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CarouselSlider.builder(
              itemCount: itemCount,
              itemBuilder: HomePresenter.generateImage,
              options: CarouselOptions(
                onPageChanged: (index, reason) =>
                    setState(() => currentPos = index),
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.96,
                aspectRatio: 1976 / 688,
              )),
        ),
        Positioned(
            bottom: screenHeight * 0.011,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  itemCount,
                  (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index != currentPos
                              ? Colors.white.withOpacity(0.5)
                              : Colors.white,
                        ),
                      )),
            ))
      ],
    );
  }

  Widget _buildProductPromotion({required Product product}) {
    return InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.of(context).push(createRoutePushThrough(
              screen: Scaffold(
            appBar: AppBar(),
            body: Container(color: Colors.yellow),
          )));
        },
        child: Ink(
          width: (screenWidth - 24) / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(149, 157, 165, 0.2),
                offset: Offset(0, 8),
                blurRadius: 24,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/home_screen/product_test.jpg',
                    height: (screenWidth - 24) / 3, fit: BoxFit.cover),
              ),
              Container(
                // margin: const EdgeInsets.symmetric(vertical: 0),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 242, 219, 218),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          '99.094.000 ₫',
                          style: TextStyle(
                              fontSize: screenWidth * 0.029,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.085,
                      alignment: Alignment.center,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(9)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/home_screen/promotion_background.png'))),
                      child: Text(
                        '-49%',
                        style: TextStyle(
                            fontSize: screenWidth * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildProductType() {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 5),
      width: (screenWidth - 20 * 6) / 5,
      color: cl,
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 2, bottom: 5, right: 2, left: 2),
          height: (screenWidth - 20 * 6) / 5 - 4,
          width: (screenWidth - 20 * 6) / 5,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 59, 181, 226),
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset('assets/home_screen/type_product/laptop.png',
              fit: BoxFit.cover),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Laptop',
            maxLines: 2,
            style: TextStyle(
                fontSize: screenWidth * 0.027,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 77, 73, 73)),
          ),
        )
      ]),
    );
  }

  double _thumbPosition = 0;

  var cl = const Color.fromARGB(255, 244, 208, 157);
  Widget _buildProductTypeCatalog() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 10),
        color: cl,
        height: screenWidth * 0.23,
        child: MasonryGridView.count(
          addAutomaticKeepAlives: false,
          controller: _scrollController,
          itemCount: 17,
          padding: const EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => _buildProductType(),
          crossAxisCount: 1,
          mainAxisSpacing: 20,
        ),
      ),
      Container(
        height: 10,
        color: cl,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildCustomScroll()]),
      )
    ]);
  }

  Widget _buildCustomScroll() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 194, 187, 187),
              borderRadius: BorderRadius.circular(2)),
          height: 2.8,
          width: 25,
        ),
        AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            left: _thumbPosition,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 211, 26, 26),
                  borderRadius: BorderRadius.circular(2)),
              height: 2.8,
              width: 8,
            ))
      ],
    );
  }

  void _scrollListener() async {
    if (_scrollController.hasClients) {
      final double maxScrollSize = _scrollController.position.maxScrollExtent;
      final double currentPosition = _scrollController.position.pixels;
      setState(() {
        _thumbPosition = (currentPosition * (25 - 8) / maxScrollSize);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildPromotionCatalog() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      // color: Colors.red,
      height: screenWidth * 0.41,
      child: MasonryGridView.count(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _buildProductPromotion(
            product: Product(
                id: 1,
                idType: 1,
                image: null,
                imageInfo: null,
                name:
                    'Laptop Lenovo Thinkpad P52 Core i7-8750H, Ram 32GB, SSD 512GB, 15.6 Inch FHD, Nvidia Quadro P1000',
                description: 'assets/logo.png',
                price: 15000000,
                promotion: 50,
                repository: 1,
                postAt: DateTime.now())),
        crossAxisCount: 1,
        mainAxisSpacing: 6,
      ),
    );
  }
}
