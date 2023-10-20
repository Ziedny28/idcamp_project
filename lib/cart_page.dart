import 'package:flutter/material.dart';
import 'package:idcamp_project/model/item.dart';
import 'package:idcamp_project/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double total = 0;
  List<Item> checkOutItems = [];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    final items = provider.cartItems;

    bool isItemInCheckOut(Item item) {
      return checkOutItems.contains(item);
    }

    void toggleItemCheckOut(Item item) {
      if (!isItemInCheckOut(item)) {
        setState(() {
          checkOutItems.add(item);
          total += item.price;
        });
      } else {
        setState(() {
          checkOutItems.remove(item);
          total -= item.price;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Column(
              children: items
                  .map(
                    (item) => SizedBox(
                      height: 100,
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/${item.imgUrl.toString()}",
                                  ),
                                  alignment: Alignment.centerLeft,
                                )),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name.toString(),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Rp.${item.price.toString()}",
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  toggleItemCheckOut(item);
                                },
                                child: Icon(isItemInCheckOut(item)
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Text("Total: Rp.${total.toString()}")
          ],
        ),
      ),
    );
  }
}
