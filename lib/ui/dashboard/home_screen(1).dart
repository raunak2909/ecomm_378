
import 'package:ecomm_378/ui/dashboard/bloc/product_bloc.dart';
import 'package:ecomm_378/ui/dashboard/bloc/product_event.dart';
import 'package:ecomm_378/ui/dashboard/bloc/product_state.dart';
import 'package:ecomm_378/ui/dashboard/product_card.dart';
import 'package:ecomm_378/ui/dashboard/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/constants/app_routes.dart';
import 'banner_card.dart';
import 'cat.dart';
import 'navi_icon.dart';

class ShopHomePage extends StatefulWidget {
  const ShopHomePage({super.key});
  @override
  State<ShopHomePage> createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  //final CarouselSliderController _carouselCtrl = CarouselSliderController();
  int _bannerIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductFetchEvent());
  }

  final _categories = const [
    Cat(Icons.hiking, 'Shoes'),
    Cat(Icons.brush, 'Beauty'),
    Cat(Icons.woman, "Women's\nFashion"),
    Cat(Icons.diamond, 'Jewelry'),
    Cat(Icons.man, "Men's\nFashion"),
    Cat(Icons.watch, 'Watches'),
  ];

  final products = const [
    Product(
      name: 'Wireless Headphones',
      price: 120.00,
      image:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      colors: [Colors.black, Colors.orange, Colors.blue, Colors.grey],
    ),
    Product(
      name: 'Woman Sweater',
      price: 120.00,
      image:
          'https://cdn.pixabay.com/photo/2021/10/13/11/29/girl-6706267_1280.jpg',
      colors: [Colors.pink, Colors.brown, Colors.purpleAccent],
    ),
    Product(
      name: 'Running Sneakers',
      price: 95.00,
      image:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=800&auto=format&fit=crop',
      colors: [Colors.black, Colors.teal, Colors.white],
    ),
    Product(
      name: 'Casual Hoodie',
      price: 75.00,
      image:
          'https://images.unsplash.com/photo-1520975916090-3105956dac38?q=80&w=800&auto=format&fit=crop',
      colors: [Colors.grey, Colors.blueGrey, Colors.black],
    ),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primary,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.home, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              NavIcon(icon: Icons.storefront_outlined),
              NavIcon(icon: Icons.favorite_border),
              SizedBox(width: 56), // space for FAB
              NavIcon(icon: Icons.receipt_long_outlined),
              NavIcon(icon: Icons.person_outline),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
        ),
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
    ];

    return Column(
      children: [
        // Carousel
        /*ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CarouselSlider(
            carouselController: _carouselCtrl,
            items: banners,
            options: CarouselOptions(
              height: 150,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 700),
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() => _bannerIndex = index);
              },
            ),
          ),
        ),*/
       /* const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (i) => GestureDetector(
              onTap: () => _carouselCtrl.animateToPage(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                height: 6,
                width: _bannerIndex == i ? 18 : 6,
                decoration: BoxDecoration(
                  color: _bannerIndex == i ? cs.primary : Colors.black26,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ),*/
      ],
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
                    )
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
        Text(title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, height: 1.2)),
        const Spacer(),
        if (action != null)
          Text(action,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _productGrid() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if(state is ProductLoadingState){
          return const Center(child: CircularProgressIndicator());
        }

        if(state is ProductErrorState){
          return Center(child: Text(state.errorMsg));
        }

        if(state is ProductLoadedState){
          return GridView.builder(
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

                },
                child: ProductCard(product: state.allProducts[index])),
          );
        }

        return Container();
      }
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
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))
        ],
      ),
      child: Icon(icon),
    );
  }
}
