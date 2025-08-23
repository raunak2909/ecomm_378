import 'package:ecomm_378/data/remote/helper/api_helper.dart';
import 'package:ecomm_378/domain/constants/app_urls.dart';

class ProductRepository {
  ApiHelper apiHelper;

  ProductRepository({required this.apiHelper});

  Future<dynamic> fetchProducts() async {
    try {
      dynamic mData = await apiHelper.postApi(url: AppUrls.productUrl);
      return mData;
    } catch (e) {
      rethrow;
    }
  }
}
