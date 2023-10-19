import 'package:flutter/material.dart';
import 'package:idcamp_project/model/item.dart';
import 'package:idcamp_project/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ItemDetail extends StatelessWidget {
  final Item item;
  const ItemDetail({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 250, //mengatur tinggi
                width: double.infinity, //membuatnya mengikuti ukuran width
                child: Image.asset(
                  "images/${item.imgUrl.toString()}",
                  fit: BoxFit.fitWidth, //fitting width
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Text(
            item.name,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 24.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children: [
                      ItemVariables(
                          variable: "Price", value: item.price.toString()),
                      ItemVariables(
                          variable: "Stock", value: item.stock.toString()),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      provider.toggleCart(item);
                    },
                    icon: provider.isExist(item)
                        ? const Icon(Icons.shopping_cart)
                        : const Icon(Icons.shopping_cart_checkout),
                    label: const Text("Add to cart")),
                const Row(
                  children: [
                    Text(
                      "Description:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      child: Text(
                        item.description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemVariables extends StatelessWidget {
  final String variable, value;
  const ItemVariables({super.key, required this.variable, required this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(variable),
        ),
        const Expanded(
          flex: 0,
          child: Text(":"),
        ),
        Expanded(
          flex: 2,
          child: Text(value),
        ),
      ],
    );
  }
}
