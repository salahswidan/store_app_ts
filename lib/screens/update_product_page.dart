import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app_2/models/product_model.dart';
import 'package:store_app_2/services/update_product.dart';
import 'package:store_app_2/widget/custom_button.dart';
import 'package:store_app_2/widget/custom_textfield.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, category;

  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments
        as ProductModel; // i used it edit in the product data that i click on it
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomField(
                onClick: (data) {
                  productName = data;
                },
                hint: 'Product Name',
              ),
              SizedBox(
                height: 10,
              ),
              CustomField(
                onClick: (data) {
                  desc = data;
                },
                hint: 'description',
              ),
              SizedBox(
                height: 10,
              ),
              CustomField(
                inputType: TextInputType.number,
                onClick: (data) {
                  price = data;
                },
                hint: 'Price',
              ),
              SizedBox(
                height: 10,
              ),
              CustomField(
                onClick: (data) {
                  image = data;
                },
                hint: 'image',
              ),
              SizedBox(
                height: 10,
              ),
              // CustomField(
              //   onClick: (data) {
              //     category = data;
              //   },
              //   hint: 'category',
              // ),
              SizedBox(
                height: 350,
              ),
              CustomButon(
                text: 'Update',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct(product);
                    print("success");
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
        title: productName == null ? product.title : productName!,
        price: price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
