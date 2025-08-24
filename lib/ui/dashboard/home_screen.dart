import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecomm_378/ui/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/constants/app_routes.dart';
import '../app_widgets/banner_card.dart';
import '../app_widgets/cat.dart';
import '../app_widgets/product_card.dart';
import 'bloc/product_bloc.dart';
import 'bloc/product_state.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _categories = const [
    Cat(Icons.hiking, 'Shoes'),
    Cat(Icons.brush, 'Beauty'),
    Cat(Icons.woman, "Women's\nFashion"),
    Cat(Icons.diamond, 'Jewelry'),
    Cat(Icons.man, "Men's\nFashion"),
    Cat(Icons.watch, 'Watches'),
  ];

  int _bannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topBar(),
          const SizedBox(height: 14),
          _searchBar(context),
          const SizedBox(height: 14),
          _banner(context),
          const SizedBox(height: 14),
          _categoryStrip(),
          const SizedBox(height: 10),
          _sectionHeader('Special For You', action: 'See all'),
          const SizedBox(height: 10),
          _productGrid(),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Row(
      children: [
        _roundIcon(Icons.grid_view_rounded),
        const Spacer(),
        _roundIcon(Icons.notifications_none),
      ],
    );
  }

  Widget _searchBar(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      height: 46,
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.black54),
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(width: 1, height: 20, color: Colors.black12),
          const SizedBox(width: 10),
          Icon(Icons.tune_rounded, color: cs.primary),
        ],
      ),
    );
  }

  Widget _banner(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final banners = [
      BannerCard(
        title: 'Super Sale\nDiscount',
        subtitle: 'Up to 50%',
        image:
            'https://images.unsplash.com/photo-1519741497674-611481863552?q=80&w=1200&auto=format&fit=crop',
        buttonText: 'Shop Now',
      ),
      BannerCard(
        title: 'New Arrival',
        subtitle: 'Street Sneakers',
        image:
            'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?q=80&w=1200&auto=format&fit=crop',
        buttonText: 'Explore',
      ),
      BannerCard(
        title: 'Super Sale\nDiscount',
        subtitle: 'Up to 50%',
        image:
            'https://images.unsplash.com/photo-1519741497674-611481863552?q=80&w=1200&auto=format&fit=crop',
        buttonText: 'Shop Now',
      ),
      BannerCard(
        title: 'New Arrival',
        subtitle: 'Street Sneakers',
        image:
            'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?q=80&w=1200&auto=format&fit=crop',
        buttonText: 'Explore',
      ),
      BannerCard(
        title: 'Super Sale\nDiscount',
        subtitle: 'Up to 50%',
        image:
            'https://images.unsplash.com/photo-1519741497674-611481863552?q=80&w=1200&auto=format&fit=crop',
        buttonText: 'Shop Now',
      ),
      BannerCard(
        title: 'New Arrival',
        subtitle: 'Street Sneakers',
        image:
            'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?q=80&w=1200&auto=format&fit=crop',
        buttonText: 'Explore',
      ),
    ];

    return StatefulBuilder(
      builder: (context, ss) {
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: banners.length,
              itemBuilder: (_, index, __) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: banners[index],
                  ),
                );
              },
              options: CarouselOptions(
                initialPage: _bannerIndex,
                onPageChanged: (value, _) {
                  _bannerIndex = value;
                  ss(() {});
                },
                autoPlay: true,
                viewportFraction: 1,
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.bounceOut,
                aspectRatio: 16 / 9,
                height: 200,
              ),
            ),
            SizedBox(height: 7),
            DotsIndicator(
              dotsCount: banners.length,
              position: _bannerIndex.toDouble(),
              decorator: DotsDecorator(
                activeColor: Colors.orange,
                color: Colors.black12,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                  side: BorderSide(color: Colors.black, width: 1),
                ),
                spacing: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _categoryStrip() {
    return SizedBox(
      height: 88,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, i) => const SizedBox(width: 14),
        itemBuilder: (_, index) {
          final c = _categories[index];
          return Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(c.icon, size: 28),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 70,
                child: Text(
                  c.label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, height: 1.1),
                  maxLines: 2,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _sectionHeader(String title, {String? action}) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const Spacer(),
        if (action != null)
          Text(
            action,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }

  Widget _productGrid() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductErrorState) {
          return Center(child: Text(state.errorMsg));
        }

        if (state is ProductLoadedState) {
          return GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.allProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.78,
            ),
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.productDetail,
                  arguments: state.allProducts[index]
                );
              },
              child: ProductCard(product: state.allProducts[index]),
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget _roundIcon(IconData icon) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Icon(icon),
    );
  }
}
