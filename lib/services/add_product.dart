import 'package:store_app_2/helper/api.dart';
import 'package:store_app_2/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'category': category,
        'image': image,
      },
    );
    return ProductModel.fromJson(data);
  }
}
