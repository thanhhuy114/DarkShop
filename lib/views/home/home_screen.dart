import 'package:darkshop/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndexPanner = 0;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: RefreshIndicator(
        color: Colors.red,
        onRefresh: () async {},
        child: ListView(
          children: [
            _buildBaner(),
            _buildProductTypeCatalog(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                children: [
                  const Text('   DarFla⚡h Sale ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  _buildTimeCard(),
                  _buildTimeCard(),
                  _buildTimeCard(),
                ],
              ),
            ),
            _buildPromotionCatalog(),
            const SizedBox(height: 13),
            _buildProductCatalog(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(currentIndex: 1, onTap: (_) {}),
    );
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  SizedBox _buildProductCatalog() {
    return SizedBox(
      height: 1500,
      child: MasonryGridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: screenWidth * 0.022,
        crossAxisSpacing: screenWidth * 0.022,
        itemBuilder: (context, index) {
          return _buildProduct();
        },
      ),
    );
  }

  InkWell _buildProduct() {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
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
                child: Image.asset('assets/logo.png', fit: BoxFit.contain)),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                  'Laptop Lenovo Thinkpad P52 Core i7-8750H, Ram 32GB, SSD 512GB, 15.6 Inch FHD, Nvidia Quadro P1000',
                  maxLines: 2,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
              child: Row(
                children: [
                  Text('15.000.000 ₫',
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
                    child: Text('-50%',
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

  Widget _buildBaner() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CarouselSlider.builder(
              itemCount: 7,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                              'assets/home_screen/spn_${itemIndex + 1}.png',
                              fit: BoxFit.cover),
                        ),
                      ),
              options: CarouselOptions(
                onPageChanged: (index, reason) => setState(() {
                  currentIndexPanner = index;
                }),
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.96,
                aspectRatio: 1976 / 688,
              )),
        ),
        Positioned(
            bottom: screenHeight * 0.022,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  7,
                  (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index != currentIndexPanner
                              ? Colors.white.withOpacity(0.5)
                              : Colors.white,
                        ),
                      )),
            ))
      ],
    );
  }

  Widget _buildProductPromotion() {
    return InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
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
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 2, bottom: 5, right: 2, left: 2),
          height: (screenWidth - 20 * 6) / 5 - 4,
          width: (screenWidth - 20 * 6) / 5,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 158, 158),
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
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 54, 53, 53)),
          ),
        )
      ]),
    );
  }

  double _thumbPosition = 0;

  Widget _buildProductTypeCatalog() {
    return Column(children: [
      SizedBox(
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
      _buildScrollCustom(),
    ]);
  }

  Widget _buildScrollCustom() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 185, 178, 178),
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

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final double maxScrollSize = _scrollController.position.maxScrollExtent;
      final double currentPosition = _scrollController.position.pixels;
      // _thumbPosition  =
      // print(_scrollController.position.pixels);

      // final scrollPosition =
      //     ((_strokeHeight - _thumbHeight) / (maxScrollSize / currentPosition));

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
        itemBuilder: (context, index) => _buildProductPromotion(),
        crossAxisCount: 1,
        mainAxisSpacing: 6,
      ),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomAppBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              onTap(0);
            },
            color: currentIndex == 0 ? Colors.blue : Colors.black,
          ),
          IconButton(
            icon: const Icon(Icons.add_box),
            onPressed: () {
              onTap(1);
            },
            color: currentIndex == 1 ? Colors.blue : Colors.black,
          ),
          IconButton(
            icon: const Icon(Icons.card_travel),
            onPressed: () {
              onTap(2);
            },
            color: currentIndex == 2 ? Colors.blue : Colors.black,
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              onTap(3);
            },
            color: currentIndex == 3 ? Colors.blue : Colors.black,
          ),
        ],
      ),
    );
  }
}
