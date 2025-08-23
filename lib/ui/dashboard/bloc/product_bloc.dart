import 'package:ecomm_378/data/remote/models/product_model.dart';
import 'package:ecomm_378/data/remote/repositories/product_repo.dart';
import 'package:ecomm_378/ui/dashboard/bloc/product_event.dart';
import 'package:ecomm_378/ui/dashboard/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;

  ProductBloc({required this.productRepository})
    : super(ProductInitialState()) {
    on<ProductFetchEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        dynamic mData = await productRepository.fetchProducts();
        if (mData['status']) {
          ProductDataModel productDataModel = ProductDataModel.fromJson(mData);
          emit(ProductLoadedState(allProducts: productDataModel.data ?? []));
        } else {
          emit(ProductErrorState(errorMsg: mData['message']));
        }
      } catch (e) {
        emit(ProductErrorState(errorMsg: e.toString()));
      }
    });
  }
}
