import 'package:crud_app/utils/delete_function.dart';
import 'package:flutter/material.dart';

import '../UI/Screen/Update_product_Screen.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product, required this.onRefresh,});

  final Product product;
  final Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Image.network(
              product.image ?? 'Unknown',
              width: 60,
              height: 60,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.image_not_supported, size: 60),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      product.productName ?? 'Unknown',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      )
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Product Code: ${product.productCode ?? 'Unknown'}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    'Quantity: ${product.quantity ?? 'Unknown'}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    'Price: ${product.unitPrice ?? 'Unknown'}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    'Total Price: ${product.totalPrice ?? 'Unknown'}',
                    style: const TextStyle(
                        color: Colors.lime,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.red.shade500,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      DeleteFunction.showDeleteConfirmation(
                        context: context,
                        id: product.id ?? '',
                        productName: product.productName ?? 'Unknown',
                        productCode: product.productCode ?? 'Unknown',
                        quantity: product.quantity?.toString() ?? 'Unknown',
                        price: product.unitPrice?.toString() ?? 'Unknown',
                        totalPrice: product.totalPrice?.toString() ?? 'Unknown',
                        imageUrl: product.image,
                        onDeleteSuccess: onRefresh,
                      );
                    },
                    icon: const Icon(Icons.delete, color: Colors.white),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pushNamed(
                          context,
                          UpdateProductScreen.name,
                          arguments: product
                      );
                    },
                    icon: const Icon(Icons.edit, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}