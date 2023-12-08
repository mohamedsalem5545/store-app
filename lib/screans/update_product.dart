import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price, category;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    productModel product =
        ModalRoute.of(context)!.settings.arguments as productModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                    onChanged: (data) {
                      productName = data;
                    },
                    hintText: 'Product Name'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onChanged: (data) {
                      desc = data;
                    },
                    hintText: 'description'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    inputType: TextInputType.number,
                    onChanged: (data) {
                      price = data;
                    },
                    hintText: 'price'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: 'image'),
                SizedBox(
                  height: 50,
                ),
                CustomButon(
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                        await updateProduct(product);

                        print('sucess');
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                    text: 'update'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(productModel product) async {
    await UpdateProducateService().updateProducate(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
    isLoading = false;
  }
}
