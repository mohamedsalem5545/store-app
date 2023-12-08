import 'package:store/halper/api.dart';
import 'package:store/models/product_model.dart';

class UpdateProducateService {
  Future<productModel> updateProducate(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required int id,
      required String category}) async {
    print('peoduct id = $id');
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return productModel.fromjson(data);
  }
}
