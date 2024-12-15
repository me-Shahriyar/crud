import 'package:crud_app/UI/Screen/Product_Create_Screen.dart';
import 'package:crud_app/UI/Screen/Product_list_Screen.dart';
import 'package:crud_app/UI/Screen/Update_product_Screen.dart';
import 'package:crud_app/models/product.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == '/') {
          widget = const ProductListScreen();
        } else if (settings.name == ProductCreateScreen.name) {
          widget = const ProductCreateScreen();
        } else if (settings.name == UpdateProductScreen.name) {
          final Product product = settings.arguments as Product;
          widget = UpdateProductScreen(product: product);
        }

        return MaterialPageRoute(
          builder: (context) {
            return widget;
          },
        );
      },
    );
  }
}