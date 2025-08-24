import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product_detail/bloc/cart_bloc.dart';
import '../product_detail/bloc/cart_event.dart';
import '../product_detail/bloc/cart_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(FetchCartItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        return Container();
      }),
    );
  }
}
